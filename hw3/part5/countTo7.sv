module countTo7Sec(input clr,input CLOCK,input enable,output reg [15:0]  ThenTo7);

	   reg [15:0] FirstCountTo50k;
		reg [15:0] ThenCountTo1k;
		
		
		reg enable1clr0;
		reg enable2clr1;
		reg clr3;
		
		always@(FirstCountTo50k)
		begin
		if(FirstCountTo50k==49999)
		enable1clr0=1;
		else
		enable1clr0=0;
		end
		always@(ThenCountTo1k)
		begin
		if(ThenCountTo1k==1000)
		enable2clr1=1;
		else
		enable2clr1=0;
		end
		always@(ThenTo7)begin
		if(ThenTo7==8)
		clr3=1;
		else
		clr3=0;
		
		end
		
		//counter b16(~SW[1], CLOCK_50, SW[0],ThenTo9);
		
		  counter CountTo50k(      enable,  CLOCK, enable1clr0|clr, FirstCountTo50k);//divide enable by 50k
		  counter CountTo1k(  enable1clr0,  CLOCK, enable2clr1|clr, ThenCountTo1k  );//divide enable by another 1k
		  counter CountTo9(   enable2clr1,  CLOCK, clr3|clr,        ThenTo7        );//count to 7


endmodule 
`timescale 1ns/1ns
module to7Test();

reg clr,clock,enable;
reg [15:0] out;
reg one,two,three,four,five,six,seven;
countTo7Sec test(clr,clock,enable,out);
initial 
begin
clr   =0;
clock =0;
enable=1;
one=0;
two=0;
three=0;
four=0;
five=0;
six=0;
seven=0;
	for( int i=0; i<50000*1000-1000;i++)
		begin
		assert(out==0);
			
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end		
		
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to 1 second for me
				begin
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
	
				
			
		
			
			
		
		for( int i=0; i<50000*1000-1000*2;i++)
		begin
		
			assert(out==1);
				
				#10;
				clock=1;
				#10;
				clock=0;
		
		end
		
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to a second for me
				begin
				if(out==2)
				two=1;
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
				
				assert(two==1);
			
			
		
		for( int i=0; i<50*1000*1000-1000*2;i++)
		begin
		
			assert(out==2);
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end
		
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to a second for me
				begin
				if(out==3)
				three=1;
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
			
			assert(three==1);
		
			
		
		
		for( int i=0; i<50*1000*1000-1000*2;i++)
		begin
		
			assert(out==3);
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end
		
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to a second for me
				begin
				if(out==4)
				four=1;
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
			assert(four==1);
		
		
		for( int i=0; i<50*1000*1000-1000*2;i++)
		begin
		
			assert(out==4);
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end
		
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to a second for me
				begin
				if(out==5)
				five=1;
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
			
			assert(five==1);
		
		
		for( int i=0; i<50*1000*1000-1000*2;i++)
		begin
		
			assert(out==5);
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end
		
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to a second for me
				begin
				if(out==6)
				six=1;
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
			
			assert(six==1);
		for( int i=0; i<50*1000*1000-1000*2;i++)
		begin
		
			assert(out==6);
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end
		
		
		
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to a second for me
				begin
				if(out==7)
				seven=1;
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
			
			assert(seven==1);
		
		
		for( int i=0; i<50*1000*1000-1000*2;i++)
		begin
		
			assert(out==7);
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end
		one=0;
			for(int j=0;j<2000;j++) //if I get within 1000 clock cycles 
			//of 50,000,000 that will be close enough to a second for me
				begin
				if(out==0)
				one=1;
				#10;
				clock=1;
				#10;
				clock=0;
			
				end
			
			assert(one==1);
		
		
				for( int i=0; i<50*1000*1000-1000*2;i++)
		begin
		
			assert(out==0);
				
				#10;
				clock=1;
				#10;
				clock=0;
				
		

		
		end
		
		
		
	/**/	//writting tests for long things suck..
		
		
		


end



endmodule 