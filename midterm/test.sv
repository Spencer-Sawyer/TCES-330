`timescale 1 ns/ 1 ps
module timescale_check();
reg[31:0] rval;
initial begin
rval=20;
#10.566601
rval = 10;
#100;
end 
endmodule 