module int_path_test();

    logic [31:0] LSR_rd, LSR_wr, imm;
    logic [3:0] opcode;
    logic [2:0] A_idx, B_idx, dst_idx;
    logic [1:0] A_sel, B_sel;
    logic clk, rst, wr_en;

    int_path#(32) dut(.*);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor($time,, "Instruction: %b %b %b %b %b %b %b %b, Result: %d",
                opcode, A_idx, B_idx, dst_idx, A_sel, B_sel, wr_en, imm, LSR_wr);

        rst <= 1;
        dst_idx <= '0;
        wr_en <= 0;
        A_idx <= '0;
        B_idx <= '0;
        imm <= 32'd10;
        opcode <= '0;
        LSR_rd <= 32'd1;
        @(posedge clk)
        rst <= '0;

        // Just test if it outputs
        A_sel <= 2'd1;
        B_sel <= 2'd3;
        @(posedge clk)
        // Write the output value to r0 (both A and B are reading from r0 at this point)
        wr_en <= 1;
        @(posedge clk)
        wr_en <= 0;
        @(posedge clk)
        B_sel <= '0; // read from output 0
        wr_en <= 1;
        @(posedge clk)
        wr_en <= 0;
        @(posedge clk)
        A_sel <= 2'd2;
        @(posedge clk)
        @(posedge clk)
        #1 $finish;
    end
endmodule
