`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2024 13:54:35
// Design Name: 
// Module Name: tb_RISCV_top1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_RISCV_top;

  reg clk;
  reg reset;

  // Internal signals
  wire [31:0] instructionTop, instruction_outTop, read_dataTop, read_data2Top, ALUresultTOP;
  wire [3:0] ALUControlTop;
  wire RegWriteTop, MemWriteTop, MemReadTop;
  wire [1:0] ALUop_out;

  // Instantiate the RISCV_top module
  RISCV_top uut (
    .clk(clk),
    .reset(reset)
  );

  // Clock generation
  always #5 clk = ~clk; // 10ns period

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Apply reset
    #10;
    reset = 0;

    // Initialize instruction memory with instructions
    // Here we use some hypothetical instructions for ALU operations
    // In a real scenario, you need to use the correct binary opcode and funct3/funct7 for your ALU operations.

    // Load the instruction memory
    uut.Instruction_mem.Memory[0] = 32'h00000000; // NOP or any other initialization
    uut.Instruction_mem.Memory[1] = 32'h00000013; // Example instruction
    uut.Instruction_mem.Memory[2] = 32'h00000023; // Example instruction

    // Add more instructions as needed
    // Example for addition: add x1, x2, x3
    // Example for subtraction: sub x1, x2, x3

    // Apply specific test cases
    // Test Addition: (e.g., ADD instruction)
    // Assuming the instruction at address 1 performs addition
    // Make sure to set up the Register_file and ALUControl accordingly

    // Example values
    uut.Register_file.Registers[1] = 32'h00000005; // x1 = 5
    uut.Register_file.Registers[2] = 32'h00000003; // x2 = 3

    // Wait for a few clock cycles
    #20;

    // Check results (you need to adjust this part based on your specific instruction and expected results)
    $display("ALU Result: %h", uut.ALU.ALU_result);
    $display("Read Data1: %h", uut.Register_file.Read_data1);
    $display("Read Data2: %h", uut.Register_file.Read_data2);

    // Add more test cases as needed
    // Example for subtraction, multiplication, etc.

    // Finish simulation
    #100;
    $finish;
  end

  // Monitor signals (optional)
  initial begin
    $monitor("Time = %0t | PC = %h | Instruction = %h | ALU Result = %h", $time, uut.instructionTop, uut.instruction_outTop, uut.ALU.ALU_result);
  end

endmodule

