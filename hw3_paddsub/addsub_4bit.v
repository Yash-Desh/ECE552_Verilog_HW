module addsub_4bit (input [3:0]a, input [3:0]b, input is_sub, output[3:0]sum, output[3:0]cout, output ovfl);

wire N0, N1, N2, N3;

xor (N0, b[0], is_sub),
    (N1, b[1], is_sub),
    (N2, b[2], is_sub),
    (N3, b[3], is_sub);

full_adder_1bit fa0(cout[0], a[0], N0, is_sub, sum[0]);
full_adder_1bit fa1(cout[1], a[1], N1, cout[0], sum[1]);
full_adder_1bit fa2(cout[2], a[2], N2, cout[1], sum[2]);
full_adder_1bit fa3(cout[3], a[3], N3, cout[2], sum[3]);

xor (ovfl, cout[3], cout[2]);

endmodule