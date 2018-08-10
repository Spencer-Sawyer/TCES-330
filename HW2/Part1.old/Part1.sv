//Written by:Spencer Sawyer

module Part1(input [15:0]SW,output [0:15]LEDR,
					output [0:6] HEX0,
					output [0:6] HEX1,
					output [0:6] HEX2,
					output [0:6] HEX3);
					HexHEXd zero (SW[3:0],HEX0);
					HexHEXd one  (SW[7:4],HEX1);
					HexHEXd two  (SW[11:8],HEX2);
					HexHEXd three(SW[15:12],HEX3);
					//HexHEXd zero(SW[0:3],HEX0);
					
endmodule 