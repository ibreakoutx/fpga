import uvm_pkg::* ;

`include "ethernet_pkt.sv"

module hello_world;

   logic clk ;
   initial clk = 0;
   always clk = #5 ~clk ;
   
   class my_test extends uvm_test ;

       `uvm_component_utils(my_test)
    
    function new(string name, uvm_component parent);
      super.new(name,parent);
      `uvm_info("", "Called my_test::new", UVM_NONE);
    endfunction: new
    
    task reset_phase(uvm_phase phase);
      phase.raise_objection(this);
      repeat (1000) @(posedge clk);
      `uvm_info("RESET","Hello World",UVM_NONE);      
      phase.drop_objection(this);
    endtask // reset_phase

    task main_phase(uvm_phase phase);
      ethernet_pkt pkt = new("pkt");
      byte unsigned pbytes[];
      bit unsigned  bstream [];
      int unsigned p_int[];
      
      `uvm_info("RUN","Hello World",UVM_NONE);
      pkt.randomize();

      uvm_default_packer.big_endian = 1;
      pkt.pack_bytes(pbytes);
      pkt.pack( bstream );
      pkt.pack_ints( p_int );      
      
      pkt.print();
      
      foreach ( pbytes[i] )
      `uvm_info("RUN",$sformatf("pbyte[%d] = %x",i,pbytes[i]),UVM_NONE);
      foreach ( p_int[i] )
      `uvm_info("RUN",$sformatf("pint[%d] = %x",i,p_int[i]),UVM_NONE);      

      foreach ( bstream[i] ) 
       $write("%b", bstream[i]);
      
      $write("\n");
      
      foreach ( bstream[i] )   
       $write("%d", i);

      uvm_default_packer.big_endian = 0;
      pkt.pack_bytes(pbytes);
      pkt.pack( bstream );
      pkt.pack_ints( p_int );      
      
      pkt.print();
      
      foreach ( pbytes[i] )
      `uvm_info("RUN",$sformatf("pbyte[%d] = %x",i,pbytes[i]),UVM_NONE);
      foreach ( p_int[i] )
      `uvm_info("RUN",$sformatf("pint[%d] = %x",i,p_int[i]),UVM_NONE);
      
      foreach ( bstream[i] ) 
       $write("%b", bstream[i]);
      
      $write("\n");
      
      foreach ( bstream[i] )   
       $write("%d", i);      

      for (int i=0;i<100;i++)
	pbytes[i] = i;
      
      foreach ( pbytes[i] )
      `uvm_info("RUN",$sformatf("pbyte[%d] = %x",i,pbytes[i]),UVM_NONE);
      
    endtask   

   endclass

     initial
       run_test("my_test");
   

endmodule // top
