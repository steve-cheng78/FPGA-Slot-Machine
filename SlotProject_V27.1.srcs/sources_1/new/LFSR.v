`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 10:01:15 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input clk,
    input reset,
    //input go,
    output reg [3:0] num
    );
    
    wire feedback;
    assign feedback = ~(num[3] ^ num[2]);
    
    always@ (posedge clk, posedge reset)
    begin
        //if (go)
        begin
            if(reset)
                num = 4'b0;
            else
                num = {num[2:0],feedback};
        end
    end
endmodule
