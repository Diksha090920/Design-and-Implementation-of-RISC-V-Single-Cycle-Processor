# Design-and-Implementation-of-RISC-V-Single-Cycle-Processor

RISC-V Processor Design and Implementation in Verilog

This project focuses on the design, implementation, and simulation of a basic RISC-V processor using Verilog. The RISC-V architecture is an open-source instruction set architecture (ISA) that has gained significant popularity for its simplicity and extensibility. This project implements a subset of the RISC-V ISA, covering fundamental instructions and components essential for a basic processor.
Project Components

1)Program Counter (PC):
A register that holds the address of the current instruction being executed. The PC is incremented by 4 bytes (the size of each instruction) to point to the next instruction in memory.

2)Instruction Memory:
A memory module that stores the instructions to be executed by the processor. This project includes a basic instruction memory that holds 64 instructions, each 32-bit wide.

3)Register File:
 A set of 32 general-purpose registers, each 32 bits wide. The register file supports read and write operations, allowing the processor to store and retrieve data during instruction execution.

4)Arithmetic Logic Unit (ALU):
The ALU performs arithmetic and logical operations based on the control signals provided by the control unit. Supported operations include addition, subtraction, AND, and OR.

5)ALU Control Unit:
This module generates the appropriate control signals for the ALU based on the instruction's function code (func7 and func3) and the operation type (ALUop).

6)Control Unit:
The control unit generates control signals required for the operation of various components in the processor. It interprets the opcode of the current instruction and sets signals like RegWrite, ALUSrc, MemRead, MemWrite, and Branch.

7)Data Memory:
This module simulates the data memory used for load and store operations. The processor can read from and write to this memory as dictated by the instructions.

8)PC Adder:
A simple adder that increments the program counter by 4 to move to the next instruction.

9)Instruction Adder:
A module that handles the addition of operands in certain instruction types, working alongside the ALU.

Test Bench

The project includes a comprehensive test bench that simulates the processor's operation. The test bench initializes the processor, provides clock and reset signals, and loads instructions into the instruction memory. Example test cases include arithmetic operations like addition and subtraction, validating the correctness of the processor's execution pipeline.
