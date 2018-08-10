module Part5(input [0:17]SW,output [0:17]LEDR,output[0:6]HEX0,
	     output[0:6]HEX1,output[0:6]HEX2,output[0:6]HEX3,
	     output[0:6]HEX4);
	wire [0:2]H; //made local variables here so I could actually read what I was doing.			
	wire [0:2]E;
	wire [0:2]L;
	wire [0:2]O;
	wire [0:2]S;
	wire [0:2]H0; //wires that will take the output from the mux's and taking it to the seven segment displays.
	wire [0:2]H1;
	wire [0:2]H2;
	wire [0:2]H3;
	wire [0:2]H4;
	assign S= SW[15:17];
	assign H= SW[12:14];
	assign E= SW[9:11];
	assign L= SW[6:8];
	assign O= SW[3:5];
	Mux_3w_5_to_1(H,E,L,L,O,S,H0); //implimenting five MUX's
	Mux_3w_5_to_1(E,L,L,O,H,S,H1);
	Mux_3w_5_to_1(L,L,O,H,E,S,H2);
	Mux_3w_5_to_1(L,O,H,E,L,S,H3);
	Mux_3w_5_to_1(O,H,E,L,L,S,H4);
	HexHELO(H0,HEX4); //Taking the output from the five MUX's and sending them to the seven segment display's
	HexHELO(H1,HEX3);
	HexHELO(H2,HEX2);
	HexHELO(H3,HEX1);
	HexHELO(H4,HEX0);
	
				 
endmodule 