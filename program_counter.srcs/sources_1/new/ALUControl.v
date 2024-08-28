`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2024 23:16:07
// Design Name: 
// Module Name: ALUControl
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


module ALUControl (ALUop_in, func7, func3, ALUControl_out );

input [1:0] ALUop_in;
input [31:25] func7;
input [14:12] func3;
output reg [3:0] ALUControl_out;

always @ (*) 
begin

case ({ALUop_in,func7, func3}) // concatenation 

12'b00_xxxxxxx_xxx : ALUControl_out = 4'b0010;
12'b01_xxxxxxx_xxx : ALUControl_out = 4'b0110;
12'b10_0000000_000 : ALUControl_out = 4'b0010;
12'b00_0100000_000 : ALUControl_out = 4'b0110;
12'b00_0000000_111 : ALUControl_out = 4'b0000;
12'b00_0000000_110 : ALUControl_out = 4'b0001;

endcase
end 
 
endmodule
