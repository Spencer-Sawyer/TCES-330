//Part 4 written by Spencer Sawyer

module Part4(input [0:17]SW,output [0:17]LEDR,output [0:6] HEX0);

assign LEDR=SW;
wire [2:0] x;
//assign x[0]=SW[15];
//assign x[1]=SW[16];
//assign x[2]=SW[17];
//testing stuff I learned about system verilog.

genvar i;
generate
for(i=0;i<3;i++)
begin :name
assign x[i]=SW[i+15];
end
//assigns x to be SW
endgenerate
HexHELO(x,HEX0); //Assigns sw15-17 to be the control switches for seven segment display 0




endmodule

