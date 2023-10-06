`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 11:42:36 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input reset,
    input start,
    input stop,
    output wire [6:0] cathode,
    output wire [7:0] anode,
    output led
    //output [3:0] count,
    //output [3:0] right, left, middle,
    //output [3:0] digit
    );
    
    wire [2:0] count;
    wire [3:0] left, middle, right; //These are the random numbers
    wire [3:0] digit;
    wire divided_clk_ten;
    wire divided_clk_one;
    wire divided_clk;
    wire win = 0;
    //wire [2:0] go;
    
    master_clk_divider divideMaster(clk,reset,divided_clk);
    tenHz_clk_divider divideTen(clk,reset,divided_clk_ten);
    oneHz_clk_divider divideOne(clk,reset,divided_clk_one);
    
    counter button_count(.reset(reset),.start(start),.button(stop),.count(count)/*,.go(go)*/); //increases "count" when stop button is pressed
    LFSR num1(.clk(divided_clk_ten),.reset(reset),/*.go(go[0]),*/.num(right));
    LFSR num2(.clk(divided_clk_ten),.reset(reset),/*.go(go[1]),*/.num(middle));
    LFSR num3(.clk(divided_clk_ten),.reset(reset),/*.go(go[2]),*/.num(left));
    
    
    anode_control anode1(.counter(count),.clk(divided_clk),.anode(anode)); //When button is pressed, the next digit turns on. Cycles through anodes rapidly for multiple on digits
    value_control value(.right(right),.middle(middle),.left(left),.clk(divided_clk),.stop(stop),.counter(count),.anode(anode),.value(digit),.win(win)); //cycles through random and saved values to show on the right anodes at the right time
    SSD value_to_cathode(.num(digit),.D(cathode)); //shows the digit on the FPGA
    
    LED_blink won(.clk(divided_clk_one),.win(win),.led(led));
    
endmodule
