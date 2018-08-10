//Written by:Spencer Sawyer

module BCD_Add(input [3:0]bcd1,input [3:0]bcd2,input carry_in, output [3:0] tens,output [3:0]ones);
wire [3:0]intermediateResult;
wire carry_out;
//wire tensPotential;
//wire onesPotential;
FourBitAdder BCDAddingIsNoDifferent(bcd1,bcd2,carry_in,intermediateResult,carry_out);
HexDtoDec decodeandcheck(intermediateResult,carry_out,tens,ones);

endmodule 