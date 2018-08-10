
/****************************************************************************
 * TXDriver.sv
 ****************************************************************************/

  
/**
 * Module: TXDriver
 * 
 * TODO: Add module documentation
 */
module TXDriver(input clock, input reset,input reg  TxEmpty,output reg XMitGo=1,output reg [7:0] TxData );
	reg waitDone; //wait for a second before transmitting again.
	reg [0:4] dataPointer = 0; //local register that will set 
	reg done; //if we've reached the end we need to signal our one second timeout to start counting.
	reg updateNextClock=0; //This is true when TxEmpty was true on the previous clock cycle. 
						//This allows us to update the data gracefully 

		
	localparam dataEnd			=12; //define dataEnd to make this code more reusable if need be.
	
	localparam [7:0] 	H		=72, //define HELOWRD! \n as local Parameters 
						E		=69,
						L		=76,
						O		=79,
						
						W		=87,
						R		=82,
						D		=68,
						
						point	=33,
						space	=32,
						newline =10;
	
	reg [0:dataEnd][7:0] data; //define the dataset to send to the UART
	
	assign data[0]	 =	 H;
	assign data[1]	 =	 E;
	assign data[2]	 =	 L;
	assign data[3]	 =	 L;
	assign data[4]	 =	 O;
	assign data[5]	 =	 space;
	assign data[6]	 =	 W;
	assign data[7]	 =	 O;
	assign data[8]	 =	 R;
	assign data[9]	 =	 L;
	assign data[10]	 =	 D;
	assign data[11]	 =	 point;
	assign data[12]	 =	 newline;


enableEverySec enab(reset,clock,done,waitDone); //when the message is done, wait a second and enable again, 

always_comb
begin
	TxData=data[dataPointer]; 			//The data sent to the UART should always be where the current data pointer is 
	if(dataPointer == dataEnd)			//if the pointer is at the end of the array, we are done transmitting data.
	begin
	done = 1;							//set done to 1
	end
	else
	begin
	done = 0;							//hold done at 0 if we aren't at the end of the array.
	end
end

always_ff @(posedge clock) 
begin
	if(reset|waitDone) //if we have reset, we should set the data pointer to zero and signal that there is data to pull here. we should also make sure that we update next clock.
	begin
		dataPointer     <=0;
		XMitGo			<=1;
		updateNextClock <=0;
	end
		else if(TxEmpty) //if it's empty, we will update the dataPointer next clock cycle since we don't want to update it before it's had a chance to grab the data.
		begin			//in addition, if TxEmpty is on for multiple clocks cycles in a row, it will wait until it goes low before trying to update.
			updateNextClock <=1;
					
		end
		
			else if(updateNextClock) //we only run update if we are not currently in reset and the UART has it's data. 
			begin
				updateNextClock <=0; //set update to zero
				if(done) //if we are in the finished state
				begin
					dataPointer <=dataPointer; //keep the datapointer the same
					XMitGo      <=0; //set transmit ready to false since we are done
					
				end
					else if(XMitGo)
					begin
						dataPointer <=dataPointer+1; //set the data to be the next pointer
						XMitGo      <=1;//Ensure the "transmit ready" is true since there is data here.
					end
						else
						begin
							updateNextClock 	<=1;
							dataPointer 		<=dataPointer;
						end
			end
				else
				begin
					updateNextClock 	<=updateNextClock;
					dataPointer		<=dataPointer;
					XMitGo 			<=XMitGo;
				end
			
	
		
		
	
end
//UART send(clock,reset,TxData,XMitGo,TxEmpty) Going to send TxData, XMitGo as outputs instead and have TxEmpty as an input.



endmodule
module testbench();
	reg clock,reset,TxEmpty,XMitGo;
	reg [7:0] TxData;
	
	TXDriver test(clock, reset, TxEmpty, XMitGo, TxData );

	initial 
	begin
		clock   = 0;
		reset   = 0;
		TxEmpty = 0;
		#10;
		for(int i = 0 ; i<10;i++)
		begin
		clock	= 1;
		#10;
		clock   = 0;
		#10;
		end
		for(int j=0;j<15;j++)
		begin
			TxEmpty = 1;
			//for(int i = 0 ; i<10;i++)
			
			clock	= 1;
			#10;
			clock   = 0;
			#10;
		
			TxEmpty = 0;
			for(int i = 0 ; i<10;i++)
			begin
				clock	= 1;
				#10;
				clock   = 0;
				#10;
			end
		end
		reset = 1;
		begin
			clock	= 1;
			#10;
			clock   = 0;
			#10;
		end
		reset = 0; //since reset is always or'd with waitDone, and we know that wait done WILL be on for one clock cycle after waiting 50 million clocks,
					// we can simulate it with reset. 
		for(int j=0;j<15;j++)
		begin
			TxEmpty = 1;
			//for(int i = 0 ; i<10;i++)
			
			clock	= 1;
			#10;
			clock   = 0;
			#10;
		
			TxEmpty = 0;
			for(int i = 0 ; i<10;i++)
			begin
				clock	= 1;
				#10;
				clock   = 0;
				#10;
			end
		end
		
	end
endmodule


