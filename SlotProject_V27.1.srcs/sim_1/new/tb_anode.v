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


module tb_anode(
    
    );
    
    reg [2:0]counter;
    reg clk, start, stop;
    wire [2:0]anode;
    wire [2:0] upUntil;

    
    
    anode_control testing(.counter(counter),.clk(clk),.start(start),.stop(stop),.upUntil(upUntil),.anode(anode));
    
    initial
    begin
        clk = 0;
        counter = 0;
        start = 0;
        stop = 0;
        #15;
        
        counter = 3'b001;
        start = 1;
        stop = 0;
        #15;
        
        start = 0;
        #15;
        
        counter = 3'b010;
        stop = 1;
        #15;
        
        stop = 0;
        #15;
        
        counter = 3'b011;
        stop = 1;
        #15;
        
        stop = 0;
        #15;
        
        counter = 3'b100;
        stop = 1;
        #15;
        
        stop = 0;
        #15;
    end
    
    always
    begin
        #10 clk = ~clk;
        
    end
        
endmodule
