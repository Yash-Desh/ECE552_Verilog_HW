`include "cla_adder_4bit.v"
`include "counter_4bit.v"
`include "addsub_16bit.v"
`include "pldff.v"

module cache_fill_fsm(
    input           clk,
    input           rst,
    input           miss_detected,      // active high when tag match logic detects a miss
    input   [15:0]  miss_address,       // address that missed the cache

    output  reg     fsm_busy,           // asserted while FSM is busy handling the miss (can be used as pipeline stall signal)
    output  reg     write_data_array,   // write enable to cache data array to signal when filling with memory_data
    output  reg     write_tag_array,    // write enable to cache tag array to signal when all words are filled in to dataarray
    output  reg [15:0]  memory_address,     // address to read from memory

    input   [15:0]  memory_data,        // data returned by memory (after delay)
    input           memory_data_valid   // active high indicates valid data returning on memory bus
);

// Assuming that miss_detected will only be high for a limited time 

localparam IDLE = 0;
localparam WAIT = 1;

reg next_state;
wire state;

wire [3:0]counter_in;
wire [3:0]counter_out;
reg enable_counter;
reg clear_counter;

// wire [15:0] current_address;
// wire [15:0] new_address;

//assign current_address = {memory_address[15:4], 4'b0000};

// any output from any module has to be a wire
dff ff0 (.q(state), .d(next_state), .wen(1'b1), .clk(clk), .rst(rst));


// Finite state machines are always coded always(*)
    always @(*) begin

        // All state machine outputs must be defaulted
        fsm_busy = 0;
        enable_counter = 0;
        clear_counter = 0;
        write_data_array = 0;
        write_tag_array = 0;
        memory_address = 0;

        case (state)
            IDLE: begin

                // condition to go to WAIT state
                next_state = (miss_detected) ? WAIT : IDLE;
                
                
            end

            WAIT: 
            begin
                // go to IDLE if couter == 8
                next_state = (counter_out[3:0]==4'b1000) ? IDLE : WAIT;

                // stall the processor 
                fsm_busy = 1;  

                write_tag_array = (counter_out[3:0]==4'b1000)? 1'b1 : 1'b0;

                write_data_array = (~(counter_out[3:0]==4'b1000) && (memory_data_valid)) ?  1'b1 : 1'b0;

                // write enable the counter on receiving the valid data from memory          
                enable_counter = (write_data_array) ? 1'b1 : 1'b0;

                memory_address = {miss_address[15:4], counter_out[3:0]<<1};

                // reset the counter when a miss is detected
                clear_counter = (counter_out[3:0]==4'b1000) ? 1'b1 : 1'b0;
            end
            default: begin
                next_state = state;
            end
             
        endcase
    end



// 4-bit register to store the count
pldff #(.WIDTH(4)) counter_4(
    .q(counter_out[3:0]),  
    .d(counter_in[3:0]), 
    .wen(enable_counter), 
    .clk(clk), 
    .rst(rst | clear_counter));

// 4-bit adder for the counter
cla_adder_4bit cla (
    .a_in(counter_out[3:0]), 
    .b_in(4'b0001), 
    .carry_in(1'b0), 
    .adder_out(counter_in[3:0]), 
    .carry_out(/*unconnected*/), 
    .ovfl(/*unconnected*/));


// // 16-bit register to store the miss address
// pldff #(.WIDTH(16)) store_address(
//     .q(current_address[15:0]),  
//     .d(new_address[15:0]), 
//     .wen(enable_counter), 
//     .clk(clk), 
//     .rst(rst));


// addsub_16bit address_update(
// 	.a_in(current_address[15:0]),
// 	.b_in(16'h0002),
// 	.is_sub(1'b0),
// 	.sum_out(new_address[15:0]),
// 	.flag(/*unconnected*/)
// );


endmodule

