
/****************************************************************************
 * FSMPart3.sv
 ****************************************************************************/

  
/**
 * Module: FSMPart3
 * 
 * TODO: Add module documentation
 */
module FSMPart3(input clock, input enable, input [7:0][3:0] heloIn,input s_reset,output reg [7:0][3:0] hex);
	
	reg [4:0] NextState,CurrentState;
	reg [3:0]zeroIn;
	initial begin
		NextState    = 0;
		CurrentState = 0;
		end
		
	localparam
		loadZero =1,
		loadOne  =2,
		loadTwo  =3,
		loadThree=4,
		loadFour =5,
		loadFive =6,
		loadSix  =7,
		loadSeven=8,
		Loop=9,
		reset=0;

		
		
		always_comb
		begin
			case (CurrentState)
				loadZero:
				begin
					NextState = loadOne;
					zeroIn = heloIn[0];
				end
				loadOne:
				begin
					NextState = loadTwo;
					zeroIn = heloIn[1];
				end
				loadTwo:
				begin
					NextState = loadThree;
					zeroIn = heloIn[2];
				end
				loadThree:
				begin
					NextState = loadFour;
					zeroIn = heloIn[3];
				end
				loadFour:
				begin
					NextState = loadFive;
					zeroIn = heloIn[4];
				end
				loadFive:
				begin
					NextState = loadSix;
					zeroIn = heloIn[5];
				end
				loadSix:
				begin
					NextState = loadSeven;
					zeroIn = heloIn[6];
				end
				loadSeven:
				begin
					NextState = Loop;
					zeroIn = heloIn[7];
				end
				
				Loop:
				begin
					NextState = Loop;
					zeroIn = hex[7];
				end
				reset:
				begin
				NextState = loadZero;
				zeroIn=4;
				end
				
			endcase

		
			
		end
		
	fourBitReg zero   (clock,enable,zeroIn,hex[0],s_reset);
	fourBitReg one    (clock,enable,hex[0],hex[1],s_reset);
	fourBitReg two    (clock,enable,hex[1],hex[2],s_reset);
	fourBitReg three  (clock,enable,hex[2],hex[3],s_reset);
	fourBitReg four   (clock,enable,hex[3],hex[4],s_reset);
	fourBitReg five   (clock,enable,hex[4],hex[5],s_reset);
	fourBitReg six    (clock,enable,hex[5],hex[6],s_reset);
	fourBitReg seven  (clock,enable,hex[6],hex[7],s_reset);
	
	always_ff @ (posedge clock)
	begin
		if(!s_reset)
		begin
			if(enable)
			begin
				CurrentState<=   NextState;
			
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


