
/****************************************************************************
 * Part3.sv
 ****************************************************************************/

  
/**
 * Module: Part3
 * 
 * TODO: Add module documentation
 */
module Part3(input [17:0]SW,input [0:0]KEY,output [0:0] LEDG,output [17:0]LEDR,	output [0:6] HEX0,
																				output [0:6] HEX1,
																				output [0:6] HEX2,
																				output [0:6] HEX3,
																				output [0:6] HEX4,
																				output [0:6] HEX5,
																				output [0:6] HEX6,
																				output [0:6] HEX7);

	assign LEDR=SW;
	localparam
		H=0,
		E=1,
		L=2,
		O=3,
		b=4;
		
	reg [7:0][3:0]BCD;
	reg [7:0][3:0]IN;
	assign IN[0]=H;
	assign IN[1]=E;
	assign IN[2]=L;
	assign IN[3]=L;
	assign IN[4]=O;
	assign IN[5]=b;
	assign IN[6]=b;
	assign IN[7]=b;
	
	
	
	FSMPart3 toDigit(KEY, 1, IN,SW[0],BCD);
	
	HexHELO outStateZero (BCD[0],HEX0);
	HexHELO outStateOne  (BCD[1],HEX1);
	HexHELO outStateTwo  (BCD[2],HEX2);
	HexHELO outStateThree(BCD[3],HEX3);
	HexHELO outStateFour (BCD[4],HEX4);
	HexHELO outStateFive (BCD[5],HEX5);
	HexHELO outStateSix  (BCD[6],HEX6);
	HexHELO outStateSeven(BCD[7],HEX7);
	
endmodule


