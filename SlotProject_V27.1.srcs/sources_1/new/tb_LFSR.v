`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 02:52:15 PM
// Design Name: 
// Module Name: tb_LFSR
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


module tb_LFSR(

    );
    
    reg clk, reset;
    wire [3:0]num;
    
    LFSR testing(.clk(clk),.reset(reset),.num(num));
    
    initial begin
        clk = 0;
        reset = 0;
        #5 reset = 1;
        #15 reset = 0;
    end
    
    always begin
    
        #10 clk = ~clk;
    end
endmodule
