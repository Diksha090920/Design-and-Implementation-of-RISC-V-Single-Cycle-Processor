`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 20:23:32
// Design Name: 
// Module Name: ALU
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


module ALU(A, B, zero, ALUControl_in, ALU_result);
  input [31:0] A, B;
  input [3:0] ALUControl_in;
  output reg [31:0] ALU_result;
  output reg zero;

  always @(*)
  begin
    case (ALUControl_in)
      4'b0000: begin 
        ALU_result <= A & B; 
        zero <= (ALU_result == 0);
      end
      4'b0001: begin 
        ALU_result <= A | B; 
        zero <= (ALU_result == 0);
      end
      4'b0010: begin 
        ALU_result <= A + B; 
        zero <= (ALU_result == 0);
      end
      4'b0110: begin 
        ALU_result <= A - B; 
        zero <= (ALU_result == 0);
      end
      default: begin 
        ALU_result <= A; 
        zero <= (ALU_result == 0);
      end
    endcase
  end

endmodule