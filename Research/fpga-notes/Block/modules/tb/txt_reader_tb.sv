module test_reader(
    input logic [9:0] loc, // location of instruction in the reader
    output logic [31:0] instr
);

    // 1. Declare an unpacked array of bytes to store the hex data
    // Adjust the array size (e.g., 1024) to fit your maximum expected file size
    byte memory_buffer [0:1023];
    logic [31:0] test;

    initial begin
        // 2. Load the hex text file directly into the array
        // $readmemh automatically ignores whitespace, newlines, and '//' comments
        $readmemh("sample.txt", memory_buffer);

        // 3. Process or display the loaded byte values
        $display("Displaying first 5 parsed byte values:");
        for (int i = 0; i < 10; i++) begin
            $display("Index %0d: Hex value = 8'h%h | Decimal = %0d", i, memory_buffer[i], memory_buffer[i]);
        end

        test = {memory_buffer[0], memory_buffer[1], memory_buffer[2], memory_buffer[3] };

        $display("Instruction hex: %h", test);

    end

    assign instr = {memory_buffer[loc], memory_buffer[loc+1], memory_buffer[loc+2], memory_buffer[loc+3]};

endmodule
