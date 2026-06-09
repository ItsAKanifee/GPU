// Simple ALU: multiply-accumulate (combinational)
module alu_mac #(parameter WIDTH = 32) (
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    input  logic [WIDTH-1:0] c,
    output logic [WIDTH-1:0] result
);
    // Use full-width multiplication then truncate lower WIDTH bits for result
    logic [2*WIDTH-1:0] prod;
    logic [2*WIDTH-1:0] sum64;

    assign prod   = a * b;
    assign sum64  = prod + {{WIDTH{1'b0}}, c};
    assign result = sum64[WIDTH-1:0];
endmodule
