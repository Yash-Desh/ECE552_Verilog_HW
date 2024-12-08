module shifter_16bit_tb();
reg [15:0] shift_in; 
reg [3:0] shift_val; 
reg mode;
reg [15:0] t;

wire [15:0]shift_out;
shifter_16bit idut(.shift_in(shift_in), .shift_val(shift_val), .mode(mode), .shift_out(shift_out));
initial begin
shift_in = 16'b1011_1011_1010_1001;
shift_val = 4'b0011;
mode =0;
#15

if(shift_out=== shift_in<<shift_val && mode===0) begin
$display("sll successful");
end
else begin
$display("sll unsuccessful");
end
mode=1;
#15


if(shift_out=== 16'b1111_0111_0111_0101) begin
$display("sra successful");
$stop;
end
else begin
$display("sra unsuccessful");
$stop;
end
end
endmodule

