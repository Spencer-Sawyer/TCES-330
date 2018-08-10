//Written by:Spencer Sawyer

module BCD_2d_ADD(input [3:0]bcdAones,input [3:0]bcdAtens,input [3:0]bcdBones,input [3:0]bcdBtens, output logic [3:0] hundreds, output logic [3:0] tens,output logic [3:0]ones);

//wire [0:3]ones;
wire [0:3]tensCarry;
//wire [0:3]tensFinal;
//wire [0:3]hundreds;

BCD_Add onescarryten(bcdAones,bcdBones,0,tensCarry,ones);
BCD_Add tenscarryhundred(bcdAtens,bcdBtens,tensCarry[3],hundreds,tens);




endmodule 
module BCD_2d_AddTest();
reg [0:3]bcd1;
reg [0:3]bcd2;
reg [0:3]bcd1tens;
reg [0:3]bcd2tens;
reg [0:3]hundreds;
reg [0:3]tens;
reg [0:3]ones;

BCD_2d_ADD test(bcd1,bcd1tens,bcd2,bcd2tens,hundreds,tens,ones);
initial begin
for(int i=0;i<10;i++)
	begin
	bcd1=i;
	for(int j=0;j<10;j++)
		begin
		bcd2=j;
		for(int k=0;k<10;k++)
			begin
			bcd1tens=k;
			for(int l=0;l<10;l++)
			begin
			bcd2tens=l;#10;
			end
			end

		end
	end

end

endmodule 

