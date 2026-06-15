`timescale 1ns/1ps
module int_lane#(parameter WIDTH = 32) (
    input logic                 clk,
    input logic                 rst,
    input logic [WIDTH-1:0]     in_a,
    input logic [WIDTH-1:0]     in_b,
    input logic [2:0]           opcode,
    output logic [WIDTH-1:0]     out
);

    logic [WIDTH-1:0] var_a, var_b;

    alu#(.WIDTH(WIDTH)) dut(.a(var_a), .b(var_b), .opcode, .result(out));

    always_ff @(posedge clk) begin
        if(rst) begin
            var_a = 0;
            var_b = 0;
        end else begin
            var_a <= in_a;
            var_b <= var_b;
        end
    end

endmodule

module int_core #(parameter WIDTH = 32) (
    input  logic clk,
    input  logic rst,
    input  logic [7:0][WIDTH-1:0] A,
    input  logic [7:0][WIDTH-1:0] B,
    input  logic [2:0] opcode,
    output logic [7:0][WIDTH-1:0] C
);

    logic [7:0][WIDTH-1:0] Av, Bv;

    // Optional pipeline stage
    always_ff @(posedge clk) begin
        if (rst) begin
            Av <= '0;
            Bv <= '0;
        end else begin
            Av <= A;
            Bv <= B;
        end
    end

    // Instantiate 8 lanes
    genvar i;
    generate
        for (i = 0; i < 8; i++) begin : lanes
            int_lane #(.WIDTH(WIDTH)) lane_inst (
                .clk(clk),
                .rst(rst),
                .opcode(opcode),
                .in_a(Av[i]),
                .in_b(Bv[i]),
                .out(C[i])
            );
        end
    endgenerate

endmodule

