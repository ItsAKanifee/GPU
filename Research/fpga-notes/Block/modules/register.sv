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

    assign out_A = registers[A_idx];
    assign out_B = registers[B_idx];

    // Update register based on code
    always_ff@(posedge clk) begin
        if(rst) begin
            registers <= '0;
        end else if (wr_en) begin
            registers[dst_idx] <= data;
        end
    end

endmodule

module IR#(parameter WIDTH = 32) (
    input logic [WIDTH-1:0] Instruction,
    input logic clk, rst, ir_en,
    output logic [3:0] opcode,
    output logic [2:0] dst_idx, A_idx, B_idx,
    output logic [1:0] A_sel, B_sel,
    output logic wr_en,
    output logic [WIDTH-19:0] imm
);
    logic [WIDTH-1:0] instr_data;

    assign opcode = instr_data[WIDTH-1:WIDTH-4];
    assign dst_idx = instr_data[WIDTH-5:WIDTH-7];
    assign A_idx = instr_data[WIDTH-8:WIDTH-10];
    assign B_idx = instr_data[WIDTH-11:WIDTH-13];
    assign A_sel = instr_data[WIDTH-14:WIDTH-15];
    assign B_sel = instr_data[WIDTH-16:WIDTH-17];
    assign wr_en = instr_data[WIDTH-18];
    assign imm = instr_data[WIDTH-19:0];

    always_ff@(posedge clk) begin
        if (rst) begin
            instr_data <= '0;
        end else if (ir_en) begin
            instr_data <= Instruction;
        end
    end

endmodule


/* module LSR#(parameter WIDTH = 32, ENTRIES = 8) ( */
/*     input logic [ENTRIES-1:0] lane_reqs */
/* ) */
