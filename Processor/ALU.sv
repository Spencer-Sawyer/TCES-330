
/****************************************************************************
 * ALU.sv
 ****************************************************************************/

  
/**
 * Module: ALU
 * 
 * TODO: Add module documentation
 */
module ALU(input [2:0] select,input [15:0] A, input [15:0] B, output reg [15:0] S);
	
	always_comb
	begin
		case(select)
			3'b000: 
			begin
				S=A+B;
			end
			3'b001: 
			begin
				S=A-B;
			end
			3'b010: 
			begin
				S=A+1'b1;
			end
			3'b011: 
			begin
				S=A;
			end
			3'b100: 
			begin
				S=A&B;
			end
			3'b101: 
			begin
				S=A|B;
			end
			3'b110: 
			begin
				S=A^B;
			end
			3'b111: 
			begin
				S=~A;
			end
			
			
			
		endcase
		
		
		
	end


endmodule


