//Written by:Spencer Sawyer

module FourBitAdder(input [3:0] a,input [3:0] b,input carry_in,output [3:0]result,output carry_out);

wire [0:4] carries;
assign carries[0]=carry_in;
assign carry_out=carries[4];

genvar i;
generate
for(i=0;i<4;i++)
begin:adders
FullAdder name(a[i],b[i],carries[i],result[i],carries[i+1]);
end



endgenerate



endmodule

module FourBitAdder_testbench();
reg [0:3]a;
reg [0:3]b;
reg carry_in;
reg [0:3]result;
reg carry_out;

FourBitAdder test(a,b,carry_in,result,carry_out);
initial begin
for(int i=0;i<16;i++)
	begin
	a=i;
	for(int j=0;j<16;j++)
		begin
		b=j;
		for(int k=0;k<2;k++)
			begin
			carry_in=k;#10;
			end

		end
	end

end

endmodule
