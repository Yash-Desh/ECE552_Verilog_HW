/*
Design a combinational 16-bit shifter to implement the following two shift 
instructions: SLL (Shift Left Logical) and SRA (Shift Right Arithmetic). 
The 4-bit shift amount is an unsigned binary number.
*/

module shifter (
  input [15:0]  shift_in,  // data to be shifted
  input [3:0]   shift_val, // shift amount
  input         mode,      // 0==SLL, 1==SRA
  output [15:0] shift_out  // data result of shift
);

  wire [15:0]t1;
  wire [15:0]t2;
  wire [15:0]t3;

  // check if 1000 bit is set 
  assign t1 = (shift_val&4'b1000)?(mode === 0)?shift_in<<8:{{8{shift_in[15]}}, shift_in[15:8]}:shift_in;
         
  // check if 0100 bit is set       
  assign t2 = (shift_val&4'b0100)?(mode === 0)?t1<<4:{{4{t1[15]}}, t1[15:4]}:t1;

  // check if 0010 bit is set
  assign t3 = (shift_val&4'b0010)?(mode === 0)?t2<<2:{{2{t2[15]}}, t2[15:2]}:t2;

  // check if 0001 bit is set
  assign shift_out = (shift_val&4'b0001)?(mode === 0)?t3<<1:{{1{t3[15]}}, t3[15:1]}:t3;

endmodule
