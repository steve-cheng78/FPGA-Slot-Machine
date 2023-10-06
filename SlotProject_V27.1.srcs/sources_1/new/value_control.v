`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 10:56:18 PM
// Design Name: 
// Module Name: value_control
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


module value_control(
    input [3:0] right,
    input [3:0] middle,
    input [3:0] left,
    input clk,
    input stop,
    //input reset,
    input [2:0] counter,
    input [7:0] anode,
    output reg [3:0] value,
    output reg win
    );
    
    reg [3:0] savedValue1;
    reg [3:0] savedValue2;
    reg [3:0] savedValue3;
    
    always@(posedge stop) //saves the random number
    begin
        
            case(counter)
                3'b001: savedValue1 = right; 
                3'b010: savedValue2 = middle; 
                3'b011: savedValue3 = left; 
            endcase
        
        if (savedValue1 == savedValue2 && savedValue2 == savedValue3) win = 1;
        
    end
    
    /*
    always @(posedge reset)
    begin
        if (counter == 3'b000)
        begin
            savedValue1 = 1;
            savedValue2 = 2;
            savedValue3 = 3;
        end
    end
    */
    
    always @(posedge clk)
    begin
        if (counter == 3'b001) value <= right;
        else if (counter == 3'd2 && anode == 8'b11111110) value <= middle;
        else if (counter == 3'd2 && anode == 8'b11111101) value <= savedValue1;
        else if (counter == 3'd3 && anode == 8'b11111110) value <= savedValue2;
        else if (counter == 3'd3 && anode == 8'b11111101) value <= left;
        else if (counter == 3'd3 && anode == 8'b11111011) value <= savedValue1;
        else if (counter == 3'd4 && anode == 8'b11111110) value <= savedValue2;
        else if (counter == 3'd4 && anode == 8'b11111101) value <= savedValue3;
        else if (counter == 3'd4 && anode == 8'b11111011) value <= savedValue1;
    end
    
    /*
    always @(posedge clk)
    begin
        if (counter == 3'b001) value <= right;
        else if (counter == 3'd2 && anode == 8'b11111110) value <= middle;
        else if (counter == 3'd2 && anode == 8'b11111101) value <= savedValue1;
        else if (counter == 3'd3 && anode == 8'b11111110) value <= savedValue2;
        else if (counter == 3'd3 && anode == 8'b11111101) value <= left;
        else if (counter == 3'd3 && anode == 8'b11111011) value <= savedValue1;
        else if ((counter == 3'd4 || counter == 3'd5) && anode == 8'b11111110) value <= savedValue2;
        else if ((counter == 3'd4 || counter == 3'd5) && anode == 8'b11111101) value <= savedValue3;
        else if ((counter == 3'd4 || counter == 3'd5) && anode == 8'b11111011) value <= savedValue1;
    end
    */
     
    /* always @(posedge clk)
    begin
        if (counter == 3'b001) value <= right;
        else if (counter == 3'd2 && anode == 8'b11111110) value <= savedValue1;
        else if (counter == 3'd2 && anode == 8'b11111101) value <= middle;
        else if (counter == 3'd3 && anode == 8'b11111110) value <= savedValue1;
        else if (counter == 3'd3 && anode == 8'b11111101) value <= savedValue2;
        else if (counter == 3'd3 && anode == 8'b11111011) value <= left;
        else if (counter == 3'd4 && anode == 8'b11111110) value <= savedValue1;
        else if (counter == 3'd4 && anode == 8'b11111101) value <= savedValue2;
        else if (counter == 3'd4 && anode == 8'b11111011) value <= savedValue3;
    end   
    */
endmodule
