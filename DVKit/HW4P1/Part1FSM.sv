
/****************************************************************************
 * Part1FSM.sv
 * Spencer Sawyer 
 ****************************************************************************/

  
/**
 * Module: Part1FSM
 * 
 * TODO: Add module documentation
 */
module Part1FSM(input enable, input clock, input w, output reg z,input reset);
	
	reg [3:0] CurrentState, NextState;
	localparam A=0,
		B=1,
		C=2,
		D=3,
		E=4,
		F=5,
		G=6,
		H=7,
		I=8;
	always_comb
	begin
		if(!reset)
		case (CurrentState)
			A:
				begin 
					z=0;
					if(w) NextState = B;
					else  NextState = F; 
				end
			B:
				begin
					z=0;
					if(w) NextState = C;
					else  NextState = F; 
				end
			C:
			begin
				z=0;
				if(w) NextState = D;
				else  NextState = F; 
			end
			D:
			begin
				z=0;
				if(w) NextState = E;
				else  NextState = F; 
			end
			E:
			begin
				z=1;
				if(w) NextState = E;
				else  NextState = F; 
			end
			F:
			begin
				z=0;
				if(w) NextState = B;
				else  NextState = G; 
			end
			G:
			begin
				z=0;
				if(w) NextState = B;
				else  NextState = H; 
			end
			H:
			begin
				z=0;
				if(w) NextState = B;
				else  NextState = I; 
			end
			I:
			begin
				z=1;
				if(w) NextState = B;
				else  NextState = I; 
			end
			default:
				begin
					z=0;
					NextState = A;
				end
		endcase
		else
			NextState=A;
	end
	always_ff @ (posedge clock)
	begin
		if(enable)
		begin
			CurrentState<=NextState;
			
		end
		else
		begin
			CurrentState<=CurrentState;
		end
		
		
	end


endmodule
module testbench;

	reg enable, clock, w, z;
	assign enable=1;
	
	Part1FSM testing(enable,clock,w,z,0);
	
	initial 
	begin
		
		for(int i=0;i<2;i++)
		begin
		w=0;
		clock=0;
		#10;
		clock=1;
		#10;
		end
		
			
			clock=0;
			#10;
			clock=1;
			#1;
			w=1;
			#9;
			clock=0;
			#10;
			clock=1;
			#1;
			w=0;
			#9;
		for(int i=0;i<4;i++)
		begin
			
			clock=0;
			#10;
			clock=1;
			#10;
		end
		for(int i=0;i<5;i++)
		begin
			w=1;
			clock=0;
			#10;
			clock=1;
			#10;
		end
		for(int i=0;i<2;i++)
		begin
			w=0;
			clock=0;
			#10;
			clock=1;
			#10;
		end
		
	end
		
	
endmodule


