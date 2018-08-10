/*spencer sawyer
Fmax:386.55 MHz logic element are only 44 now.
*/
module Part4(input [17:0] SW, output [17:0] LEDR, output [0:6]HEX0,
             input CLOCK_50);
		
		reg [15:0] FirstCountTo50k;
		reg [15:0] ThenCountTo1k;
		reg [15:0]  ThenTo9;
		
		reg enable1clr0;
		reg enable2clr1;
		reg clr3;
		always@(FirstCountTo50k)
		begin
		if(FirstCountTo50k==50000)
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
		always@(ThenTo9)begin
		if(ThenTo9==10)
		clr3=1;
		else
		clr3=0;
		
		end
		assign LEDR=SW;
		//counter b16(~SW[1], CLOCK_50, SW[0],ThenTo9);
		
		  counter CountTo50k(     SW[0],  CLOCK_50, enable1clr0|SW[1], FirstCountTo50k);
		  counter CountTo1k(enable1clr0,  CLOCK_50, enable2clr1|SW[1], ThenCountTo1k);
		  counter CountTo9( enable2clr1,  CLOCK_50, clr3|SW[1],        ThenTo9);


		
		HexHEXd         H0( ThenTo9,    HEX0);
		
																  
																  
																  
																  
 

endmodule
