//Written by:Spencer Sawyer

module Part4(input [17:0] SW, output [0:6]HEX0, output [0:6]HEX1,output [0:6]HEX4,output [0:6]HEX6,output [17:0]LEDR,output [8:8]LEDG);
assign LEDR=SW;
wire [0:3]tens;
wire [0:3] ones;
wire [0:6] tensPotential;
wire [0:3] A;
wire [0:3] B;
assign A=SW[7:4];
assign B=SW[3:0];
//wire [3:0] resultflipped;
//genvar i;
//generate
//for(i=0;i<4;i++)
//begin:name
//assign resultflipped[i] = result;
//end 
//endgenerate

BCD_Add addition(A,B,SW[8],tens,ones);
HexHEXd BCD1(A,HEX6);
HexHEXd BCD2(B,HEX4);
HexHEXd onesDecode(ones,HEX0);
HexHEXd tensDecode(tens,tensPotential);
always @ (A,B)
begin
if((A>9)|(B>9))
LEDG[8]<=1;
else
LEDG[8]<=0;
end

assign CASE_VALUE=|tens;//to make it so case and always values always match, they are set here instead.

always @ (CASE_VALUE)
case (CASE_VALUE)
1:HEX1<=tensPotential;
0:HEX1<=7'b1111111;//instead of being zero, this should just be off.
default:;
endcase

endmodule
