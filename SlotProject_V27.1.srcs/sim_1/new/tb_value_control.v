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


module tb_value_control(
    
    );
    
    reg [3:0] right, middle, left;
    reg clk;
    reg stop;
    reg [2:0] counter;
    reg [7:0] anode;
    wire [3:0] value;
    
    value_control testing(.right(right),.middle(middle),.left(left),.clk(clk),.stop(stop),.counter(counter),.anode(anode),.value(value));
    
    initial
    begin
        clk = 0;
        stop = 0;
        counter = 0;
        anode = 0;
        right = 0;
        middle = 0;
        left = 0;
        
        #100 counter = 3'b001;
        anode = 8'b11111110;
        
        #200 counter = 3'b010;
        stop = 1;
        anode = 8'b11111101;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111110;
        #100 stop = 0;
        
        
        #300 counter = 3'b011;
        stop = 1;
        anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111011;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111011;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111011;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111011;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111011;
        #10 anode = 8'b11111110;
        #10 anode = 8'b11111101;
        #10 anode = 8'b11111011;
        #10 anode = 8'b11111110;
        
        #100 stop = 0;
        
        
       
        
    end
    
    always
    begin
        #1 clk = ~clk;
    end
    always
    begin
        #13 right = right + 4'b0001;
        #13 left = left + 4'b0010;
        #13 middle = middle + 4'b0011;
    end
        
endmodule
