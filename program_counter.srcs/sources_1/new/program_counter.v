`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2024 19:53:02
// Design Name: 
// Module Name: program_counter
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


module program_counter(clk,reset, PC_in, PC_out );
input clk, reset;
input [31:0] PC_in;
output reg[31:0] PC_out;

always @ (posedge clk ) // PC is a register that holds the address for the next instruction 
begin 
if (reset)
 PC_out <= 32'h00000000;
else
 PC_out <= PC_in;
end
endmodule
