`include "full_adder_1bit.v"

module 16_bit_adder(input [15:0] x, input [15:0] y, output [15:0]sum, output cout);

// couts for the individual 1-bit full adders
wire [15:0] n1;

// set cin of 1st full adder = 0

full_adder_1bit(x[0], y[0], 1'b0, sum[0], n1[0]);
full_adder_1bit(x[1], y[1], n1[0], sum[1], n1[1]);
full_adder_1bit(x[2], y[2], n1[1], sum[2], n1[2]);
full_adder_1bit(x[3], y[3], n1[2], sum[3], n1[3]);

full_adder_1bit(x[4], y[4], n1[3], sum[4], n1[4]);
full_adder_1bit(x[5], y[5], n1[4], sum[5], n1[5]);
full_adder_1bit(x[6], y[6], n1[5], sum[6], n1[6]);
full_adder_1bit(x[7], y[7], n1[6], sum[7], n1[7]);

full_adder_1bit(x[8], y[8], n1[7], sum[8], n1[8]);
full_adder_1bit(x[9], y[9], n1[8], sum[9], n1[9]);
full_adder_1bit(x[10], y[10], n1[9], sum[10], n1[10]);
full_adder_1bit(x[11], y[11], n1[10], sum[11], n1[11]);

full_adder_1bit(x[12], y[12], n1[11], sum[12], n1[12]);
full_adder_1bit(x[13], y[13], n1[12], sum[13], n1[13]);
full_adder_1bit(x[14], y[14], n1[13], sum[14], n1[14]);
full_adder_1bit(x[15], y[15], n1[14], sum[15], n1[15]);

assign cout = n1[15];

endmodule