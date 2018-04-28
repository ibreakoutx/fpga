SRC = top.sv \
	shiftreg.sv \
	shiftreg_drv_intf.sv \
	shiftreg_mon_intf.sv \
	heartbeat.sv \
	mypkg.sv \
	driver.sv \
	monitor.sv \
	mytest.sv 

build: simv

simv: $(SRC)
	vcs -sverilog -debug_pp -ntb_opts uvm-1.1 -timescale="1ns/1ns" $(SRC)

run: simv 
	./simv -l simv.log +UVM_TESTNAME=$(TEST)

waves: vcdplus.vpd
	dve -vpd vcdplus.vpd

clean:
	rm -rf simv* csrc* *.vpd *~
