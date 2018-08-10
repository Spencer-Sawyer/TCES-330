module Part3(input [17:0]SW,output [17:0]LEDR,output [2:0] LEDG);
reg [0:2]S; //I'm not sure when I should be using reg vs using wire or other names.
reg [0:2]U;
reg [0:2]V;
reg [0:2]W;
reg [0:2]X;
reg [0:2]Y;

assign S= SW[17:15];
assign U= SW[14:12];
assign V= SW[11:9];
assign W= SW[8:6];
assign X= SW[5:3];
assign Y= SW[2:0];
//again assigned variables to different switches to get better readiblity.
assign LEDR=SW;
Mux_3w_5_to_1(U,V,W,X,Y,S,LEDG);

endmodule
