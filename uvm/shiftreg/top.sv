
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
