// Simple ALU: multiply-accumulate (combinational)
module alu#(parameter WIDTH = 32) (
    input  logic [WIDTH-1:0] a, b,
    input  logic [3:0] opcode,
    output logic [WIDTH-1:0] result
);

    always_comb begin

        case(opcode)
            // Arithmetic
            4'd0: result = a + b;   // ADD
            4'd1: result = a - b;   // SUB
            4'd2: result = a * b;   // MUL (lower WIDTH bits)

            // Bitwise
            4'd3: result = a & b;   // AND
            4'd4: result = a | b;   // OR
            4'd5: result = a ^ b;   // XOR
            4'd6: result = ~a;      // NOT

            // Shifts
            4'd7: result = a << b;  // SLL
            4'd8: result = (a & 32'h7FFFFFFF) >> b;  // SRL     TODO: This is wrong, change when you can
            4'd9: result = a >> b;  // SRA

            // Comparisons
            4'd10: result = a == b;  // EQ
            4'd11: result = a != b;  // NE
            4'd12: result = a < b;   // LT
            4'd12: result = a < b;   // LT
            4'd13: result = a <= b;  // LE
            4'd14: result = a > b;   // GT
            4'd15: result = a >= b;  // GE
            default: result = '0;
        endcase

    end

endmodule

module Mux#(parameter WIDTH = 32) (
    input logic[WIDTH-1:0] I0, I1, I2, I3,
    input logic [1:0] sel,
    output logic[WIDTH-1:0] Iout
);
    always_comb begin

        case(sel)
            2'd1: Iout = I1;
            2'd2: Iout = I2;
            2'd3: Iout = I3;
            default: Iout = I0;
        endcase

    end

endmodule

module id_Register#(parameter WIDTH=3) (
    input logic [WIDTH-1:0] vin,
    input logic enable, clk, rst,
    output logic [WIDTH-1:0] vout
);

    logic [WIDTH-1:0] val;

    assign vout = val;

    always_ff@(posedge clk) begin
        if(rst && !enable) begin
            val <= 0;
        end else if (enable) begin
            val <= vin;
        end
    end

endmodule

module data_register#(parameter WIDTH=32) (
    input logic [2:0] A_idx, B_idx, dst_idx,
    input logic [WIDTH-1:0] data,
    input logic clk, wr_en, rst,
    output logic [WIDTH-1:0] out_A, out_B
);

    logic [7:0][WIDTH-1:0] registers;

    // Update register based on code
    always_ff@(posedge clk) begin
        if(rst) begin
            registers <= '0;
        end else if (wr_en) begin
            registers[dst_idx] <= data;
        end else begin
            out_A <= registers[A_idx];
            out_B <= registers[B_idx];
        end
    end

endmodule