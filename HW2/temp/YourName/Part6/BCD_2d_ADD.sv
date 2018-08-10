//Written by:Spencer Sawyer

module BCD_2d_ADD(input [3:0]bcdAones,input [3:0]bcdAtens,
						input [3:0]bcdBones,input [3:0]bcdBtens, output [3:0] hundreds, output [3:0] tens,output [3:0]ones);

//wire [0:3]ones;
wire [0:3]tensCarry;
//wire [0:3]tensFinal;
//wire [0:3]hundreds;

BCD_Add onescarryten(bcdAones,bcdBones,0,tensCarry,ones);
BCD_Add tenscarryhundred(bcdAtens,bcdBtens,tensCarry[3],hundreds,tens);




endmodule 
