module full_adder_1bit(cout, a, b, cin, sum);
  output cout, sum;
  input a, b, cin;
  wire N1,N2,N3;

  xor xor_gate(sum, a, b, cin);
  and and0 (N1, a, b),
      and1 (N2, b, cin),
      and2 (N3, a, cin);

  or carry_bit(cout, N1,N2, N3);
endmodule

