#!/usr/bin/perl

#use strict ;

use LWP ;
use HTTP::Request; 
use HTTP::Response; 
use HTML::TokeParser ;
use HTML::TreeBuilder 3;
use HTTP::Cookies;

#my $url ="http://enlil.amd.com:4050/module_instances/list?per_page=50";
my $BASEURL = "http://enlil.amd.com:4050";
my $url = $BASEURL."/module_instances/list?page=1";
my $covgrphash_ref;

#print $url,"\n";

my $ua = LWP::UserAgent->new(); 
my $cookie_jar = HTTP::Cookies->new(
				    file => "/tmp/cookies.lwp" ,
				    autosave => 1,
				    );
$ua->cookie_jar( $cookie_jar ) ;
$ua->agent("Schmozilla/v9.14 Platinum"); # give it time, it'll get there

my $req = HTTP::Request->new(GET => $url); # perplex the log analysers
$req->authorization_basic('vsananda', 'DingleBell2');

my $response = $ua->request($req);

my $content = $response->content();

open (CFH, ">fcov_report.out");
print CFH $content ;
close(CFH);

my $root = HTML::TreeBuilder->new();
$root->parse( $content ) ;
$root->eof();  # done parsing for this tree

@pages = @{&get_pages($root)};

#Erase tree, because got all page numbers.
$root->delete;

#For testing
#@pages = (1);

my @allcovgrplist = ();
foreach my $page ( @pages ) {
    print $page,"\n";
#Process content for each page
#subroutine here

#1. Submit url with request for $page
#Build url with page in argument
    $url = $BASEURL."/module_instances?page=".$page ;

#2. Get response
    $content = &get_content($ua,$url);
    $covgrplist_ref = &find_all_rows($content);
    push @allcovgrplist, @$covgrplist_ref;
}

foreach my $covgrp ( @allcovgrplist ) {
    print "+++ Begin CovGrp ++++\n";
    while ( my ($key, $value) = each( %{$covgrp} ) )  {
	print "$key => $value\n";
	if ( ref($value) ) {
	    foreach my $covpt ( @$value ) {
		while( my ($p_key,$p_value) = each( %{$covpt} ) )  {
		    print "\t$p_key => $p_value\n" ;	    
		}
	    }
	}
    }
    print "--- End   CovGrp ----\n\n";
}

#Print out covgrphash
#while ( my ($key, $value) = each( %{$covgrphash_ref} ) )  {
#    print "$key => $value\n";
#    if ( ref($value) ) {
#	while( my ($p_key,$p_value) = each( %{$value} ) )  {
#	    print "\t$p_key => $p_value\n" ;
#	}
#    }
#}

exit;

#############################################################################
# Subroutines
#############################################################################

sub find_all_rows {
    my $content = shift ;

    my $root = HTML::TreeBuilder->new();
    $root->parse( $content ) ;
    $root->eof();

#Find all the rows
    my @rows = $root->find_by_tag_name('tr');
    
    my @idx2key ;
    $idx2key[0] = "name";
    $idx2key[1] = "grade" ;
    $idx2key[2] = "numcov" ;
    
    my @covgrplist = () ;

#Foreach row, grab all the table data items.
    foreach my $node ( @rows ) {
	my @items = $node->find_by_tag_name('td');
	
	my $idx = 0;
	my %covgrphash = () ;
	foreach my $item (@items) {
	    #print $item->as_text(),"\n" ;

	    $covgrphash{$idx2key[$idx]} = $item->as_text();
	    $idx++;
	    $idx = 0 if ($idx == 3);
	    
	    my @covpturls = $item->find_by_tag_name("a");
	    if ( defined($covpturls[0]) ) {
		$url =  $BASEURL.$covpturls[0]->attr("href") ;
		$covgrphash{"covpts"} = &find_all_covpts($ua,$url);
	    }
	}
	push @covgrplist, \%covgrphash ;
	#print "++++++++++++++++++++++++++++++++++\n";
    }
    return \@covgrplist ;
}#End sub
    
#For a given covergroup url in the sauber browser
#return all the coverpoint information
sub find_all_covpts {
    my $ua = shift; 
    my $url = shift ;

    my @idx2key = ();
    $idx2key[0]="name";
    $idx2key[1]="is_cross";
    $idx2key[2]="is_register";
    $idx2key[3]="grade";
    $idx2key[4]="numbins";
    
    my $content = &get_content($ua,$url);
    
    #Create new tree
    my $croot = HTML::TreeBuilder->new();
    $croot->parse( $content ) ;
    $croot->eof();

    my @pages = @{&get_pages( $croot)};
    $croot->delete();

    my @covptlist = () ;

    foreach my $page ( @pages ) {
	#print "\t covpt page : $page\n";
	my $pageurl = $BASEURL."/items/list?page=".$page ;
	#print "\t $pageurl \n";
	$content = &get_content($ua, $pageurl);
	$croot = HTML::TreeBuilder->new();
	$croot->parse( $content ) ;
	$croot->eof();

	my @rows = $croot->find_by_tag_name('tr');
	
	foreach my $node ( @rows ) {
	    my @coverpoints = $node->find_by_tag_name('td');

	    my $idx=0;
	    my %covpthash = ();
	    foreach my $coverpoint (@coverpoints) {	
		if ( $idx < 5 ) {
		    #print "\t $idx => ", $coverpoint->as_text(),"\n";
		    $covpthash{$idx2key[$idx]} = $coverpoint->as_text();
		}
		$idx++;
		$idx = 0 if ($idx == 7);
	    }

	    push @covptlist, \%covpthash ;
	}
	$croot->delete();
    }
    return \@covptlist ;
}

sub get_content {
    my $ua = shift;
    my $url = shift ;

    my    $req = HTTP::Request->new(GET => $url);

    #TODO:Parameterize username and password
    $req->authorization_basic('vsananda', 'DingleBell2');

    my    $response = $ua->request($req);
    $content = $response->content();

    return $content ;
}

sub get_pages {
    my $root = shift ;
    
    my @pages = ();
    my $h4node  = $root->find_by_tag_name('h4');
    my $divnode = $h4node->find_by_tag_name('div');

    my $raw_page_string = $divnode->as_text();
    my @raw_pages = split /\s/,$raw_page_string ;

    foreach my $page (@raw_pages)  {
	if ( $page =~ /[0-9]+/ ) {
	    push @pages, $page;
	}
    }
    return \@pages ;
}
