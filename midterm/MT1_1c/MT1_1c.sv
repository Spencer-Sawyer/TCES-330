//spencer sawyer
/*To me the best way to write This module is similar to this. As it gives a way to show what each case
 *Is suppose to do right in the code.
 *
 *
 */
module MT1_1c(input [0:2] b,output[0:2] g);
reg [0:2]toG;
assign g[0]=toG[2];//numbers were backwards on model sim.
assign g[1]=toG[1];//numbers were backwards on model sim.
assign g[2]=toG[0];//numbers were backwards on model sim.
always@(b)
begin
case(b)
0:toG<=0;
1:toG<=1;
2:toG<=3;
3:toG<=2;
4:toG<=6;
5:toG<=7;
6:toG<=5;
7:toG<=4;
endcase


end

endmodule

module MT1_1cTestBench();
reg [0:2] in;

reg [0:2] out;

MT1_1c test(in,out);

initial
begin
for(int i =0;i<8;i++)
begin
in=i;
#10;
end

end


endmodule 