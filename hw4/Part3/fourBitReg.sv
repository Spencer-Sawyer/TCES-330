
/****************************************************************************
 * fourBitReg.sv
 ****************************************************************************/

  
/**
 * Module: fourBitReg
 * 
 * TODO: Add module documentation
 */
module fourBitReg(input clock,input enable,input [3:0] nextState,output reg [3:0] CurrentState);
	initial
	begin
		CurrentState = 4;
	end
	
always_ff @(posedge clock)
begin
	if(enable)
	begin
	CurrentState<=nextState;
	end
	else
	begin 
	CurrentState=CurrentState;
	end
	
	
end

endmodule


