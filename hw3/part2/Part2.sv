/*spencer sawyer
Fmax:375.52 MHz logic element are only 46 now.
*/
module Part2(input [17:0] SW, output [17:0] LEDR, output [0:6]HEX0,
             input [0:0] KEY, output [0:0] LEDG,  output [0:6]HEX1,
															     output [0:6]HEX2,
															     output [0:6]HEX3);
		
		reg [15:0] Q;
		assign LEDR=SW;
		assign LEDG=KEY;
		
		counter b16(SW[0], KEY, SW[1],Q);
		
		


		
		HexHEXd         H0( Q[3:0],    HEX0);
		HexHEXd         H1( Q[7:4],    HEX1);
		HexHEXd         H2( Q[11:8],   HEX2);
		HexHEXd         H3( Q[15:12],  HEX3);
																  
																  
																  
																  
 

endmodule
