//Written by:Spencer Sawyer

module HexDtoDec(input [3:0]in,input carry_in,output logic [3:0] tens,output logic [3:0] ones);
wire [4:0]togetherNow;
assign togetherNow[4]=carry_in;
assign togetherNow[3:0]=in;


always @ (togetherNow)
begin
if(togetherNow>19)
begin
tens<=1; //maxvalue of BCD_add
ones<=9;
end
else if(togetherNow<10)
begin
ones<=togetherNow;
tens<=0;
end
else 
begin
ones<=togetherNow-10;
tens<=1;
end
end




endmodule 