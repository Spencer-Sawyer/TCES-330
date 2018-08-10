
/****************************************************************************
 * StepperMoter.sv
 ****************************************************************************/

  
/**
 * Module: StepperMoter
 * 
 * TODO: Add module documentation
 * if I was not to add the syncClock, the step would continue on for far more than one clock cycle unless 
 * I managed to somehow hit it for only 20 or so nano seconds
 */
module StepperMoter(input CLOCK_50,input [0:0]KEY,input [17:0]SW,output [8:0]LEDG,output [17:0]LEDR);
assign LEDR=SW;
reg dirivedClock;
ButtonSyncReg syncClock(KEY,dirivedClock,CLOCK_50);
StepperSM testOnBoard(CLOCK_50,dirivedClock,SW[0],SW[1],LEDG[3:0]);


endmodule

