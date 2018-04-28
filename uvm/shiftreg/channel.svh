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
  
