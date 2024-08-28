`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2024 23:45:52
// Design Name: 
// Module Name: Register_file
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


module Register_file(clk, reset ,Rs1,Rs2,Rd,Write_data,RegWrite,Read_data1,Read_data2);

input clk,reset, RegWrite;
input [19:15] Rs1; //5 bit
input [24:20] Rs2; //5 bit 
input [11:7] Rd; //5bit 
input [31:0] Write_data; //32 bits

integer k;
output [31:0] Read_data1, Read_data2;
reg [31:0] Registers [31:0] ;// 32 registers each of 32 bit  wide
assign Read_data1 =Registers[Rs1];
assign Read_data2 =Registers[Rs2];

always @ (posedge clk)
begin 
if (reset ==1'b1)
begin
for (k=0;k<31;k=k+1)
begin
  Registers [k] =32'h0;
 end
end
else if (RegWrite == 1'b1) Registers[Rd] = Write_data;

end
endmodule
