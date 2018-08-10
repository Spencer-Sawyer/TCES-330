
/****************************************************************************
 * Part1.sv
 ****************************************************************************/

  
/**
 * Module: Part1
 * 
 * TODO: Add module documentation
 */
module Part1(input [17:0]SW,input [0:0]KEY,output [0:0] LEDG,output [17:0]LEDR);
assign LEDR=SW;
Part1FSM withButton(SW[2],KEY,SW[1],LEDG,SW[0]);


endmodule


