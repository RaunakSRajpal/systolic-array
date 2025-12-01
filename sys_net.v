`timescale 1ps/1ps
/***
* 
***/

module systolic_net #(parameter N = 4, parameter WIDTH = 8) (
    input   clk,
    input   rst,
    input   [WIDTH-1:0]I[0:N-1],
    output  [WIDTH-1:0]O[0:N-1]
);

    // Generate NxN IP step processors for systolic array
    genvar i;
    generate
        for (i = 0; i < N; i++) begin: Gen_proc_modules
            ipstep_proc #(WIDTH) node_pe(.clk(clk), .rst(rst), .A(), .B(), .C());
        end
    endgenerate

    // Network Topology for inner product 
    for (integer j = 0; j < N; j++) begin
        assign 
    end

endmodule