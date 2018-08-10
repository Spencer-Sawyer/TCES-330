
/****************************************************************************
 * baudlimit.sv
 ****************************************************************************/

  
/**
 * Module: baudlimit, this will count out clock cycles to limit the baud.
 * this module is based on enableEverySec and I am assuming that the small changes needed to change it from
 * every second to every 1/38400 of a second wont significantly change it.
 * 
 * TODO: Add module documentation
 */
module baudlimit(input clr,input CLOCK,input enable,output reg enable2clr1);

	
	
	reg [15:0] ThenCountTo1k;
		
		
	
	always_comb
	begin
		if(ThenCountTo1k==1303)
			enable2clr1=1;
		else
			enable2clr1=0;
	end
	counter CountTo1k(  enable,  CLOCK, enable2clr1|clr, ThenCountTo1k  );//divide enable by  1303
	


endmodule

