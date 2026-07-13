module register_tb();

    logic [2:0] A_idx, B_idx, dst_idx;
    logic [31:0] data;
    logic clk, wr_en, rst;
    logic [31:0] out_A, out_B;

    data_register #(32) dut(.*);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    logic [3:0] i;

    initial begin
        $monitor($time,, "A_id=%b, B_id=%b, A = %d, B = %d", A_idx, B_idx, out_A, out_B);
            rst <= 1;
            data <= '0;
            dst_idx <= '0;
            wr_en <= 0;
            A_idx <= 0;
            B_idx <= 0;
            @(posedge clk)
            @(posedge clk)
            @(posedge clk)
            @(posedge clk)
        for(i = '0; i < 4'd8; i++) begin

            @(posedge clk)
            rst <= 0;
            data <= $urandom_range(100, 1);
            wr_en <= 1;
            dst_idx <= i;

            @(posedge clk)
            wr_en <= 0;
            @(posedge clk)
            A_idx <= i;
            @(posedge clk)
            B_idx <= i;

        end
        #1 $finish;
    end
endmodule
