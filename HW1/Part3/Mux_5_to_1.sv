module Mux_5_to_1(input U,input V,input W,input X,input Y,input [2:0]S,output M);
//input U,V,W,X,Y,[3:0]S;
//trying out a different format for declaring inputs
assign M=(~S[0] & ~S[1] & ~S[2] & U| //u when s=0
			  S[0] & ~S[1] & ~S[2] & V| //v when s=1
			 ~S[0] &  S[1] & ~S[2] & W| //w when s=2
			  S[0] &  S[1] & ~S[2] & X| //x when s=3
			 ~S[0] & ~S[1] &  S[2] & Y);//y when s=4

endmodule
module Mux_5_to_1testbench();
reg X;
reg Y;
reg U;
reg W;
reg V;
reg [2:0] S;
reg M;
Mux_5_to_1 DUT(.U(U),.V(V),.W(W),.X(X),.Y(Y),.S(S),.M(M));
initial begin
	for(int i=0;i<5;i++)begin
	S=i;
		for(int j=0;j<2;j++)begin
		X=j;
			for(int k=0;k<2;k++)begin
			Y=k;
				for(int l=0;l<2;l++)begin
				U=l;
					for(int m=0;m<2;m++)begin
					V=m;
						for(int n=0;n<2;n++)begin
						W=n;
						#10;
						end
					end
				
				end
			end
		end
	end
end
endmodule