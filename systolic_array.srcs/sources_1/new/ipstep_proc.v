`timescale 1ps/1ps
/***
* 
***/


module ipstep_proc #(parameter WIDTH = 8) (
    input   clk,
    input   rst,
    input   reg  [WIDTH-1:0]A,
    input   reg  [WIDTH-1:0]B,
    output  wire [WIDTH-1:0]C
    // input   [WIDTH-1:0]I[N-1:0],
    // output  [WIDTH-1:0]O[N-1:0]
);

    // reg     [WIDTH-1:0]R[N-1:0];
    reg     [WIDTH-1:0]reg_a;
    reg     [WIDTH-1:0]reg_b;
    reg     [WIDTH-1:0]reg_c;

    // process definition: c = c + a*b
    assign C <= reg_c + reg_a * reg_b;

    always @(posedge clk or rst) begin
        if (rst) begin
            reg_a = 8'b00;
            reg_b = 8'b00;
            reg_c = 8'b00;
        end

        // for (integer j = 0; j < N; j++) begin
        //     R[j] <= I[j];
        // end
        reg_a <= A;
        reg_b <= B;
        reg_c <= C;
    end

endmodule

