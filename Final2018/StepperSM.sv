
/****************************************************************************
 * StepperSM.sv
 ****************************************************************************/

  
/**
 * Module: StepperSM
 * 
 * TODO: Add module documentation
 */
module StepperSM(input clock,input step,input dir,input reset,output reg [3:0] drive);
	reg [3:0] CurrentState=0;
	reg [3:0] NextState;
	//assign drive=CurrentState;
	localparam	A=4'b0001,
				B=4'b0101,
				C=4'b0100,
				D=4'b1100,
				E=4'b1000,
				F=4'b1010,
				G=4'b0010,
				H=4'b0011;
	always_comb
	begin
		case(CurrentState)
			A:
			begin
				drive=A;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=A;
				end
				else if(dir)
				begin
					NextState=B;
				end
				else
				begin
					NextState=H;
				end
			end
			B:
			begin
				drive=B;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=B;
				end
				else if(dir)
				begin
					NextState=C;
				end
				else
				begin
					NextState=A;
				end
			end
			C:
			begin
				drive=C;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=C;
				end
				else if(dir)
				begin
					NextState=D;
				end
				else
				begin
					NextState=B;
				end
			end
			D:
			begin
				drive=D;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=D;
				end
				else if(dir)
				begin
					NextState=E;
				end
				else
				begin
					NextState=C;
				end
			end
			E:
			begin
				drive=E;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=E;
				end
				else if(dir)
				begin
					NextState=F;
				end
				else
				begin
					NextState=D;
				end
			end
			F:
			begin
				drive=F;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=F;
				end
				else if(dir)
				begin
					NextState=G;
				end
				else
				begin
					NextState=E;
				end
			end
			G:
			begin
				drive=G;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=G;
				end
				else if(dir)
				begin
					NextState=H;
				end
				else
				begin
					NextState=F;
				end
			end
			H:
			begin
				drive=H;
				if(reset)
				begin
					NextState=A;
				end
				else if(~step)
				begin
					NextState=H;
				end
				else if(dir)
				begin
					NextState=A;
				end
				else
				begin
					NextState=G;
				end
			end
			default:
			begin
				drive=0;
				NextState=A;
			end
				
			
			
		endcase
		
	end
	always_ff @ (posedge clock)
	begin
		CurrentState<=NextState;
	end


endmodule
module StepperSM_testbench();
	reg clock;
	reg step;
	reg dir;
	reg reset;
	reg [3:0] drive;
	
	
	StepperSM test( clock, step, dir, reset, drive);
	always
	begin
		clock=0;#5;
		clock=1;#5;
	end
	initial begin
		reset = 0;
		dir=1;
		step = 1;
		#100;
		step=0;
		#20;
		step=1;
		dir=0;
		#100;
		reset = 1;
		#100;
		$stop;
	end
	
endmodule

