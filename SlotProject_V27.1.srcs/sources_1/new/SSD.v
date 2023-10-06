`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 10:03:33 PM
// Design Name: 
// Module Name: SSD
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


module SSD(
    input [3:0] num,
    output reg [6:0] D
    );
    
    parameter BLANK = 7'b111_1111;
    parameter ZERO = 7'b100_0000;
    parameter ONE = 7'b111_1001;
    parameter TWO = 7'b010_0100;
    parameter THREE = 7'b011_0000;
    parameter FOUR = 7'b101_1000;
    parameter FIVE = 7'b001_0010;
    parameter SIX = 7'b000_0010;
    parameter SEVEN = 7'b001_1001;
    parameter EIGHT = 7'b000_0000;
    parameter NINE = 7'b001_0000;
    /*parameter A = 7'b000_1000;
    parameter b = 7'b110_0000;
    parameter C = 7'b011_0001;
    parameter d = 7'b100_0010;
    parameter E = 7'b011_0000;
    parameter F = 7'b011_1000;
    */
    
    always@(num)
        case (num)
            4'b0000:  D = ZERO;
            4'b0001:  D = ONE;
            4'b0010:  D = TWO;
            4'b0011:  D = THREE;
            4'b0100:  D = FOUR;
            4'b0101:  D = FIVE;
            4'b0110:  D = SIX;
            4'b0111:  D = SEVEN;
            4'b1000:  D = EIGHT;
            4'b1001:  D = NINE;
            4'b1010: D = ZERO;
            4'b1011: D = ONE;
            4'b1100: D = TWO;
            4'b1101: D = THREE;
            4'b1110: D = FOUR;
            4'b1111: D = FIVE;
            /* 4'b1010: D = A;
            4'b1011: D = b;
            4'b1100: D = C;
            4'b1101: D = d;
            4'b1110: D = E;
            4'b1111: D = F;
            */
            default:    D = BLANK;
        endcase           
endmodule

