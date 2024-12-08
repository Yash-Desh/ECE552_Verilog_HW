// Date : 11-10-2024
`include "16_bit_ripple_adder.v"

module pc_control(input [2:0] c,            // 3-bit condition given within instruction 
                  input [8:0] i,            // 9-bit immediate offset 
                  input [2:0] f,            // 3-bit flag set by the instructions [ZVN]
                  input branch,             // 1-bit branch flag
                  input [15:0] pc_in,       // current value of PC
                  output [15:0] pc_out);    // new value of PC

wire n1, n2, n3;

// calculate PC+2 -> need 16-bit adder
assign n1 = pc_in+2;

// calculate PC+2+(i<<2) -> need 16-bit adder
assign n2 = n1 + {concatenation+replication}of(i<<2);

// Case-1 : c=000 & z=0 & branch=1
assign pc_out = ((c == 3'b000)? ((f[0]==0) ? ((branch) ? n2 : n1) : n1) : n1);

// Case-2 : c=001 & z=1 & branch=1
assign pc_out = ((c == 3'b001)? ((f[0]==1) ? ((branch) ? n2 : n1) : n1) : n1);

// Case-3 : c=010 & z=n=0 & branch=1
assign pc_out = ((c == 3'b010)? (~(f[0] | f[2]) ? ((branch) ? n2 : n1) : n1) : n1);

// Case-4 : c=011 & n=1 & branch=1
assign pc_out = ((c == 3'b011)? ((f[2]) ? ((branch) ? n2 : n1) : n1) : n1);

// Case-5 : c=100 & z=1 or z=n=0 & branch=1
assign pc_out = ((c == 3'b011)? (~(f[0]|f[2]) | f[0] ? ((branch) ? n2 : n1) : n1) : n1);

// Case-6 : c=101 n=1 or z=1 & branch=1
assign pc_out = ((c == 3'b101)? ((f[0]|f[2]) ? ((branch) ? n2 : n1) : n1) : n1);

// Case-7 : c=110 v=1 & branch=1
assign pc_out = ((c == 3'b110)? ((f[1]) ? ((branch) ? n2 : n1) : n1) : n1);

// Case-8 : c=111 & branch=1
assign pc_out = ((c == 3'b111)? ((branch) ? n2 : n1) : n1) ;


endmodule