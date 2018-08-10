//Written by:Spencer Sawyer

module Part5(input [17:0] SW, output [0:6]HEX0,
				output [0:6]HEX1,output [0:6]HEX2,output [0:6]HEX7,
				output [0:6]HEX4,output [0:6]HEX5,output [0:6]HEX6,
				output [17:0]LEDR,output [8:8]LEDG);
assign LEDR=SW;
wire [0:3] Atens;
wire [0:3] Aones;
wire [0:3] Btens;
wire [0:3] Bones;
assign Atens= SW[15:12];
assign Aones= SW[11:8];
assign Btens= SW[7:4];
assign Bones= SW[3:0];
HexHEXd atensdecode(Atens,HEX7);
HexHEXd aonesdecode(Aones,HEX6);
HexHEXd btensdecode(Btens,HEX5);
HexHEXd bonesdecode(Bones,HEX4);
wire [0:3]hundreds;
wire [0:3]tens;
wire [0:3]ones;



BCD_2d_ADD(Aones,Atens,Bones,Btens, hundreds, tens,ones);

HexHEXd onesdecode(ones,HEX0);
HexHEXd tensdecode(tens,HEX1);
HexHEXd hundredsdecode(hundreds,HEX2);



endmodule 