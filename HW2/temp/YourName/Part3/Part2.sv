//Written by:Spencer Sawyer

module Part2(input [3:0]SW,input carryout, output [0:6]HEX1,output [0:6]HEX0);


wire [0:3] tens;
wire [0:3] ones;
wire [0:7] tennum;
logic CASE_VALUE;
assign tens[3]=carryout;
assign tens[0:2]=0;

//HexDtoDec firstThingFirst(SW,tens,ones); //don't need this for this part
HexHEXd onesnumber(SW,HEX0); //From here, we always want the one's place to display SOME value of some sort.
HexHEXd tensnumber(tens,tennum); //The ten's place shouldn't display a number unless carryout has a value
											//so we write the value of the potential HEX output here for use if it the input was bigger than 9


always @(carryout)
CASE_VALUE<=carryout;//to make it so case and always values always match, they are set here instead.

always @ (CASE_VALUE)
case (CASE_VALUE)
1:HEX1<=tennum;
0:HEX1<=7'b1111111;//instead of being zero, this should just be off.
default:;
endcase




endmodule 