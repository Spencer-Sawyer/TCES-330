module counter (input enable, input clock, input clear, output reg [15:0] Q=0);
reg [15:0] AND;
		assign AND[0]=enable;
		genvar i;
		generate
		for(i=1;i<16;i++) begin:andGen
		assign AND[i]=AND[i-1]&Q[i-1];
		end	
		for(i=0;i<16;i++) begin:tfgen
		TeeFF		tf_iplus1(Q[i],AND[i],clock,clear);
		end
		endgenerate




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


