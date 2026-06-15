// Simple ALU: multiply-accumulate (combinational)
module alu#(parameter WIDTH = 32) (
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    input  logic [2:0] opcode,
    output logic [WIDTH-1:0] result
);

    always_comb begin

        case(opcode)
            3'd0: result = a + b;   // ADD
            3'd1: result = a - b;   // SUB
            3'd2: result = a * b;   // MUL (lower WIDTH bits)
            3'd3: result = a & b;   // AND
            3'd4: result = a | b;   // OR
            3'd5: result = a ^ b;   // XOR
            default: result = '0;
        endcase

    end

endmodule
