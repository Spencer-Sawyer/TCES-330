//`include "Mux_4w_2_to_1.sv" thought I needed something like this. Turns out I did not.
//Spencer Sawyer
module Part2(input [17:0]SW,output [17:0]LEDR,output [3:0]LEDG);
wire S;
wire [0:3]X;
wire [0:3]Y;

assign S = SW[17];
assign X = SW[3:0];
assign Y = SW[7:4];
//Assigned Switches to different variables for readability.
assign LEDR=SW;

Mux_4w_2_to_1(S,X,Y,LEDG);
endmodule
