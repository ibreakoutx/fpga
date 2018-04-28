run: build
	 tb.exe -tclbatch run.tcl
build: tb.exe
clean:
	 rm -rf isim/work
	 rm *.exe
waves:
	 gtkwave dump.vcd&
isim/work/tb.v.compiled: tb.v 
	 vlogcomp.exe -d TEST   tb.v 
	 touch isim/work/tb.v.compiled 

isim/work/test_fsl.v.compiled: test_fsl.v 
	 vlogcomp.exe -d TEST   test_fsl.v 
	 touch isim/work/test_fsl.v.compiled 

tb.exe: isim/work/tb.v.compiled  isim/work/test_fsl.v.compiled  
	 fuse -top tb  -o tb.exe
