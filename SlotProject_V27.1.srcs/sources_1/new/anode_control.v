`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 10:50:25 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
    input [2:0] counter,
    input clk,
    //input start,
    //input stop,
    //input reset,
    //output reg [2:0] upUntil,
    output reg [7:0] anode
    );
  
  /*  
    reg [2:0]upUntil;
    
    always @(posedge clk or posedge stop)
    begin
            //if (!start) upUntil <= upUntil;
            
            //else begin
            if (start) upUntil <= 3'b110; //right on
            else if (stop && counter == 3'b001) upUntil <= 3'b101; //right and middle on
            else if (stop && (counter == 3'b010 || counter == 3'b011)) upUntil <= 3'b011; //all on
            else if (reset) upUntil <= 3'b111;
            //end
    end
    
    always @(posedge clk)
    begin
        if (upUntil == 3'b111) anode <= 8'b11111111;
        else if (upUntil == 3'b110) anode <= 8'b11111110;
        else if (upUntil == 3'b101 && anode == 8'b11111110) anode <= 8'b11111101;
        else if (upUntil == 3'b101 && anode == 8'b11111101) anode <= 8'b11111110;
        else if (upUntil == 3'b011 && anode == 8'b11111110) anode <= 8'b11111101;
        else if (upUntil == 3'b011 && anode == 8'b11111101) anode <= 8'b11111011;
        else if (upUntil == 3'b011 && anode == 8'b11111011) anode <= 8'b11111110;
        
    end
  */
    
    always @(posedge clk)
    begin
        if (counter == 3'b000) anode <= 8'b11111111;
        else if (counter == 3'b001) anode <= 8'b11111110;
        else if (counter == 3'b010 && anode == 8'b11111110) anode <= 8'b11111101;
        else if (counter == 3'b010 && anode == 8'b11111101) anode <= 8'b11111110;
        else if ((counter == 3'b011 || counter == 3'b100) && anode == 8'b11111110) anode <= 8'b11111101;
        else if ((counter == 3'b011 || counter == 3'b100) && anode == 8'b11111101) anode <= 8'b11111011;
        else if ((counter == 3'b011 || counter == 3'b100) && anode == 8'b11111011) anode <= 8'b11111110;
        
        
    end
endmodule
