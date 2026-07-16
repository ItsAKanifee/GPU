module alu_testbench();

    logic [31:0] a, b, result;
    logic [3:0] opcode;
    logic [4:0] i;
    alu #(32) dut(.*);

    initial begin
        $monitor($time,,"op: %d | a = %d, b = %d, -> result = %d", opcode, a, b, result);

        a = 1;
        b = 1;
        opcode = 0;

        for(i = '0; i < 5'd16; i++) begin
            #5 opcode = i[4:0];
        end
    end
endmodule
