module TeeFF(output reg Q=0,input T,input clock, input clear);



always_ff @(posedge clock, negedge clear)
 begin
if(~clear)
Q<=0;
else
if(T)
Q<=~(Q);
else
Q<=Q;
end 



endmodule

module testTff();
reg T;
reg Q;
reg clock;
reg clear;
TeeFF Fnames(Q,T,clock,clear);

initial 
begin
T=0;
clock=0;
clear=1;
#10;
T=1;
clock=0;
#10;
clock=1;
#5;
T=1;
#5;
clock=0;
#10;
clock=1;
#10;
clock=0;
#10;
clock=1;
#5;
clear=0;
#5;
T=0;
clock=0;
#5;
clear =1;
#10;


end


endmodule 

