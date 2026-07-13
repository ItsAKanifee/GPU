module int_path#(parameter WIDTH = 32) ( // Basic datapath for one lane of GPU
    input logic [WIDTH-1:0] LSR_rd,
    input logic [11:0] imm,
    input logic [3:0] opcode,
    input logic [2:0] A_idx, B_idx, dst_idx,
    input logic [1:0] A_sel, B_sel,
    input logic clk, rst, wr_en,
    output logic [WIDTH-1:0] LSR_wr
);

    logic [WIDTH-1: 0] var_A, var_B, var_C, out_A, out_B;
    // out_A and out_B correspond to the read ports of the register

    // Selectors for A and B
    4to1Mux #(.WIDTH) A_mux(.I0(out_A), .I1(imm), .I2(LSR_rd), .sel(A_sel), .Iout(var_A));
    B_mux(.I0(out_B), .I1(imm), .I2(LSR_rd), .I3, .sel(B_sel), .Iout(var_B));

    // ALU to pass through variable A and B, to get variable C
    alu #(.WIDTH) dut(.a(var_A), .b(var_B), .opcode, .result(var_C));

    // Register to read and store data based on instructions
    data_register #(.WIDTH) (.data(var_C), .*);

    // Going to have to change when memory reading is figured out, but works for the testing
    assign LSR_wr = var_C;

endmodule
