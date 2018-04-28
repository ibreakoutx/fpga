import mypkg::*;

`include "heartbeat.svh"
`include "driver.svh"
`include "monitor.svh"

class my_test extends uvm_test ;

`uvm_component_utils(my_test)

driver  drv ;
monitor mon ;
driver_channel drv_chan ;
mailbox drv_mbox ;
heartbeat hbt ;
logic [8:0] data ;

function new(string name, uvm_component parent);
      super.new(name,parent);
      `uvm_info("", "Called my_test::new", UVM_NONE);
      data = 0;
endfunction: new

    function void  build_phase(uvm_phase phase);
      super.build_phase(phase);
      drv = driver::type_id::create("drv",this);
      mon = monitor::type_id::create("mon",this);
      hbt = heartbeat::type_id::create("hbt",this);
      
      drv_chan = new("drv_chan");
      drv_mbox = new(1);
      
      uvm_resource_db #(driver_channel)::set("driver","channel",drv_chan,null);
      uvm_resource_db #(mailbox)::set("driver","mailbox",drv_mbox,null);
      uvm_resource_db #(heartbeat)::set("top","hbt",hbt,null);
      uvm_resource_db #(driver)::set("top","drv",drv,null);                  

      `uvm_info("RUN","Hello World",UVM_NONE);
    endfunction
    
    task main_phase(uvm_phase phase);
      `uvm_info("RUN","Hello World",UVM_NONE);
      repeat (100)
	begin
	   //drv_chan.put($random);
	   data = $random;
	   drv_mbox.put(data);
           `uvm_info("MAIN",$sformatf("mbox_put::Data=%x, valid=%b",
				      data[7:0],data[8]),UVM_NONE);
	   //data = data +  1;
      	   //drv_mbox.put({1'b1,data});
	end
    endtask // main_phase

 endclass

