module psa_16bit(input  [15:0] a, input  [15:0] b, output [15:0] sum, output error );

wire [15:0]cout;
wire N1, N2, N3, N4;

addsub_4bit fas0 (a[3:0], b[3:0], 1'b0, sum[3:0], cout[3:0], N1);
addsub_4bit fas1 (a[7:4], b[7:4], 1'b0, sum[7:4], cout[7:4], N2);
addsub_4bit fas2 (a[11:8], b[11:8], 1'b0, sum[11:8], cout[11:8], N3);
addsub_4bit fas3 (a[15:12], b[15:12], 1'b0, sum[15:12], cout[15:12], N4);

assign error = N1|N2|N3|N4;

endmodule
