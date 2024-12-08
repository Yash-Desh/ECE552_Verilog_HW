module full_adder_1bit(input a, input b, input cin, output sum, output cout);
  
  wire N1,N2,N3;

  // sum = a^b^cin
  xor (sum, a, b, cin);

  // cout = a&b | b&cin | cin&a
  and (N1, a, b),
      (N2, b, cin),
      (N3, a, cin);

  or (cout, N1,N2, N3);
endmodule

