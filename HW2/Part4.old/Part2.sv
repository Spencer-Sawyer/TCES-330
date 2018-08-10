//Written by:Spencer Sawyer

module Part2(input [3:0]SW, output [0:6]HEX1,output [0:6]HEX0);


wire [0:3] tens;
wire [0:3] ones;
wire [0:6] tennum;
logic CASE_VALUE;

HexDtoDec firstThingFirst(SW,tens,ones); //turning our Hexidecemal value into two decimal values instead.
HexHEXd onesnumber(ones,HEX0); //From here, we always want the one's place to display SOME value of some sort.
HexHEXd tensnumber(tens,tennum); //The ten's place shouldn't display a number unless it's a number bigger than 9
											//so we write the value of the potential HEX output here for use if it the input was bigger than 9

assign s=SW;
always @(s)
CASE_VALUE<=s>9;//to make it so case and always values always match, they are set here instead.

always @ (CASE_VALUE)
case (CASE_VALUE)
1:HEX1<=tennum;
0:HEX1<=7'b1111111;//instead of being zero, this should just be off.
default:;
endcase




endmodule 