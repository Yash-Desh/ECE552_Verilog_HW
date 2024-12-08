`include "decoder_3_8.v"
module decoder_3_8_tb();
  reg [2:0]A;
  reg En;

  wire [7:0]D;

  decoder_3_8 idut(.A(A), .En(En), .D(D));

  initial
  begin
    $dumpfile("test1.vcd");
    $dumpvars(0, idut);
  end

  initial
  begin
    En=1;

    A=3'b000;
    #15;
    if(D === 8'b0000_0001)
    begin
      $display("0 Successful");

    end
    else begin
        $display("0 Unsuccessful");
        $finish;
    end

    A=3'b001;
    #15;
    if(D === 8'b0000_0010)
    begin
      $display("1 Successful");
    end
    else begin
        $display("1 Unsuccessful");
        $finish;
    end

    A=3'b010;
    #15;
    if(D === 8'b0000_0100)
    begin
      $display("2 Successful");
      $finish;
    end
    else begin
        $display("2 Unsuccessful");
        $finish;
    end

  end

endmodule
