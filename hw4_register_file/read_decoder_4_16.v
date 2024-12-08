module decoder_3_8(input [2:0]A, input En, output [7:0]D);

and a0 (D[0], ~A[2], ~A[1], ~A[0], En),
     a1 (D[1], ~A[2], ~A[1], A[0], En),
     a2 (D[2], ~A[2], A[1], ~A[0], En),
     a3 (D[3], A[2], ~A[1], ~A[0], En),
     a4 (D[4], A[2], ~A[1], ~A[0], En),
     a5 (D[5], A[2], ~A[1], A[0], En),
     a6 (D[6], A[2], A[1], ~A[0], En),
     a7 (D[7], A[2], A[1], A[0], En);

endmodule
module read_decoder_4_16(
  input [3:0] reg_id,
  output [15:0] wordline);

decoder_3_8 d0(reg_id[2:0], reg_id[3], wordline[15:8]);
decoder_3_8 d1(reg_id[2:0], ~reg_id[3], wordline[7:0]);


endmodule