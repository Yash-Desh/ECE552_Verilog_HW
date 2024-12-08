`include "register.v"
`include "read_decoder_4_16.v"
`include "write_decoder_4_16.v"

module register_file(
    input clk,
    input rst,
    input [3:0] src_reg1,
    input [3:0] src_reg2,
    input [3:0] dst_reg,
    input write_reg,
    input [15:0] dst_data,
    inout [15:0] src_data1,
    inout [15:0] src_data2);


    wire [15:0]rd0_output;
    wire [15:0]rd1_output;
    wire [15:0]wd0_output;

    read_decoder_4_16 rd0(src_reg1[3:0], rd0_output[15:0]);
    read_decoder_4_16 rd1(src_reg2[3:0], rd1_output[15:0]);

    write_decoder_4_16 wd0(dst_reg[3:0], write_reg, wd0_output[15:0]);


    register r0(clk, rst, dst_data[15:0], wd0_output[0], rd0_output[0], rd1_output[0], src_data1[15:0], src_data2[15:0]);
    register r1(clk, rst, dst_data[15:0], wd0_output[1], rd0_output[1], rd1_output[1], src_data1[15:0], src_data2[15:0]);
    register r2(clk, rst, dst_data[15:0], wd0_output[2], rd0_output[2], rd1_output[2], src_data1[15:0], src_data2[15:0]);
    register r3(clk, rst, dst_data[15:0], wd0_output[3], rd0_output[3], rd1_output[3], src_data1[15:0], src_data2[15:0]);

    register r4(clk, rst, dst_data[15:0], wd0_output[4], rd0_output[4], rd1_output[4], src_data1[15:0], src_data2[15:0]);
    register r5(clk, rst, dst_data[15:0], wd0_output[5], rd0_output[5], rd1_output[5], src_data1[15:0], src_data2[15:0]);
    register r6(clk, rst, dst_data[15:0], wd0_output[6], rd0_output[6], rd1_output[6], src_data1[15:0], src_data2[15:0]);
    register r7(clk, rst, dst_data[15:0], wd0_output[7], rd0_output[7], rd1_output[7], src_data1[15:0], src_data2[15:0]);

    register r8(clk, rst, dst_data[15:0], wd0_output[8], rd0_output[8], rd1_output[8], src_data1[15:0], src_data2[15:0]);
    register r9(clk, rst, dst_data[15:0], wd0_output[9], rd0_output[9], rd1_output[9], src_data1[15:0], src_data2[15:0]);
    register r10(clk, rst, dst_data[15:0], wd0_output[10], rd0_output[10], rd1_output[10], src_data1[15:0], src_data2[15:0]);
    register r11(clk, rst, dst_data[15:0], wd0_output[11], rd0_output[11], rd1_output[11], src_data1[15:0], src_data2[15:0]);

    register r12(clk, rst, dst_data[15:0], wd0_output[12], rd0_output[12], rd1_output[12], src_data1[15:0], src_data2[15:0]);
    register r13(clk, rst, dst_data[15:0], wd0_output[13], rd0_output[13], rd1_output[13], src_data1[15:0], src_data2[15:0]);
    register r14(clk, rst, dst_data[15:0], wd0_output[14], rd0_output[14], rd1_output[14], src_data1[15:0], src_data2[15:0]);
    register r15(clk, rst, dst_data[15:0], wd0_output[15], rd0_output[15], rd1_output[15], src_data1[15:0], src_data2[15:0]);

    
endmodule