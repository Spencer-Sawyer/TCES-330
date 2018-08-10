//Written by:Spencer Sawyer

module HexDtoDec(input [3:0]in,output logic [3:0] tens,output logic [3:0] ones);
assign tens[3:1]=0;
assign tens[0]=in[3]&(in[1]|in[2]);


always @ (in)
begin
if(in<10)
ones<=in;
else 
ones<=in-10;
end




endmodule 
module testHexDtoDec();
reg [3:0]in;
reg [3:0]tens;
reg [3:0]ones;

HexDtoDec test(in,tens,ones);
initial 
begin
for(int i=0; i<16;i++)
begin
in=i;
#10;
end


end

endmodule 