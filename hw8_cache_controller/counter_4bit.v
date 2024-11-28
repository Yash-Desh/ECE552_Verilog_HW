`include "dff.v"
module counter_4bit (
    input clk,
    input rst,
    input wen,
    input d
);

wire [3:0] q;

dff ff0(.q(q[0]), .d(d), .wen(wen), .clk(clk), .rst(rst));
dff ff1(.q(q[1]), .d(d), .wen(wen), .clk(clk), .rst(rst));
dff ff2(.q(q[2]), .d(d), .wen(wen), .clk(clk), .rst(rst));
dff ff3(.q(q[3]), .d(d), .wen(wen), .clk(clk), .rst(rst));
    
endmodule