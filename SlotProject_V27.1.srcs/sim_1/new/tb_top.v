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


module tb_top(
    
    );
    
    reg clk, reset, start, stop;
    wire [6:0]cathode;
    wire [7:0]anode;
    wire win;
    wire [2:0]count;
    wire [3:0] right;
    wire [3:0] left;
    wire [3:0] middle;
    wire [3:0] digit;
    
    top testing(.clk(clk),.reset(reset),.start(start),.stop(stop),.cathode(cathode),.anode(anode),.win(win),.count(count),.right(right),.left(left),.middle(middle),.digit(digit));
    
    initial
    begin
        clk = 0;
        reset = 0;
        start = 0;
        stop = 0;
        
        #10 reset = 1;
        #15 reset = 0;
        
        #20 start = 1;
        #22 start = 0;
        
        #10 stop = 1;
        #20  stop = 0;
        
    end
    
    always
        #10 clk = ~clk;
        
        
endmodule
