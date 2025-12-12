`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WISE Circuits Lab, Boston University
// Engineer: Raunak Singh Rajpal 
// 
// Create Date: 30.11.2025 15:03:29
// Design Name: step processor testbench
// Module Name: systolic_net_tb
// Project Name: systolic-array
// Target Devices: 
// Tool Versions: 
// Description: testbench for the systolic array (inner product step-processor)
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
    localparam  N = 4;

    reg     CLK, reset;

    reg     [WIDTH-1:0]pA_i[0:N-1];
    reg     [WIDTH-1:0]pB_i[0:N-1];
    reg     [WIDTH-1:0]pC_i[0:N-1];

    wire    [WIDTH-1:0]pA_o[0:N-1];
    wire    [WIDTH-1:0]pB_o[0:N-1];
    wire    [WIDTH-1:0]pC_o[0:N-1];
    
    // Initialize clock (100 MHz)
    initial begin
    CLK = 1'b1;
    forever #5 CLK = ~CLK;
    end

    task init(); begin
        reset = 1'b1;
        pA_i = 8'h00;
        B_i = 8'h00;
        C_i = 8'h00;
    end
    endtask

    // Instantiate DUT 
    systolic_net #(N,WIDTH) sysArray(.clk(CLK), .rst(reset), .pA_i(pA_i), .pB_i(pB_i), .pC_i(pC_i), .pA_o(pA_o), .pB_o(pB_o), .pC_o(pC_o));

    initial begin
        init();

        #10     reset = 1'b0;
        #10     A_i = 8'h01;  B_i = 8'h01;
        #10     A_i = 8'h0a;  B_i = 8'h01;  C_i = C;
        #10     A_i = 8'h02;  B_i = 8'h03;  C_i = C;
    end

endmodule
