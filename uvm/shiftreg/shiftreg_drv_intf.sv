
interface shiftreg_drv_intf #(parameter int width=8) (input clk);

logic [width-1:0] din ;
logic valid_in ;

default clocking p_clk @(posedge clk);
endclocking

endinterface
  
