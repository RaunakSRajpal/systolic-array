`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WISE Circuits Lab, Boston University
// Engineer: Raunak Singh Rajpal
// 
// Create Date: 20.11.2025 13:21:42
// Design Name: inner product step-processor
// Module Name: ipstep_proc
// Project Name: systolic-array
// Target Devices: Zynq 7000 (temp)
// Tool Versions: 
// Description: step-processor that performs inner product on 2 variables. The 
//              partial sum computed forms a node element for an unknown sysolic
//              array topology.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ipstep_proc #(parameter WIDTH = 8) (
    input   clk,
    input   rst,
    input   [WIDTH-1:0]A_i,
    input   [WIDTH-1:0]B_i,
    input   [WIDTH-1:0]C_i,

    output  [WIDTH-1:0]A_o,
    output  [WIDTH-1:0]B_o,
    output  [WIDTH-1:0]C_o
    // input   [WIDTH-1:0]I[N-1:0],
    // output  [WIDTH-1:0]O[N-1:0]
);

    // reg     [WIDTH-1:0]R[N-1:0];
    reg     [WIDTH-1:0]reg_a;
    reg     [WIDTH-1:0]reg_b;
    reg     [WIDTH-1:0]reg_c;

    // process definition: c = c + a*b
    assign C_o = reg_c + reg_a * reg_b;
    assign A_o = reg_a;
    assign B_o = reg_b;

    always @(posedge clk or rst) begin
        if (rst) begin
            reg_a = 8'b00;
            reg_b = 8'b00;
            reg_c = 8'b00;
        end

        // for (integer j = 0; j < N; j++) begin
        //     R[j] <= I[j];
        // end
        reg_a <= A_i;
        reg_b <= B_i;
        reg_c <= C_i;
    end

endmodule
