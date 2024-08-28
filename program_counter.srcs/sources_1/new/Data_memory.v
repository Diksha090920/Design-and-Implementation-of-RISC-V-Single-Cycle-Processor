`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2024 23:14:26
// Design Name: 
// Module Name: Data_memory
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


module Data_memory ( clk,reset, MemWrite, MemRead, Address, write_data,Read_data);

input clk, reset,MemWrite, MemRead;
input [31:0] Address,write_data;
output [31:0] Read_data;

reg [31:0] Dmemory [63:0];
integer k;

assign Read_data =(MemRead) ? Dmemory [Address] : 32'h0;

always @(posedge clk)

begin
if (reset == 1'b1)
begin 

for (k=0 ;k< 64 ;k=k+1)
begin
Dmemory[k] =32'h0;
end
end 

else 
if (MemWrite ) Dmemory [Address] =write_data;
end

endmodule