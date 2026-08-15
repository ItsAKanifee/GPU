module block_tb();

    logic [7:0][31:0] LSR_vec, result;
    logic [31:0] Instruction, imm;
    logic [3:0] i;
    logic clk, rst, ir_en;

    Block#(.WIDTH(32), .LANES(8)) dut(.*);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst <= 1;
        ir_en <= 0;
        Instruction <= '0;

        for(i = 0; i < 8; i++) begin
            LSR_vec[i] = i * i + i;
        end

        $display($time,, "\nVec:");
        for(i = 0; i < 8; i++) begin
            $display("%d -> %d", LSR_vec[i], result[i]);
        end

        @(posedge clk)
        $display($time,, "\nVec:");
        for(i = 0; i < 8; i++) begin
            $display("%d -> %d", LSR_vec[i], result[i]);
        end

        rst <= '0;

        ir_en <= 1;
        // Instruction: ADD IDX:0 A_sel:0 B_sel:0 wr_en: 0 imm: 1
        // Should result in 2

        Instruction <= 32'h00000001;
        @(posedge clk)
        $display($time,, "\nVec:");
        for(i = 0; i < 8; i++) begin
            $display("%d -> %d", LSR_vec[i], result[i]);
        end
        // Instruction: MUL IDX:0 A_sel:0 B_sel:0 wr_en: 0 imm: 3
        // Should result in 9
        //
        Instruction <= 32'h20000003;
        @(posedge clk)
        $display($time,, "\nVec:");
        for(i = 0; i < 8; i++) begin
            $display("%d -> %d", LSR_vec[i], result[i]);

        end
        // Instruction: ADD IDX:0 A_sel:1 B_sel:1 wr_en: 0 imm: 0
        // Should result in 1
        Instruction <= 32'h00050000;
        @(posedge clk)
        $display($time,, "\nVec:");
        for(i = 0; i < 8; i++) begin
            $display("%d -> %d", LSR_vec[i], result[i]);
        end
        @(posedge clk)
        $display($time,, "\nVec:");
        for(i = 0; i < 8; i++) begin
            $display("%d -> %d", LSR_vec[i], result[i]);
        end
        @(posedge clk)
        @(posedge clk)
        #1 $finish;
    end

endmodule


