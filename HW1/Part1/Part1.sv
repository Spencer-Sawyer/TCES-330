//module that connects switches and lights
//Created by Spencer sawyer
module Part1 (SW, LEDR);
input[17:0] SW;
output [17:0] LEDR;
assign LEDR=SW;
endmodule