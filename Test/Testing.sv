
/****************************************************************************
 * Testing.sv
 ****************************************************************************/

  
/**
 * Module: Testing
 * 
 * TODO: Add module documentation
 */
module Testing(input x, output y);
	always_comb
	begin
		y<=x^1;
		y=x;
	end


endmodule

