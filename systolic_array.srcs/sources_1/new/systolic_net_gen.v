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
    input   [WIDTH-1:0]I[0:N-1],
    output  [WIDTH-1:0]O[0:N-1]
);

    // Generate NxN IP step processors for systolic array
    genvar i;
    generate
        for (i = 0; i < N; i = i+1) begin: Gen_proc_modules
            ipstep_proc #(WIDTH) node_pe(.clk(clk), .rst(rst), .A(), .B(), .C());
        end
    endgenerate

    // Network Topology for inner product 
    integer j;    
    for (j = 0; j < N; j = j+1) begin
        // network
    end

endmodule