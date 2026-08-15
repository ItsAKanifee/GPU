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
