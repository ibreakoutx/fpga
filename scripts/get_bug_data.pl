#!/usr/bin/perl

####!/cygdrive/c/xampp/perl/bin/perl

###/tool/pandora/bin/perl


# titlebytes - find the title and size of documents 
use LWP::UserAgent; 
use HTTP::Request; 
use HTTP::Response; 
use URI::Heuristic;
use HTTP::Request::Common qw( POST );
#use HTML::FormatText;
#use HTML::Parse;


#my $raw_url = shift                      or die "usage: $0 url\n"; 
my $raw_url = 'http://bugs.amd.com/ubts/prod/buglist.cgi?query_format=advanced&short_desc_type=anywordssubstr&short_desc=DFT&long_desc_type=substring&bug_file_loc_type=allwordssubstr&status_whiteboard_type=allwordssubstr&keywords_type=nowords&classification=BobcatCore&product=Bobcat%20RTL&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&emailassigned_to1=1&emailtype1=substring&emailassigned_to2=1&emailreporter2=1&emailqa_contact2=1&emailcc2=1&emailtype2=substring&bugidtype=include&chfieldfrom=&chfieldto=Now&limit=&field0-0-0=noop&type0-0-0=noop&ctype=csv';

my $url = URI::Heuristic::uf_urlstr($raw_url);
$| = 1;                                  # to flush next line 
printf "%s =>\n\t", $url;

my $ua = LWP::UserAgent->new(); 
$ua->agent("Schmozilla/v9.14 Platinum"); # give it time, it'll get there

my %a = ( '', '' );
my $form_ref= [ %a ];
my $req = POST $url, $form_ref;
my $cont = $ua->request($req);

my $req = HTTP::Request->new(GET => $url); # perplex the log analysers
my $response = $ua->request($req);

my @bugdata;
my $buglist;

if ($response->is_error()) {
     printf " %s\n", $response->status_line;
 } else {
     my $count;
     my $bytes;
     my $content = $response->content();
     $buglist = $content;
     $bytes = length $content;
     $count = ($content =~ tr/\n/\n/);
     printf "%s (%d lines, %d bytes)\n", $response->title(), $count, $bytes; 
 } 

my $today = `date +%m-%d-%y`;
chomp($today);
my $file = $today . ".bugs.csv";

my %bugbucket;

$buglist =~ s/\"//g;
@bugdata = split(/\n/, $buglist);

$bugbucket{'NEW'} = 0;
$bugbucket{'ASSIGNED'}  = 0;
$bugbucket{'REOPENED'}  = 0;
$bugbucket{'RESOLVED'}  = 0;
$bugbucket{'CLOSED'}    = 0;
$bugbucket{'VERIFIED'}  = 0;

open(FILE,">$file");
for (my $i = 1; $i < @bugdata; $i = $i+1) {
  my @bugfields = split(/\,/, $bugdata[$i]);
  print FILE "$bugdata[$i]\n";
  $bugbucket{$bugfields[3]} = $bugbucket{$bugfields[3]} + 1;
}
close(FILE);

foreach my $bugstat (keys %bugbucket) {
   print "$bugstat -> $bugbucket{$bugstat}\n";
}

open (HTML, ">>data.html");
print HTML "<TR><TD>$today</TD><TD>$bugbucket{'NEW'}</TD><TD>$bugbucket{'ASSIGNED'}</TD><TD>$bugbucket{'REOPENED'}</TD><TD>$bugbucket{'RESOLVED'}</TD><TD>$bugbucket{'CLOSED'}</TD></TR>\n";
close(HTML);


