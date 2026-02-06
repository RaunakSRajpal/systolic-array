`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WISE Circuits Lab, Boston University
// Engineer: Raunak Singh Rajpal
// 
// Create Date: 20.11.2025 18:06:37
// Design Name: systolic array network
// Module Name: systolic_net
// Project Name: systolic-array
// Target Devices: Zynq 7000 (temp)
// Tool Versions: 
// Description: systolic aray topology that uses step-processors for nodes, each 
//              of which computes a partial product. The topology is designed to
//              combine these partial products to compute <>.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module systolic_net #(parameter N = 4, parameter WIDTH = 8) (
    input   clk,
    input   rst,
    input   [WIDTH-1:0]pA_i[0:N-1],
    input   [WIDTH-1:0]pB_i[0:N-1],
    input   [WIDTH-1:0]pC_i[0:N-1],
    output  [WIDTH-1:0]pA_o[0:N-1],
    output  [WIDTH-1:0]pB_o[0:N-1],
    output  [WIDTH-1:0]pC_o[0:N-1]
);

    // Generate NxN IP step processors for systolic array

    // Network Topology for inner product 
    genvar i,j;
    generate
        for (i = 0; i < N; i = i+1) begin: Gen_proc_modules
            for (j = 0; j < N; j = j+1) begin
                if (i == 0) begin
                    ipstep_proc #(WIDTH) node_pe(.clk(clk), .rst(rst), .A(pA_i[j]), .B(pB_o[j-1]), .C(pC_o[j-1]));
                end
                if (j == 0) begin
                    ipstep_proc #(WIDTH) node_pe(.clk(clk), .rst(rst), .A(pA_i[i-1]), .B(pB_i[i]), .C(pC_i[i]));
                end

                ipstep_proc #(WIDTH) node_pe(.clk(clk), .rst(rst), .A(pA_o[i-1]), .B(pB_o[j-1]), .C(pC_o[j-1]));

            end
        end
    endgenerate

endmodule