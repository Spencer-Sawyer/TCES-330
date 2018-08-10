/*spencer sawyer
Fmax:386.55 MHz logic element are only 44 now.
*/
module Part3(input [17:0] SW, output [17:0] LEDR, output [0:6]HEX0,
             input [0:0] KEY, output [0:0] LEDG,  output [0:6]HEX1,
															     output [0:6]HEX2,
															     output [0:6]HEX3);
		
		reg [15:0] Q;
		assign LEDR=SW;
		assign LEDG=KEY;
		
		count2 b16(~SW[1], KEY, SW[0],Q);
		
		


		
		HexHEXd         H0( Q[3:0],    HEX0);
		HexHEXd         H1( Q[7:4],    HEX1);
		HexHEXd         H2( Q[11:8],   HEX2);
		HexHEXd         H3( Q[15:12],  HEX3);
																  
																  
																  
																  
 

endmodule
