// Reads a txt document with byte code and stores in memory
module Instr_Cache_tb();
    logic [31:0] in;
    logic [5:0] req;
    logic load, clk, rst;
    logic [31:0] instr;

    logic [9:0] rd_loc; // location cache is reading from the test reader
    logic [4:0] i;

    Instr_Cache#(32, 64) dut(.*);
    test_reader tr(.instr(in), .loc(rd_loc));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    /* initial begin // load the cache */
    /*     $monitor($time,, "load: %h, rd_loc = %h", load, rd_loc); */
    /*     rst = 1; */
    /*     load = 1; */
    /*     rst = 0; */
    /*     for (i = 0; i < 10; i++) begin */
    /*         rd_loc = i; */
    /*     end */
    /*     load = 0; */
    /* end */

    initial begin
        $monitor($time,, "Instr: %h, loc = %h", instr, req);
        @(posedge clk)
        rst <= 1;
        @(posedge clk)
        req <= 0;
        load <= 1;
        rst <= 0;

        rd_loc <= 0;
        @(posedge clk)
        rd_loc <= 4;
        @(posedge clk)
        rd_loc <= 8;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)

        req <= 1;

        @(posedge clk)

        req <= 2;
        @(posedge clk)
        #1 $finish;
    end

endmodule
