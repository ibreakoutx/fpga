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
  
