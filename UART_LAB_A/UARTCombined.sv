module UARTCombined(input CLOCK_50,input KEY[0:0],output GPIO[1:1],output LEDG[0:0]);
assign LEDG=KEY;
reg baudenable;
reg  TxEmpty;
reg XMitGo;
reg [7:0] TxData;
reg dump;

baudlimit limiter( ~KEY[0] , CLOCK_50,1,baudenable);
TXDriver driver(CLOCK_50, ~KEY[0], TxEmpty,XMitGo,TxData );
UART Tout(baudenable, CLOCK_50, ~KEY[0], TxData,XMitGo, TxEmpty,GPIO[1]);





endmodule 