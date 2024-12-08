`include "read_decoder_4_16.v"
module read_decoder_4_16_tb();
  reg [3:0]reg_id;


  wire [15:0] wordline;

  read_decoder_4_16 idut(.reg_id(reg_id), .wordline(wordline));

  initial
  begin
    $dumpfile("test2.vcd");
    $dumpvars(0, idut);
  end

  initial
  begin


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

    reg_id=4'b1000;
    #15;
    if(wordline === 16'b0000_0001_0000_0000)
    begin
      $display("8 Successful");

    end
    else
    begin
      $display("8 Unsuccessful");
      $finish;
    end

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
