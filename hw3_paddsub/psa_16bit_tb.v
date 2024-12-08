module psa_16bit_tb();

reg [15:0] a;
reg [15:0] b;
wire [15:0] sum;
wire error;

psa_16bit idut(.a(a), .b(b), .sum(sum), .error(error));
initial begin
a = 16'b0101_0101_0101_0101;
b = 16'b0110_0110_0110_0110;
#15
if(sum[3:0] === a[3:0]+b[3:0] && sum[7:4] === a[7:4]+b[7:4] && sum[11:8] === a[11:8]+b[11:8] && sum[15:12] === a[15:12]+b[15:12] && error===1)begin
// if(sum === 16'b1011_1011_1011_1011 && error === 1) begin
$display("PSA successfull");
$stop;
end

else begin
$display("PSA unsuccessfull");
$stop;
end

end
endmodule
