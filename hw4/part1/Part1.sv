
/****************************************************************************
 * Part1.sv
 ****************************************************************************/

  
/**
 * Module: Part1
 * 
 * TODO: Add module documentation
 */
module Part1(input [17:0]SW,input [0:0]KEY,output [0:0] LEDG,output [17:0]LEDR,output [0:6] HEX0);
assign LEDR=SW;
reg [3:0] state;
Part1FSM withButton(SW[2],KEY,SW[1],LEDG,SW[0],state);
HexHEXd outState(state,HEX0);


endmodule


