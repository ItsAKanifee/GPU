`timescale 1ns/1ps
module datapath_tb();
    parameter WIDTH = 32;
    logic clk, rst;
    logic valid_in;
    logic [WIDTH-1:0] in_a, in_b, in_c;
    logic valid_out;
    logic [WIDTH-1:0] out_result;

    // DUT
    int_datapath #(.WIDTH(WIDTH)) dut (
        .clk(clk), .rst(rst), .valid_in(valid_in), .in_a(in_a), .in_b(in_b), .in_c(in_c),
        .valid_out(valid_out), .out_result(out_result)
    );

    // clk
    initial clk = 0;
    always #5 clk = ~clk; // 100 MHz

    integer i;
    integer seed;
    integer errors;

    initial begin
        rst = 1; valid_in = 0; in_a = 0; in_b = 0; in_c = 0; errors = 0; seed = 32'hDEADBEEF;
        #20; rst = 0; #20;

        // drive a burst of random vectors
        for (i = 0; i < 1000; i = i + 1) begin
            in_a = $urandom(seed);
            in_b = $urandom(seed);
            in_c = $urandom(seed);
            valid_in = 1;
            @(posedge clk);
            valid_in = 0;

            // wait for output (two cycles later)
            @(posedge clk);
            @(posedge clk);

            // compute expected result with 64-bit intermediate
            longint unsigned expected64;
            expected64 = (longint unsigned)in_a * (longint unsigned)in_b + (longint unsigned)in_c;
            logic [WIDTH-1:0] expected;
            expected = expected64[WIDTH-1:0];

            if (valid_out) begin
                if (out_result !== expected) begin
                    $display("Mismatch at sample %0d: a=%0h b=%0h c=%0h got=%0h exp=%0h", i, in_a, in_b, in_c, out_result, expected);
                    errors = errors + 1;
                end
            end else begin
                $display("No valid_out when expected at sample %0d", i);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("PASS: all vectors matched"); else $display("FAIL: %0d mismatches", errors);
        $finish;
    end
endmodule
