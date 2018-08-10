//Written by:Spencer Sawyer

module HexDtoDec(input [3:0]in,output [3:0] tens,output [3:0] ones);
assign tens[0]=in[3]&(in[1]|in[2]);

always @ (in)
begin
if(in<10)
ones<=in;
else 
ones<=in-4'b1010;
end




endmodule 