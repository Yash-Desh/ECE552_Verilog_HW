`include "bit_cell.v"
module register(
  input clk,                    // clk signal
  input rst,                    // synchronous reset
  input [15:0] d,               // DFF input (16-bit for 16 DFFs)
  input write_reg,              // Write Enable (to change the value stored in dff)
  input rden1,                  // read enable for read port-1
  input rden2,                  // read enable for read port-2
  inout [15:0] bitline1,        // output to read port-1 (rs)
  inout [15:0] bitline2);       // connect DFF to read port-2 (rt)

  bit_cell b0(clk, rst, d[0], write_reg, rden1,rden2, bitline1[0],bitline2[0]);
  bit_cell b1(clk, rst, d[1], write_reg, rden1,rden2, bitline1[1],bitline2[1]);
  bit_cell b2(clk, rst, d[2], write_reg, rden1,rden2, bitline1[2],bitline2[2]);
  bit_cell b3(clk, rst, d[3], write_reg, rden1,rden2, bitline1[3],bitline2[3]);

  bit_cell b4(clk, rst, d[4], write_reg, rden1,rden2, bitline1[4],bitline2[4]);
  bit_cell b5(clk, rst, d[5], write_reg, rden1,rden2, bitline1[5],bitline2[5]);
  bit_cell b6(clk, rst, d[6], write_reg, rden1,rden2, bitline1[6],bitline2[6]);
  bit_cell b7(clk, rst, d[7], write_reg, rden1,rden2, bitline1[7],bitline2[7]);
 

  bit_cell b8(clk, rst, d[8], write_reg, rden1,rden2, bitline1[8],bitline2[8]);
  bit_cell b9(clk, rst, d[9], write_reg, rden1,rden2, bitline1[9],bitline2[9]);
  bit_cell b10(clk, rst, d[10], write_reg, rden1,rden2, bitline1[10],bitline2[10]);
  bit_cell b11(clk, rst, d[11], write_reg, rden1,rden2, bitline1[11],bitline2[11]);


  bit_cell b12(clk, rst, d[12], write_reg, rden1,rden2, bitline1[12],bitline2[12]);
  bit_cell b13(clk, rst, d[13], write_reg, rden1,rden2, bitline1[13],bitline2[13]);
  bit_cell b14(clk, rst, d[14], write_reg, rden1,rden2, bitline1[14],bitline2[14]);
  bit_cell b15(clk, rst, d[15], write_reg, rden1,rden2, bitline1[15],bitline2[15]);




endmodule