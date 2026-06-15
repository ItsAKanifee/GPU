`timescale 1ns/1ps

module int_core_tb;

    parameter WIDTH = 32;

    // DUT signals
    logic clk;
    logic rst;
    logic [7:0][WIDTH-1:0] A, B;
    logic [2:0] opcode;
    logic [7:0][WIDTH-1:0] C;

        // Example vector sets
        logic [7:0][WIDTH-1:0] vecA;
        logic [7:0][WIDTH-1:0] vecB;
    // Instantiate DUT
    int_core #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .opcode(opcode),
        .C(C)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task: apply one vector of inputs
    task run_op(
        input [2:0] op,
        input [7:0][WIDTH-1:0] a_vec,
        input [7:0][WIDTH-1:0] b_vec
    );
        begin
            opcode = op;
            A = a_vec;
            B = b_vec;

            @(posedge clk); // allow pipeline to capture
            @(posedge clk); // allow ALU to compute

            $display("OP=%0d  A=%d  B=%d  C=%d", op, a_vec[1], b_vec[1], C[1]);
        end
    endtask

    // Reset logic
    task apply_reset;
        begin
            rst = 1;
            A = '0;
            B = '0;
            opcode = 0;
            repeat (3) @(posedge clk);
            rst = 0;
        end
    endtask

    // Test vectors
    initial begin
        clk = 0;
        apply_reset;


        // Fill vectors with simple patterns
        for (int i = 0; i < 8; i++) begin
            vecA[i] = i;
            vecB[i] = 8 - i;
        end

        // Test ADD
        run_op(3'd0, vecA, vecB);

        // Test SUB
        run_op(3'd1, vecA, vecB);

        // Test MUL
        run_op(3'd2, vecA, vecB);

        // Test AND
        run_op(3'd3, vecA, vecB);

        // Test OR
        run_op(3'd4, vecA, vecB);

        // Test XOR
        run_op(3'd5, vecA, vecB);

        // Randomized tests
        repeat (5) begin
            for (int i = 0; i < 8; i++) begin
                vecA[i] = $urandom_range(10, 100);
                vecB[i] = $urandom_range(10, 100);
            end
            run_op($urandom_range(0,5), vecA, vecB);
        end

        $display("All tests completed.");
        $finish;
    end

endmodule

