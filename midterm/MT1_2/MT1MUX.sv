//spencer sawyer


module MT1MUX(input [3:0] I, input[1:0] S,output reg W);


always @ *
begin
W=I[S];
end

endmodule 