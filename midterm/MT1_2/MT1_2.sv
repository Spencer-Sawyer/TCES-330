//spencer sawyer
//The netlist viewer showed that the circuits were the same. I did a nor instead of a 
//xor since that is what was in the picture at the begining of problem 2 


module MT1_2(input [2:0] Y, input [1:0] S,output F);
wire a;
wire b;
wire c;
wire d;
assign d=1;
 nor(a,Y[0],Y[1]);
 and(b,Y[1],Y[2]);
 or(c,Y[0],Y[2]);
MT1MUX toF({d,c,b,a},S,F);



endmodule 

module MT1_2test();
reg [2:0] in;
reg [1:0] select;
reg out;
MT1_2 test(in,select,out);
initial begin
for(int i=0;i<4;i++)
begin
select = i;
for(int j=0;j<8;j++)
begin
in=j;
#10;
end
end

end


endmodule 