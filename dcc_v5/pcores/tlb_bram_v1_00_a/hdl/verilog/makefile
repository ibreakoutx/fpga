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

isim/work/tlb_bram.v.compiled: tlb_bram.v 
	 vlogcomp.exe -d TEST   tlb_bram.v 
	 touch isim/work/tlb_bram.v.compiled 

isim/work/smem.v.compiled: smem.v 
	 vlogcomp.exe -d TEST   smem.v 
	 touch isim/work/smem.v.compiled 

tb.exe: isim/work/tb.v.compiled  isim/work/tlb_bram.v.compiled  isim/work/smem.v.compiled  
	 fuse -top tb  -o tb.exe
