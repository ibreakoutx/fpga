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
  
