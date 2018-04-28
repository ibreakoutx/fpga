`include "monitor.svh"

function monitor::new(string name, uvm_component parent);
      super.new(name,parent);
endfunction
  
function void monitor::build_phase( uvm_phase phase);
      super.build_phase(phase);
      uvm_resource_db#(virtual shiftreg_mon_intf #(.width(8)) )::read_by_name("monitor", "intf", mon,null);
      uvm_resource_db#(heartbeat)::read_by_name("top","hbt",hbt,null);                  
endfunction

function void monitor::connect_phase(uvm_phase phase) ;
      super.connect_phase(phase);
endfunction

task monitor::main_phase(uvm_phase phase);
      fork
	 forever
	   begin
	      @(mon.p_clk);
	      if ( mon.valid_out == 1 )
		begin
		`uvm_info("MONITOR",$sformatf("dataout = %x",mon.dout), UVM_NONE);
		 hbt.tick();
		end
	   end
     join_none
endtask 

