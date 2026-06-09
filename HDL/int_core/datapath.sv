`timescale 1ns/1ps
module int_datapath #(parameter WIDTH = 32) (
    input  logic                 clk,
    input  logic                 rst,
    input  logic                 valid_in,
    input  logic [WIDTH-1:0]     in_a,
    input  logic [WIDTH-1:0]     in_b,
    input  logic [WIDTH-1:0]     in_c,
    output logic                 valid_out,
    output logic [WIDTH-1:0]     out_result
);

    // Stage 1 registers (capture inputs)
    logic s1_valid;
    logic [WIDTH-1:0] s1_a, s1_b, s1_c;

    // Stage 2 registers (MAC compute result)
    logic s2_valid;
    logic [WIDTH-1:0] s2_result;

    // Combinational MAC instance (runs on stage1 outputs)
    logic [WIDTH-1:0] mac_out;
    alu_mac #(.WIDTH(WIDTH)) mac_i(.a(s1_a), .b(s1_b), .c(s1_c), .result(mac_out));

    // Stage register updates
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            s1_valid <= 1'b0;
            s2_valid <= 1'b0;
            s1_a <= '0; s1_b <= '0; s1_c <= '0;
            s2_result <= '0;
        end else begin
            s1_valid <= valid_in;
            s1_a <= in_a; s1_b <= in_b; s1_c <= in_c;

            // capture MAC output into stage 2
            s2_valid <= s1_valid;
            s2_result <= mac_out;
        end
    end

    assign valid_out  = s2_valid;
    assign out_result = s2_result;

endmodule
