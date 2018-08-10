module Mux_3w_5_to_1(input [2:0]U,input [2:0]V,input [2:0]W,input [2:0]X,input [2:0]Y,input [2:0]S,output [2:0]M);
//input U,V,W,X,Y,[3:0]S;
//trying out a different format for declaring inputs
/*
wire [2:0]U;
wire [2:0]V;
wire [2:0]W;
wire [2:0]X;
wire [2:0]Y;
wire [2:0]S;
wire [2:0]M;
*/

assign M[0]=(~S[0] & ~S[1] & ~S[2] & U[0]| //s=0
			     S[0] & ~S[1] & ~S[2] & V[0]| //s=1
			    ~S[0] &  S[1] & ~S[2] & W[0]| //s=2
			     S[0] &  S[1] & ~S[2] & X[0]| //s=3
			    ~S[0] & ~S[1] &  S[2] & Y[0]);//s=4
assign M[1]=(~S[0] & ~S[1] & ~S[2] & U[1]| //s=0
			     S[0] & ~S[1] & ~S[2] & V[1]| //s=1
			    ~S[0] &  S[1] & ~S[2] & W[1]| //s=2
			     S[0] &  S[1] & ~S[2] & X[1]| //s=3
			    ~S[0] & ~S[1] &  S[2] & Y[1]);//s=4
assign M[2]=(~S[0] & ~S[1] & ~S[2] & U[2]| //s=0
			     S[0] & ~S[1] & ~S[2] & V[2]| //s=1
			    ~S[0] &  S[1] & ~S[2] & W[2]| //s=2
			     S[0] &  S[1] & ~S[2] & X[2]| //s=3
			    ~S[0] & ~S[1] &  S[2] & Y[2]);//s=4
endmodule
module Mux_3w_5_to_1testbench();
reg [2:0]X;
reg [2:0]Y;
reg [2:0]U;
reg [2:0]W;
reg [2:0]V;
reg [2:0]S;
reg [2:0]M;
Mux_3w_5_to_1 DUT(.U(U),.V(V),.W(W),.X(X),.Y(Y),.S(S),.M(M));
initial begin
	for(int i=0;i<5;i++)begin
	S=i;
		for(int j=0;j<8;j++)begin
		X=j;
			for(int k=0;k<8;k++)begin
			Y=k;
				for(int l=0;l<8;l++)begin
				U=l;
					for(int m=0;m<8;m++)begin
					V=m;
						for(int n=0;n<8;n++)begin
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