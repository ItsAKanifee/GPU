module device_core_tb();
    logic[31:0] instr_in, instr; // instruction cache line
    logic [7:0][31:0] LSR_vec;
    logic clk, rst, load; // load is to load cache
    logic [7:0][31:0] result;
    logic [9:0] loc;
    logic [4:0] i;

    Device_Core#(32, 8) dut(.*);
    test_reader tr(.instr(instr_in), .loc(loc));

    assign instr = dut.instr;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("A_sel = %d, B_sel = %d, imm = %d", instr[18:17], instr[16:15], instr[13:0]);
        rst <= 1;
        LSR_vec <= '0;
        @(posedge clk)

        for (i = 0; i < 8; i++) begin
            LSR_vec[i] <= $urandom_range(10, 1);
        end

        rst <= 0;
        load <= 1;
        loc <= 0;
        $display("Loading...");
        @(posedge clk)
        loc <= 4;
        @(posedge clk)
        loc <= 8;
        @(posedge clk)
        loc <= 12;
        @(posedge clk)
        $display("Completed");

        load <= 0;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        for (i = 0; i < 8; i++) begin
            $display("%d -> %d", LSR_vec[i], result[i]);
        end
        #1 $finish;
    end

endmodule

