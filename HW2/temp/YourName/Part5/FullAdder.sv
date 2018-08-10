//Written by:Spencer Sawyer

module FullAdder(input a, input b, input carry_in,output result, output carry_out);

assign result = carry_in^(a^b);
assign carry_out=a&b|b&carry_in|carry_in&a;



endmodule
module FullAdder_testbench();
reg a;
reg b;
reg carry_in;
reg result;
reg carry_out;

FullAdder test(a,b,carry_in,result,carry_out);
initial begin
a=0;
b=0;
carry_in=0;
#10;
a=1;#10;
b=1;#10;
a=0;#10;
carry_in=1;#10;
a=1;#10;
b=0;#10;
a=0;#10;


end






endmodule
