//Written by:Spencer Sawyer

module BCD_Add2(input [3:0]bcdAones,input [3:0]bcdAtens,
					input [3:0]bcdBones,input [3:0]bcdBtens, 
					output logic [3:0] hundreds, output logic [3:0] tens,output logic [3:0]ones);

logic[4:0] T0;
logic[3:0] Z0;
logic[3:0] C1;
logic[4:0] T1;
logic[3:0] Z1;
logic[3:0] C2;
always @ *
begin
T0<=bcdAones+bcdBones;
	if(T0>9)
	begin
		Z0<=10;
		C1<=1;

	end
	else
	begin
	   Z0<=0;
		C1<=0;
	end
ones<=T0-Z0;

end	
always @ *
begin
T1<=bcdAtens+bcdBtens+C1;
	if(T1>9)
	begin
		Z1<=10;
		C2<=1;

	end
	else
	begin
	   Z1<=0;
		C2<=0;
	end
tens<=T1-Z1;
hundreds<=C2;
end	
						



						
endmodule 


module BCD_Add2Test();
reg [0:3]bcd1;
reg [0:3]bcd2;
reg [0:3]bcd1tens;
reg [0:3]bcd2tens;
reg [0:3]hundreds;
reg [0:3]tens;
reg [0:3]ones;

BCD_Add2 test(bcd1,bcd1tens,bcd2,bcd2tens,hundreds,tens,ones);
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