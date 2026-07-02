# Integer Core Experiments

## Purpose

Design and test an Integer Pipeline, that operates on data from memory

## Goals

- [x] Create an ALU that can perform simple operations (add, sub, mul) on integers
- [x] Design a block diagram that can be used to implement a lane that can perform operations on data from inputs and store them into either a register, or output them to shared memory (shared memory will be simulated for now)
- [ ] Create a lane in sv that can perform operations on data from inputs and store them into either a register, or output them to shared memory (shared memory will be simulated for now)
- [ ] Create a testbench that can test the lane with various microarchitecture inputs and outputs, and verify that the lane is functioning correctly

## Specs

- Simple Function ALU (takes 2 32-bit inputs):
  - Arithmetic Operations:
    - ADD
    - SUB
    - MUL

  - Logical Operations:
    - AND
    - OR
    - XOR
    - NOT
  
  - Shift Operations:
    - SLL (Shift Left Logical)
    - SRL (Shift Right Logical)
    - SRA (Shift Right Arithmetic)
  
  - Comparison Operations:
    - SLT (Set Less Than)
    - SLTU (Set Less Than Unsigned)
    - GT (Greater Than)
    - GTE (Greater Than or Equal)
    - EQ

- Lane_Data_Register:
  - 32-bit wide
  - Can store a multiple values at a time
  - Can be written to by the ALU, and read from ports A and B
- *To be updated*
