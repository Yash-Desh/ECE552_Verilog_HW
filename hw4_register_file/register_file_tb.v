`include "register_file.v"
module register_file_tb ();

  reg clk;
  reg rst;
  reg [3:0] src_reg1;
  reg [3:0] src_reg2;
  reg [3:0] dst_reg;
  reg write_reg;

  reg [15:0] dst_data;
  wire [15:0] src_data1;
  wire [15:0] src_data2;

  register_file idut(.clk(clk), .rst(rst), .src_reg1(src_reg1), .src_reg2(src_reg2),
                     .dst_reg(dst_reg), .write_reg(write_reg), .dst_data(dst_data), .src_data1(src_data1), .src_data2(src_data2));

  initial
  begin
    $dumpfile("test4.vcd");
    $dumpvars(0, idut);
  end

  // code to store some value in some register & then read it from there.

  initial
  begin
    // initially clk=x, assert it to 0
    clk=0;

    // start writing
    dst_data = 16'b0000_1000_0000_0000;
    dst_reg = 4'b1000;
    write_reg = 1;
    rst = 1;
    // at pos edge of clock set rst=1, so that all registers are reset
    @(posedge clk)
    // at neg edge of clock set rst=0, so that assigned data can be stored
    @(negedge clk)
     rst = 0;

    repeat(5)
    @(posedge clk);

    // stop writing
    write_reg=0;

    // start reading
    src_reg1 = 4'b1000;
    repeat(5)
    @(posedge clk);
    if(src_data1 == dst_data)
    begin
      $display("Read Successfull\n");
      $finish;
    end
    else
    begin
      $display("Read Unsuccessfull\n");
      $finish;
    end


  end

  // half clock-cycle = 15s
  // after 15s the clk will change polarity
  always
    #15 clk=~clk;
endmodule
