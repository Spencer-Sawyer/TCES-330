module Mux_4w_2_to_1(S,X,Y,M);
input S;
input [3:0] X;
input [3:0] Y;
output[3:0] M;
wire S;
wire [3:0] X;
wire [3:0] Y;
wire [3:0] M;

//assign M=(~S & X) | (S & Y);
assign M[0]=(~S & X[0]) | (S & Y[0]);
assign M[1]=(~S & X[1]) | (S & Y[1]);
assign M[2]=(~S & X[2]) | (S & Y[2]);
assign M[3]=(~S & X[3]) | (S & Y[3]);
/*always@(S,X,Y) begin
	for(int i=0;i<4;i++)begin
		 M[i]=(~S & X[i]) | (S & Y[i]); //This kept giving illegal reference errors even though it worked on the board.
	end
end*/
endmodule
module Mux_4w_2_to_1testbench();
reg [3:0] X;
reg [3:0] Y;
reg S;
reg [3:0] M;
Mux_4w_2_to_1 DUT(.X(X),.Y(Y),.S(S),.M(M));
initial begin
	for(int i=0;i<2;i++)begin
	S=i;
		for(int j =0;j<16;j++)begin
		X=j;
			for(int k =0;k<16;k++)begin
			Y=k;
			//Mux_4w_2_to_1(S,X,Y,M);
			#10;
			end
	
	
		end
	end
end
endmodule
		
