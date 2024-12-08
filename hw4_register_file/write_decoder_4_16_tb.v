`include "write_decoder_4_16.v"
module write_decoder_4_16_tb();
  reg [3:0]reg_id;
  reg write_reg;


  wire [15:0] wordline;

  write_decoder_4_16 idut(.reg_id(reg_id), .write_reg(write_reg), .wordline(wordline));

  initial
  begin
    $dumpfile("test3.vcd");
    $dumpvars(0, idut);
  end

  initial
  begin

    write_reg = 1'b1;
    reg_id=4'b0000;
    #15;
    if(wordline === 16'b0000_0000_0000_0001)
    begin
      $display("0 Successful");

    end
    else
    begin
      $display("0 Unsuccessful");
      $finish;
    end


    write_reg = 1'b0;
    reg_id=4'b1000;
    #15;
    if(wordline === 16'b0000_0000_0000_0000)
    begin
      $display("8 Successful");

    end
    else
    begin
      $display("8 Unsuccessful");
      $finish;
    end

    write_reg=1'b1;
    reg_id=4'b1010;
    #15;
    if(wordline === 16'b0000_0100_0000_0000)
    begin
      $display("10 Successful");

    end
    else
    begin
      $display("10 Unsuccessful");
      $finish;
    end

  end

endmodule
