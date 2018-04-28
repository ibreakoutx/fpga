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

isim/work/aes_accel.v.compiled: aes_accel.v 
	 vlogcomp.exe -d TEST   aes_accel.v 
	 touch isim/work/aes_accel.v.compiled 

isim/work/fifo_rd_32_to_128.v.compiled: fifo_rd_32_to_128.v 
	 vlogcomp.exe -d TEST   fifo_rd_32_to_128.v 
	 touch isim/work/fifo_rd_32_to_128.v.compiled 

isim/work/fifo_wr_128_to_32.v.compiled: fifo_wr_128_to_32.v 
	 vlogcomp.exe -d TEST   fifo_wr_128_to_32.v 
	 touch isim/work/fifo_wr_128_to_32.v.compiled 

isim/work/aes_cipher_top.v.compiled: aes_cipher_top.v 
	 vlogcomp.exe -d TEST   aes_cipher_top.v 
	 touch isim/work/aes_cipher_top.v.compiled 

isim/work/aes_key_expand_128.v.compiled: aes_key_expand_128.v 
	 vlogcomp.exe -d TEST   aes_key_expand_128.v 
	 touch isim/work/aes_key_expand_128.v.compiled 

isim/work/aes_rcon.v.compiled: aes_rcon.v 
	 vlogcomp.exe -d TEST   aes_rcon.v 
	 touch isim/work/aes_rcon.v.compiled 

isim/work/aes_sbox.v.compiled: aes_sbox.v 
	 vlogcomp.exe -d TEST   aes_sbox.v 
	 touch isim/work/aes_sbox.v.compiled 

tb.exe: isim/work/tb.v.compiled  isim/work/aes_accel.v.compiled  isim/work/fifo_rd_32_to_128.v.compiled  isim/work/fifo_wr_128_to_32.v.compiled  isim/work/aes_cipher_top.v.compiled  isim/work/aes_key_expand_128.v.compiled  isim/work/aes_rcon.v.compiled  isim/work/aes_sbox.v.compiled  
	 fuse -top tb  -o tb.exe
