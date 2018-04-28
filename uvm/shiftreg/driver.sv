`include "driver.svh"

function driver::new(string name, uvm_component parent);
      super.new(name,parent);
endfunction
  
  function void driver::build_phase( uvm_phase phase);
      super.build_phase(phase);
      uvm_resource_db #(virtual shiftreg_drv_intf #(.width(8)) )::read_by_name("driver", "intf", drv,null);
      uvm_resource_db #(driver_channel)::read_by_name("driver", "channel", drv_chan,null);
      uvm_resource_db #(mailbox)::read_by_name("driver","mailbox",drv_mbox,null);
      uvm_resource_db #(heartbeat)::read_by_name("top","hbt",hbt,null);                  
  endfunction

function void driver::connect_phase(uvm_phase phase) ;
      super.connect_phase(phase);
endfunction

  task driver::main_phase(uvm_phase phase);
      fork
	 forever
	   begin
	      drv_mbox.get(data);
	      //drv_chan.get(data);	      
	      @(drv.p_clk);
	      drv.valid_in = data[8] ;
	      drv.din = data[7:0];
	      hbt.tick();
	   end
      join_none
  endtask // reset_phase

