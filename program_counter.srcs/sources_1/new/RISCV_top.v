`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2024 20:27:11
// Design Name: 
// Module Name: RISCV_top
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


module RISCV_top( input clk,reset);
wire [31:0] instructionTop, instruction_outTop, read_dataTop,read_data2Top, ALUresultTOP;
wire [3:0] ALUControlTop;
wire RegWriteTop,MemWriteTop, MemReadTop ;
wire [1:0] ALUop_out;

program_counter program_counter

(.clk(clk),
.reset(reset),
.PC_in(),
.PC_out(instructionTop)
);

Instruction_mem instruc_mem 
(
.reset(reset),
.read_address(instructionTop),
.instruction_out(instruction_outTop)

);

Register_file Register_file(
.clk(clk), 
.reset(reset) ,
.Rs1(instruction_outTop), 
.Rs2(instruction_outTop),
.Rd(instruction_outTop),
.Write_data(ALUresultTOP),
.RegWrite(RegWriteTop),
.Read_data1(read_dataTop), 
.Read_data2(read_data2Top)
);

ALU ALU 
(
.A(read_dataTop),
.B(read_data2Top),
.zero(),
.ALUControl_in(ALUControlTop),
.ALU_result (ALUresultTOP)
);


Data_memory Data_memeory (
 .clk(clk),
 .reset(reset),
  .MemWrite(MemWriteTop), 
  .MemRead(MemReadTop), 
  .Address(ALUresultTOP), 
  .write_data(), 
  .Read_data());
  
  ALUControl ALUControl (
  .ALUop_in(ALUop_out),
   .func7(instruction_outTop),
   .func3(instruction_outTop),
   .ALUControl_out(ALUControlTop) );
     
Control_unit control_unit (.opcode(),
.branch(),
.memRead(MemReadTop),
 .memReg(),
 .memWrite(MemWriteTop), 
 .ALUScr(), 
 .RegWrite(RegWriteTop), 
 .ALUop_out(ALUop_out));  
endmodule
