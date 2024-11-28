`include "cache_fill_fsm.v"
module cache_fill_fsm_tb ();

  // inputs are reg
  reg         clk;
  reg         rst;
  reg         miss_detected;      // active high when tag match logic detects a miss
  reg [15:0]  miss_address;

  // any output from any module has to be a wire
  wire         fsm_busy;           // asserted while FSM is busy handling the miss (can be used as pipeline stall signal)
  wire         write_data_array;   // write enable to cache data array to signal when filling with memory_data
  wire         write_tag_array;    // write enable to cache tag array to signal when all words are filled in to dataarray
  wire [15:0]  memory_address;

  reg [15:0]  memory_data;        // data returned by memory (after delay)
  reg         memory_data_valid;


cache_fill_fsm idut(
  .clk(clk), 
  .rst(rst), 
  .miss_detected(miss_detected), 
  .miss_address(miss_address),
  .fsm_busy(fsm_busy),
  .write_data_array(write_data_array),
  .write_tag_array(write_tag_array),
  .memory_address(memory_address),
  .memory_data(memory_data),
  .memory_data_valid(memory_data_valid));
  
  initial
  begin
    $dumpfile("test.vcd");
    $dumpvars(0, idut);
  end

  // code to store some value in some register & then read it from there.

  initial
  begin
    // initially clk=x, assert it to 0
    clk=0;

    // reset is high at the start of time
    rst = 1;
    memory_data_valid=0;
    
    // rst=1 for 1 clock
    @(posedge clk)

    // in the next clock cycle rst=0, so that data can flow into the cache controller
    @(posedge clk)
     rst = 0;

    // set the miss address
    miss_address = 16'b0000_1000_0000_0000;

    // stop writing
    miss_detected=1;
    @(posedge clk)

    miss_detected=0;
    repeat(4)
    @(posedge clk);

    memory_data_valid = 1;
    @(posedge clk)
    memory_data_valid = 0;

    if(fsm_busy == 1'b1)
    $display("At %t:Stall asserted",$time);
    $monitor("At %t:Write data array = %b, Write tag array = %b, Memory address:%b",$time,write_data_array,write_tag_array,memory_address);

    //miss_address = 16'hA002;
    repeat (4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;

    repeat(4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;

    repeat(4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;

    repeat(4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;

    repeat(4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;

    repeat(4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;

    repeat(4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;

    repeat(4) @(negedge clk);
    memory_data_valid = 1;
    @(negedge clk);
    memory_data_valid = 0;
    
    @(negedge clk);
    if(fsm_busy == 0)
    $display("At %t:Stall de-asserted",$time);

    $finish;


  end

  // half clock-cycle = 15s
  // after 15s the clk will change polarity
  // total clock = 30s 
  always
    #15 clk=~clk;
endmodule
