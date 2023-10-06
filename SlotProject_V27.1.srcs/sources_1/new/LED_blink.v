`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 01:06:35 PM
// Design Name: 
// Module Name: LED_blink
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


module LED_blink(
    input clk,
    input win,
    output reg led
    );
    
    always@(posedge clk or posedge win)
        if(win)
        begin
            if(clk)
                led = 1;
            else
                led = 0;
        end    
endmodule
