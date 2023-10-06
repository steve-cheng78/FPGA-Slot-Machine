`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 11:03:37 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input reset,
    input start,
    input button,
    output reg [2:0] count,
    output reg [2:0] go
    );
    
    always@(posedge reset or posedge start or posedge button)
    begin
        if(reset)
            count <= 3'b000;
        else if (start)
            begin
                count <= 3'b001;
            end
            
        else if (button && count < 3'b100 && count > 3'b000)
            begin
                count <= count + 3'b001;      
                   
            end
    end
endmodule

