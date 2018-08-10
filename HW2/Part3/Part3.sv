//Written by:Spencer Sawyer

module Part3(input [17:0] SW,output [17:0]LEDR, output [0:6]HEX0, output [0:6]HEX1);
wire carryout;
wire [0:3] result;
assign LEDR=SW;
//wire [3:0] resultflipped;
//genvar i;
//generate
//for(i=0;i<4;i++)
//begin:name
//assign resultflipped[i] = result;
//end 
//endgenerate

FourBitAdder(SW[7:4],SW[3:0],SW[8],result,carryout);
Part2(result,carryout,HEX1,HEX0);




endmodule 