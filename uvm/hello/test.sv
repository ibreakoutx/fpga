program test ;

byte queue[$];
byte queue2[$];

byte dynamic_array[];
byte dynamic_array2[];

byte assoc_array[int];
byte assoc_array2[int];

initial
  begin
     $display("hello_world");

     for (int i=0;i<10;i++)
       queue[i] = i;

     dynamic_array = new[10];
     for (int i=0;i<10;i++)
       dynamic_array[i] = i;

     for (int i=0;i<10;i++)
       assoc_array[i] = i;     

     queue_ref_copy( queue );

     queue.delete(5);     
     foreach( queue[i] )
     $display("queue[%d] = %d",i,queue[i]);

     dynamic_array.delete();
     dynamic_array_ref_copy( dynamic_array );
     foreach( dynamic_array[i] )
     $display("dynamic_array[%d] = %d",i,dynamic_array[i]);

     assoc_array.delete(9);
     assoc_array_ref_copy( assoc_array );     
     foreach( assoc_array[i] )
     $display("assoc_array[%d] = %d",i,assoc_array[i]);


     
     
  end

     task assoc_array_ref_copy(ref byte assoc_array2[int]);
       assoc_array2[5] = 127 ;
       foreach( assoc_array2[i] )
       $display("assoc_array2[%d] = %d",i,assoc_array2[i]);
     endtask // assoc_array_copy

     task dynamic_array_ref_copy(ref byte dynamic_array2[]);
       dynamic_array2[5] = 127 ;
       foreach( dynamic_array2[i] )
       $display("dynamic_array2[%d] = %d",i,dynamic_array2[i]);
     endtask // assoc_array_copy   

     task queue_ref_copy(ref byte queue2[$]);
       queue2[5] = 127 ;
       foreach( queue2[i] )
       $display("queue2[%d] = %d",i,queue2[i]);
     endtask // queue_copy
     
   
endprogram

  
