//WRitten by spencer sawyer 3 wire 8 to 1 mux

module Mux_3w_8_to_1(input [2:0]U,input [2:0]V,input [2:0]W,
		     input [2:0]X,input [2:0]Y,input [2:0]Z,
		     input [2:0]R,input [2:0]T,input [0:2]S,output [2:0]M);
//input U,V,W,X,Y,[3:0]S;
//trying out different formats for declaring inputs
/*
wire [2:0]U;
wire [2:0]V;
wire [2:0]W;
wire [2:0]X;
wire [2:0]Y;
wire [2:0]S;
wire [2:0]M;
*/
// generating the 3wire 8:1 MUX
genvar i;
generate
for(i=0;i<3;i++)
begin :name
assign M[i]=(~S[0] & ~S[1] & ~S[2] & U[i]| //s=0
	      S[0] & ~S[1] & ~S[2] & V[i]| //s=1
	     ~S[0] &  S[1] & ~S[2] & W[i]| //s=2
	      S[0] &  S[1] & ~S[2] & X[i]| //s=3
	     ~S[0] & ~S[1] &  S[2] & Y[i]| //s=4
	      S[0] & ~S[1] &  S[2] & Z[i]| //s=5
	     ~S[0] &  S[1] &  S[2] & R[i]| //s=6
	      S[0] &  S[1] &  S[2] & T[i]);//s=7
end				 
endgenerate				 
				 
/*				 
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
*/
endmodule
module Mux_3w_8_to_1testbench();
reg [2:0]X;
reg [2:0]Y;
reg [2:0]U;
reg [2:0]W;
reg [2:0]V;
reg [2:0]Z;
reg [2:0]R;
reg [2:0]T;
reg [2:0]S;
reg [2:0]test;

reg [2:0]M;
assign S[0]=test[2];
assign S[1]=test[1];
assign S[2]=test[0];
//this kept being weird no matter how I passed it so I gave up and made a second variable for S;
Mux_3w_8_to_1 DUT(.U(U),.V(V),.W(W),.X(X),.Y(Y),.S(S),.M(M),.R(R),.T(T),.Z(Z));
initial begin
	U=0;
	V=0;
	W=0;
	X=0;
	Y=0;
	Z=0;
	R=0;
	T=0;
	//a much better way of testing MUXs this way if the output is changing while the input is changing
	//it's clear without checking the exact waveforms. 
	
	for(int i=0;i<8;i++)begin
	test=i;
		for(int k=0;k<8;k++)begin
		U=k;
		#10;
		end
		for(int k=0;k<8;k++)begin
		V=k;
		#10;
		end
		for(int k=0;k<8;k++)begin
		W=k;
		#10;
		end
		for(int k=0;k<8;k++)begin
		X=k;
		#10;
		end
		for(int k=0;k<8;k++)begin
		Y=k;
		#10;
		end
		for(int k=0;k<8;k++)begin
		Z=k;
		#10;
		end
		for(int k=0;k<8;k++)begin
		R=k;
		#10;
		end
		for(int k=0;k<8;k++)begin
		T=k;
		#10;
		end
		
	
end
end
endmodule 