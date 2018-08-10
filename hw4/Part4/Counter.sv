module counter (input enable, input clock, input clear, output reg [15:0] Q=0);

always_ff @(posedge clock)
begin
if(clear)
begin
 Q<=0;
end
else if(enable)
begin
Q<=Q+1;
end
else
Q<=Q;



end




endmodule 

module testCount();

reg [15:0] Q;
reg enable, clock, clear;
reg [15:0] showi;

counter test(enable, clock,clear,Q);
initial begin
clock=0;
enable = 0;
clear = 0;
#10;



enable = 1;
clear = 1;
	for(int i=0;i<16*16*16*16-1;i++)
		begin
			showi=i;
			assert(Q==i);//if Q is ever NOT equal to i then my counter doesn't work;
							
			#10;
			clock=1;
			#1;
			clock = 0;


		end
		showi=Q;
		enable =0; //test to see if the enable feature works
		#10;
			clock=1;
			#1;
			clock = 0;
assert(showi==Q); //if the enable works, then it will still be the same.
		

end

endmodule 


