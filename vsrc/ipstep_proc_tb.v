`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2025 18:29:57
// Design Name: step processor testbench
// Module Name: ipstep_proc_tb
// Project Name: systolic-array
// Target Devices: 
// Tool Versions: 
// Description: testbench for the inner product step-processor
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ipstep_proc_tb(
    );

    localparam  WIDTH = 8;

    reg     CLK, reset;

    reg     [WIDTH-1:0]A_i;
    reg     [WIDTH-1:0]B_i;
    reg     [WIDTH-1:0]C_i;

    wire    [WIDTH-1:0]A;
    wire    [WIDTH-1:0]B;
    wire    [WIDTH-1:0]C;
    
    // Initialize clock (100 MHz)
    initial begin
    CLK = 1'b1;
    forever #5 CLK = ~CLK;
    end

    task init(); begin
        reset = 1'b1;
        A_i = 8'h00;
        B_i = 8'h00;
        C_i = 8'h00;
    end
    endtask

    // Instantiate DUT 
    ipstep_proc #(WIDTH) node_pe(.clk(CLK), .rst(reset), .A_i(A_i), .B_i(B_i), .C_i(C_i), .A_o(A), .B_o(B), .C_o(C));

    initial begin
        init();

        #10     reset = 1'b0;
        #10     A_i = 8'h01;  B_i = 8'h01;
        #10     A_i = 8'h0a;  B_i = 8'h01;  C_i = C;
        #10     A_i = 8'h02;  B_i = 8'h03;  C_i = C;
    end

endmodule
