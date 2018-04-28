

interface shiftreg_mon_intf #(parameter int width=8) (input clk);

logic [width-1:0] dout ;
logic valid_out ;

default clocking p_clk @(posedge clk);
endclocking

endinterface
  
