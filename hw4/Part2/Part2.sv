
/****************************************************************************
 * Part2.sv
 ****************************************************************************/

  
/**
 * Module: Part2
 * 
 * TODO: Add module documentation
 */
module Part2(input [17:0]SW,input [0:0]KEY,output [0:0] LEDG,output [17:0]LEDR,output [0:6] HEX0);

	assign LEDR=SW;
	reg [3:0]BCD;
	FSMPart2 toDigit(KEY, 1, SW[2:1],SW[0],BCD);
	HexHEXd outState(BCD,HEX0);

endmodule


