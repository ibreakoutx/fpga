class ethernet_pkt extends uvm_sequence_item ;

rand bit [3:0] preamble_1;
rand bit [3:0] preamble_2;
rand byte sa ;
rand byte da ;
rand byte ftype ;

`uvm_object_utils_begin(ethernet_pkt)
`uvm_field_int( preamble_1, UVM_ALL_ON | UVM_NOPACK );
`uvm_field_int( preamble_2, UVM_ALL_ON | UVM_NOPACK );
`uvm_field_int( sa, UVM_ALL_ON | UVM_NOPACK );
`uvm_field_int( da, UVM_ALL_ON | UVM_NOPACK );
`uvm_field_int( ftype, UVM_ALL_ON | UVM_NOPACK );
`uvm_object_utils_end

function new(string name="ethernet_pkt");
      super.new(name);
endfunction // new

function void do_pack( uvm_packer packer);
      super.do_pack(packer);
//      foreach( preamble[i] )
//        packer.pack_field_int( preamble[i] , $bits(preamble[i]) );
        packer.pack_field_int( preamble_1 , $bits(preamble_1) );
        packer.pack_field_int( preamble_2 , $bits(preamble_2) );      
        packer.pack_field_int( sa , $bits(sa) );
      packer.pack_field_int( da , $bits(da) );
      packer.pack_field_int( ftype , $bits(ftype) );      
endfunction // void

endclass
  
