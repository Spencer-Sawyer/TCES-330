
/****************************************************************************
 * FSMPart2.sv
 ****************************************************************************/

  
/**
 * Module: FSMPart2
 * 
 * TODO: Add module documentation
 */
module FSMPart2(input clock, input enable, input [1:0] w,input s_reset,output reg [3:0] BCD);
	reg [3:0] CurrentState, NextState;
	initial
	begin
		CurrentState = 0;
	end
	
	localparam
			one=1,
			two=2,
			three=3,
			four=4,
			five=5,
			six=6,
			seven=7,
			eight=8,
			nine=9;
	always_comb
	begin
		case(CurrentState)
			default:
			begin
				BCD=0;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=one;
				end
				else if(w==2)
				begin
					NextState=two;
				end
				else
				begin
					NextState=nine;
				end
			end
			one:
			begin
				BCD=1;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=two;
				end
				else if(w==2)
				begin
					NextState=three;
				end
				else
				begin
					NextState=0;
				end
			end
			two:
			begin
				BCD=2;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=three;
				end
				else if(w==2)
				begin
					NextState=four;
				end
				else
				begin
					NextState=one;
				end
			end
			three:
			begin
				BCD=3;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=four;
				end
				else if(w==2)
				begin
					NextState=five;
				end
				else
				begin
					NextState=two;
				end
			end
			four:
			begin
				BCD=4;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=five;
				end
				else if(w==2)
				begin
					NextState=six;
				end
				else
				begin
					NextState=three;
				end
			end
			five:
			begin
				BCD=5;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=six;
				end
				else if(w==2)
				begin
					NextState=seven;
				end
				else
				begin
					NextState=four;
				end
			end
			six:
			begin
				BCD=6;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=seven;
				end
				else if(w==2)
				begin
					NextState=eight;
				end
				else
				begin
					NextState=five;
				end
			end
			seven:
			begin
				BCD=7;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=eight;
				end
				else if(w==2)
				begin
					NextState=nine;
				end
				else
				begin
					NextState=six;
				end
			end
			eight:
			begin
				BCD=8;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=nine;
				end
				else if(w==2)
				begin
					NextState=0;
				end
				else
				begin
					NextState=seven;
				end
			end
			nine:
			begin
				BCD=9;
				if(w==0)
				begin
					NextState=CurrentState;
				end
				else if(w==1)
				begin
					NextState=0;
				end
				else if(w==2)
				begin
					NextState=one;
				end
				else
				begin
					NextState=eight;
				end
			end
			
		endcase
		
		
	end
	always_ff @ (posedge clock)
	begin
		if(!s_reset)
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
		else
		begin
			CurrentState <=0;
		end
		
	end
	


endmodule


