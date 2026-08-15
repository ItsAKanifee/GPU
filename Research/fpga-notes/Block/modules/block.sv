// Set of multiple lanes running a given instruction and reading / writing to LSR
module Block#(parameter WIDTH = 32, LANES = 8) (
    input logic [LANES-1:0][WIDTH-1:0] LSR_vec,
    input logic [WIDTH-1:0] Instruction,
    input logic clk, rst, ir_en,
    output logic [LANES-1:0][WIDTH-1:0] result
);

    // TODO: Make a different constant between the Memory and Instruction Width
    logic [WIDTH-1:0] imm;
    logic [WIDTH-19:0] imm_ir;
    logic [3:0] opcode;
    logic [2:0] dst_idx, A_idx, B_idx;
    logic [1:0] A_sel, B_sel;
    logic wr_en;

    assign imm = {'0, imm_ir};
    IR#(.WIDTH(WIDTH)) instr(.imm(imm_ir), .*);

    // Generate all lane instances in the block
    genvar i;

    generate // make multiple lanes accoring to LANES parameter
        for (i = 0; i < LANES; i++) begin : lanes
            int_path#(.WIDTH(WIDTH)) lane(.LSR_rd(LSR_vec[i]), .LSR_wr(result[i]), .*);
        end
    endgenerate

endmodule

// Block + extra surrounding devices (LSR, PC, Instruction Cache) to have full functioning logic
// TODO:
// Connect the Block, PC, Instruction Cache together
// Create simple inputs and outputs to test with
// Use the txt_reader to input a memory file in a testbench and run it
module Device_Core#(parameter WIDTH = 32, LANES = 8) (
    input logic[WIDTH-1:0] instr_in, // instruction cache line
    input logic [LANES-1:0][WIDTH-1:0] LSR_vec,
    input logic clk, rst, load, // load is to load cache
    output logic [LANES-1:0][WIDTH-1:0] result
);
    logic [WIDTH-1:0] instr; // Output written to IR
    logic [5:0] addr;
    logic en, ir_en;

    // enables do not activate when cache is being loaded
    assign en = ~load;
    assign ir_en = ~load;

    Block#(.WIDTH(WIDTH), .LANES(LANES)) wrap(.Instruction(instr), .*);
    PC#(6) pc(.addr('0), .load('0), .out_addr(addr), .*);
    Instr_Cache#(.WIDTH(WIDTH), .SIZE(64)) ic(.in(instr_in), .req(addr), .*);

endmodule
