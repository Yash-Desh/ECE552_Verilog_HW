`include "addsub_4bit.v"

module addsub_4bit_tb();
// reg is the input
reg [3:0]a;
reg [3:0]b;
reg is_sub;
// wire is the output
wire [3:0]sum; 
wire [3:0]cout;
wire ovfl;
// open addsub_4bit.v as idut
addsub_4bit idut(.a(a), .b(b), .is_sub(is_sub), .sum(sum), .cout(cout), .ovfl(ovfl));
initial begin
// assign random values to a, b
a = $random%16; 
b = $random%16; 
is_sub = 0;
// delay 15 for the value to assign to gates
#15
if(sum === a+b) begin
// $display() is like printf in c
$display("%d", sum);
$display("4-bit addition successfull");

end
else begin
$display("%d", sum);
$display("4-bit addition unsuccessfull");
$stop;
end

#15
is_sub =1;
#15
if(sum ===a-b)begin
$display("%d", sum);
$display("4-bit subtraction successfull");
$stop;
end
else begin
$display("%d", sum);
$display("4-bit subtraction unsuccessfull");
$stop;
end


end
endmodule