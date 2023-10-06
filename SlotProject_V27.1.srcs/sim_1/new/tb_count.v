`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 12:41:03 PM
// Design Name: 
// Module Name: tb_top
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


module tb_count(
    
    );
    
    reg reset,start,button;
    wire [2:0]count;

    
    
    counter testing(.reset(reset),.start(start),.button(button),.count(count));
    
    initial
    begin
        reset = 0;
        start = 0;
        button = 0;
        
        #20 start = 1;
        #25 start = 0;
        
        #50 button = 1;
        #55 button = 0;
        
        #150 button = 1;
        #155 button = 0;
        
        #250 button = 1;
        #255 button = 0;
    end
endmodule
