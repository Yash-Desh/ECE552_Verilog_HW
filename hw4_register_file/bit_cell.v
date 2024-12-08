`include "dff.v"
module bit_cell(
  input clk,            // clk signal
  input rst,            // synchronous reset
  input d,              // DFF input
  input wren,           // Write Enable (to change the value stored in dff)
  input rden1,          // read enable for read port-1
  input rden2,          // read enable for read port-2
  inout bitline1,       // output to read port-1 (rs)
  inout bitline2);      // connect DFF to read port-2 (rt)

wire q;

// instantiate dff
dff dff_cell(q, d, wren, clk, rst);

// what does bufif1 do ?
bufif1(bitline1, q, rden1);
bufif1(bitline2, q, rden2);

// // Equivalent Tri-state buffer implementation to bufif1
// assign bitline1 = (rden1)? dff_q: 1'bz;
// assign bitline2 = (rden2)? dff_q: 1'bz;

endmodule