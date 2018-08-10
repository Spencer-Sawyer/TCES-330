//Written by:Spencer Sawyer

module BCD_Add(input [3:0]bcd1,input [3:0]bcd2,input carry_in, output logic [3:0] tens,output logic [3:0]ones);
wire [3:0]intermediateResult;
wire carry_out;
//wire tensPotential;
//wire onesPotential;
FourBitAdder BCDAddingIsNoDifferent(bcd1,bcd2,carry_in,intermediateResult,carry_out);
HexDtoDec decodeandcheck(intermediateResult,carry_out,tens,ones);

endmodule 

module BCD_AddTest();
reg [0:3]bcd1;
reg [0:3]bcd2;
reg carry_in;
reg [0:3]tens;
reg [0:3]ones;

BCD_Add test(bcd1,bcd2,carry_in,tens,ones);
initial begin
for(int i=0;i<10;i++)
	begin
	bcd1=i;
	for(int j=0;j<10;j++)
		begin
		bcd2=j;
		for(int k=0;k<2;k++)
			begin
			carry_in=k;#10;
			end

		end
	end

end

endmodule 