/*spencer sawyer
Fmax:386.55 MHz logic element are only 44 now.
*/
module Part5(input [17:0] SW, output [17:0] LEDR,
             input CLOCK_50,output[0:6]HEX0,
				 output[0:6]HEX1,output[0:6]HEX2,output[0:6]HEX3,
				 output[0:6]HEX4,output[0:6]HEX5,output[0:6]HEX6,output[0:6]HEX7);
		assign LEDR=SW;

		reg [15:0]  ThenTo7;
		countTo7Sec(SW[1],CLOCK_50, SW [0], ThenTo7);
		


Part6 toHello(ThenTo7, HEX0,
				  HEX1, HEX2, HEX3,
				  HEX4, HEX5, HEX6, HEX7);
		
		
		
																  
																  
																  
																  
 

endmodule
