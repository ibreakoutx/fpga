//--------------------------------------------------------------
//--------------------------------------------------------------
module top ;

   bit clk ;
   bit rst ;
   
   initial forever #5 clk = ~clk ;

   shiftreg_drv_intf #(.width(8)) drv (clk);
   shiftreg_mon_intf #(.width(8)) mon (clk);
   
   shiftreg #(.width(8)) dut (.clk(clk),
			     .rst(rst),
			     .din(drv.din),
			     .valid_in(drv.valid_in),
			     .dout(mon.dout),
			     .valid_out(mon.valid_out)
			     );

   initial
     begin
	$vcdpluson ;
	uvm_resource_db #(virtual shiftreg_drv_intf #(.width(8)) )::set("driver", "intf", drv,null);
	uvm_resource_db #(virtual shiftreg_mon_intf #(.width(8)) )::set("monitor", "intf", mon,null);
	#10000 ;
     end

initial
  run_test();
   
endmodule // top
//--------------------------------------------------------------
//--------------------------------------------------------------
module shiftreg #(
		  parameter int width=8
)
( input clk,rst,
  input [width-1:0] din,
  input valid_in,
  output logic [width-1:0] dout,
  output logic  valid_out
  );

   logic [width:0] sreg[0:3];
   
   always @(posedge clk)
   if (rst)
     for (int i=0;i<4;i=i+1)
       sreg[i] <= 'b0;
   else
     begin
	sreg[0] <= {valid_in,din};
	  
	for (int i=0;i<3;i=i+1)
	  sreg[i+1] <= sreg[i];
	
	{valid_out,dout} <= sreg[3];
     end
	  
endmodule // shiftreg
//--------------------------------------------------------------
//--------------------------------------------------------------
interface shiftreg_drv_intf #(parameter int width=8) (input clk);

logic [width-1:0] din ;
logic valid_in ;

default clocking p_clk @(posedge clk);
endclocking

endinterface
//--------------------------------------------------------------
//--------------------------------------------------------------//   
interface shiftreg_mon_intf #(parameter int width=8) (input clk);

logic [width-1:0] dout ;
logic valid_out ;

default clocking p_clk @(posedge clk);
endclocking

endinterface
//--------------------------------------------------------------
//--------------------------------------------------------------
package mypkg;
//import uvm_pkg::*;

`include "channel.svh"
typedef channel #(logic [8:0]) driver_channel ;

//`include "heartbeat.sv"

endpackage
//--------------------------------------------------------------
//--------------------------------------------------------------  
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
//--------------------------------------------------------------
//--------------------------------------------------------------
`ifndef __HEARTBEAT__
`define __HEARTBEAT__

class heartbeat extends uvm_monitor ;

  `uvm_component_utils(heartbeat)

  bit alive ;
  time pulse_interval ;

  extern function new(string name, uvm_component parent);

  extern function void build_phase( uvm_phase phase);

  extern function void connect_phase(uvm_phase phase) ;

  extern task tick();

  extern task main_phase(uvm_phase phase);

endclass

`endif //  `ifndef __HEARTBEAT__
//--------------------------------------------------------------
//--------------------------------------------------------------
`include "heartbeat.svh"

  function heartbeat::new(string name, uvm_component parent);
      super.new(name,parent);
      alive =  1'b1 ;
      pulse_interval = 1000ns ;
  endfunction
  
  function void heartbeat::build_phase( uvm_phase phase);
      super.build_phase(phase);
  endfunction

  function void heartbeat::connect_phase(uvm_phase phase) ;
      super.connect_phase(phase);
  endfunction

  task heartbeat::tick();
      alive = 1'b1 ;
  endtask // tick

  task heartbeat::main_phase(uvm_phase phase);
      phase.raise_objection(this);

      while (alive)
	begin
	   alive = 1'b0;
	   #(pulse_interval);
	end
      
     phase.drop_objection(this);       
  endtask // reset_phase
//--------------------------------------------------------------
//--------------------------------------------------------------  
`ifndef __CHANNEL__
`define __CHANNEL__

class channel #(type T=int) ;

mailbox req ;
mailbox rsp ;
string name;

function new (string name );
      req = new();
      rsp = new();
      this.name = name;
endfunction // new

task put (T _in) ;
      int tmp ;
      req.put(_in);
      rsp.get(tmp);
endtask // put

task get (ref T value);
      rsp.put(1);
      req.get(value);
endtask // T

endclass
  
`endif //  `ifndef __CHANNEL__
//--------------------------------------------------------------
//--------------------------------------------------------------
`ifndef __MONITOR_SVH__
`define __MONITOR_SVH__

import mypkg::*;

class monitor extends uvm_monitor ;

  `uvm_component_utils(monitor)
  heartbeat hbt ;

  virtual shiftreg_mon_intf #(.width(8)) mon ;

  extern function new(string name, uvm_component parent);
  
  extern function void build_phase( uvm_phase phase);

  extern function void connect_phase(uvm_phase phase) ;

  extern task main_phase(uvm_phase phase);

endclass

`endif //  `ifndef __MONITOR_SVH__
//--------------------------------------------------------------
//--------------------------------------------------------------  
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
//--------------------------------------------------------------
//--------------------------------------------------------------
`ifndef __DRIVER_SVH__
`define __DRIVER_SVH__

import mypkg::*;

class driver extends uvm_driver ;

`uvm_component_utils(driver)

 virtual shiftreg_drv_intf #(.width(8)) drv ;
 driver_channel drv_chan ;
 logic [8:0] data ;
 mailbox drv_mbox ;
 heartbeat hbt ;

extern function new(string name, uvm_component parent);
  
extern function void build_phase( uvm_phase phase);

extern function void connect_phase(uvm_phase phase) ;

extern task main_phase(uvm_phase phase);

endclass

`endif //  `ifndef __DRIVER_SVH__
//--------------------------------------------------------------
//--------------------------------------------------------------      
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
//--------------------------------------------------------------
//--------------------------------------------------------------      
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
