`include "full_adder_1bit.v"
// `include ""
module full_adder_1bit_tb();
  // reg is the input
  reg a, b, cin;
  // wire is the output
  wire sum, cout;
  // open full_adder_1bit.v as idut
  full_adder_1bit idut(cout, a, b, cin, sum);


  initial
  begin
    $dumpfile("test1.vcd");
    $dumpvars(0, idut);
  end

  initial
  begin
    // assign random values to a, b, cin
    a = $random%2;
    b = $random%2;
    cin = 0;
    // delay 15 for the value to assign to gates
    #15
     if(sum === a+b)
     begin
       // $display() is like printf in c
       $display("1-bit addition successfull");
               $finish;
     end
     else
     begin
       $display("1-bit addition unsuccessfull");
       $finish;
     end
   end
 endmodule
