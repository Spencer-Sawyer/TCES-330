
/****************************************************************************
 * LabB.sv
 ****************************************************************************/

  
/**
 * Module: LabB
 * 
 * TODO: Add module documentation
 */
module LabB(
		input CLOCK_50,
		input [2:1]KEY, 
		input [17:15] SW, 
		output [0:6] HEX0, 
		output [0:6] HEX1, 
		output [0:6] HEX2, 
		output [0:6] HEX3, 
		output [0:6] HEX4, 
		output [0:6] HEX5, 
		output [0:6] HEX6, 
		output [0:6] HEX7);
reg [3:0] H0,H1,H2,H3,H4,H5,H6,H7,state,nextState;
reg [4:0] PC_Out;
reg [15:0] IR_Out,ALU_A,ALU_B,ALU_Out;
reg newClock;
ButtonSyncReg( KEY[1],newClock , CLOCK_50 );
Processor Test(newClock, //clock
				KEY[2],   	//synchronous reset
				IR_Out,		//instruction register out
				PC_Out,		//program counter out
				state, 		//Current state
				nextState,  //Next State
				ALU_A, 		//ALU side A
				ALU_B,		//ALU side B
				ALU_Out);	//ALU output
always_comb
begin
	{H3,H2,H1,H0}=IR_Out;
	case(SW)
		default:
		begin
			{H7,H6}=PC_Out;
			{H5,H4}=state;
		end
		1:
		begin
			{H7,H6,H5,H4}=ALU_A;
		end
		2:
		begin
			{H7,H6,H5,H4}=ALU_B;
		end
		3:
		begin
			{H7,H6,H5,H4}=ALU_Out;
		end
		4:
		begin
			{H7,H6,H5,H4}=nextState;
		end
		
	endcase
	
end
 HexHEXd zero( H0,  HEX0);
 HexHEXd one( H1,  HEX1);
 HexHEXd two( H2,  HEX2);
 HexHEXd three( H3,  HEX3);
 HexHEXd four( H4,  HEX4);
 HexHEXd five( H5,  HEX5);
 HexHEXd siz( H6,  HEX6);
 HexHEXd seven( H7,  HEX7);
 

endmodule

