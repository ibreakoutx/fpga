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
  
