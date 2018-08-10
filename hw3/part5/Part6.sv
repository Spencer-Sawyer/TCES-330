//Written by Spencer sawyer

module Part6(input [2:0]S,   output[0:6] HEX0,
				 output[0:6]HEX1,output[0:6] HEX2,output[0:6]HEX3,
				 output[0:6]HEX4,output[0:6] HEX5,output[0:6]HEX6,output[0:6]HEX7);
	wire [0:2]H;
	wire [0:2]E;
	wire [0:2]L;
	wire [0:2]O;
	wire [0:2]H0;
	wire [0:2]H1;
	wire [0:2]H2;
	wire [0:2]H3;
	wire [0:2]H4;
	wire [0:2]H5;
	wire [0:2]H6;
	wire [0:2]H7;
	wire [0:2]B;
	//genvar i;
	//generate for(i=2;i>=0;i--)begin:sassign assign S[i]=SW[17-i];end endgenerate
	//This was a work around while I tried to get both my program and my modelsim working the way I wanted to
	
	assign H= 0;
	assign E= 1;
	assign L= 2;
	assign O= 3;
	assign B= 4;
	Mux_3w_8_to_1 mh0(B,B,B,H,E,L,L,O,S,H0);//generating muxes for each output
	Mux_3w_8_to_1 mh1(B,B,H,E,L,L,O,B,S,H1);
	Mux_3w_8_to_1 mh2(B,H,E,L,L,O,B,B,S,H2);
	Mux_3w_8_to_1 mh3(H,E,L,L,O,B,B,B,S,H3);
	Mux_3w_8_to_1 mh4(E,L,L,O,B,B,B,H,S,H4);
	Mux_3w_8_to_1 mh5(L,L,O,B,B,B,H,E,S,H5);
	Mux_3w_8_to_1 mh6(L,O,B,B,B,H,E,L,S,H6);
	Mux_3w_8_to_1 mh7(O,B,B,B,H,E,L,L,S,H7);
	
	HexHELO h0(H0,HEX7); //generating a decoder for each output
	HexHELO h1(H1,HEX6);
	HexHELO h2(H2,HEX5);
	HexHELO h3(H3,HEX4);
	HexHELO h4(H4,HEX3);
	HexHELO h5(H5,HEX2);
	HexHELO h6(H6,HEX1);
	HexHELO h7(H7,HEX0);
				 
endmodule 