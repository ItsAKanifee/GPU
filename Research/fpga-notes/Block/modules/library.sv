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

module PC#(parameter WIDTH = 6) (
    input logic [WIDTH-1:0] addr,
    input logic en, clk, rst, load,
    output logic [WIDTH-1:0] out_addr
);

    logic [WIDTH-1:0] instr_addr;

    assign out_addr = instr_addr;

    always_ff@(posedge clk) begin
        if (rst) begin
            instr_addr <= '0;
        end else if (load) begin
            instr_addr <= addr; // branch situations, to be done later
        end else if (en) begin
            instr_addr <= instr_addr + 1; // insturctions are 32 bits (4 bytes)
        end
    end
endmodule

module Instr_Cache#(parameter WIDTH = 32, SIZE = 64) (
    input logic [WIDTH-1:0] in, // Input read from memory (cache line transmits 32 bits at a time, or 1 instr)
    input logic [$clog2(SIZE)-1:0] req, // address of request by PC
    input logic load, clk, rst,
    output logic [WIDTH-1:0] instr // Output written to IR
);
    logic [SIZE-1:0][WIDTH-1:0] mem;
    logic [$clog2(SIZE)-1:0] i;

    assign instr = mem[req];

    always_ff@(posedge clk) begin
        if (rst) begin
            i <= 0;
            mem <= '0;
        end else if (load) begin // i will reset whenever it equals SIZE, so it will never go out of bounds
            mem[i] <= in;
            i <= i + 1;
        end
    end

endmodule
