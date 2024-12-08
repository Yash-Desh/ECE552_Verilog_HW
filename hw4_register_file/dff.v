// dff with synchronous rst.
module dff (
    output reg q,   // DFF output stored in reg
    input d,        // DFF input
    input wen,      // Write Enable
    input clk,      // clk signal
    input rst       // synchronous reset
);

  always @(posedge clk) begin
    // if (rst signal is set), make dff o/p = 0
    // else 
    //     if (wen signal is set), make dff o/p = d
    //     else make dff o/p = q (current value)
    q <= rst ? 0 : (wen ? d : q);
  end

endmodule  // dff
