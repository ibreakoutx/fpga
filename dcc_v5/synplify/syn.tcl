# Called at the end of each run.
proc syn_on_end_run {runName run_dir implName} {


		
#set env [get_env SYN_EDK_BMM_HANDLE]
#if { $env == 1 } {

puts "************ BMM Conversion in Progress *****************"
set prjFile [project -file]
set prjFileId [open $prjFile "r"]
set flag 0
set done 0

while { ![eof $prjFileId] } {
	gets $prjFileId line
	if { [regexp {set_option \-job +([^ ]*) -add par} $line dummy parName] } {
	 
	   }

	if { [regexp "add_file.*\/.*\.bmm" $line dummy] } {
	   regsub ".*\/" $dummy "" BmmName 
       
	   }
}

close $prjFileId
set impName [impl -dir]
set bmmFile "$impName/$parName/$BmmName"
set bmmFileID [open $bmmFile "r"]

set bmmFileWrite "$impName/$parName/edkBmmFile.bmm"
set bmmFileIDWrite [open $bmmFileWrite "w"]

set value {}
set valList {}
set newval {}

while { ![eof $bmmFileID] } {
	gets $bmmFileID line
	set val {}
	if { [regexp {([a-z].*) +\[.*\;$} $line dummp val] } {
		regsub -all / $val "\." mod
		set mod "\*$mod"
		lappend valList $mod
		set view [find -hier -flat -inst $mod]
		set name [get_prop -prop hier_rtl_name $view]
		regsub -all {\.} $name / name
		regsub $val $line $name newval
		puts $bmmFileIDWrite $newval
	} else {
		puts $bmmFileIDWrite $line
	}
}

file_close
close $bmmFileID 
close $bmmFileIDWrite 

puts "************ BMM Conversion Done *****************"
}
}
