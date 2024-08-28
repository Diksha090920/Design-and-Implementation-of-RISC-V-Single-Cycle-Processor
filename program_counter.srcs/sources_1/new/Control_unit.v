`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2024 12:58:00
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(opcode,branch,memRead, memReg,memWrite, ALUScr, RegWrite, ALUop_out);
input [6:0] opcode;
output reg branch,memRead, memReg,memWrite, ALUScr, RegWrite;
output reg [1:0] ALUop_out;

always @(*) begin

case (opcode)
7'b0110011:// for R-type instruction 
begin
branch <= 0;
memRead <=0;
memReg <=0;
memWrite<=0;
ALUScr<=0;
RegWrite<=1;
ALUop_out <=2'b10;
end
endcase
end
endmodule
