`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2024 20:18:52
// Design Name: 
// Module Name: Instruction_mem
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


module Instruction_mem(reset,read_address, instruction_out);
input reset;
input [31:0] read_address;
output [31:0] instruction_out;


reg [31:0] Memory [63:0]; //64 registers each of 32 bits 
integer k=0;
assign instruction_out =Memory[read_address];
always @ (posedge reset )
begin
for (k=0; k < 64; k=k+1)
begin

Memory [k] =32'h00000000;
end
end
endmodule
