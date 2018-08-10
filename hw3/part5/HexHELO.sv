
//Written by Spencer Sawyer
module HexHELO( input [2:0] C, output [0:6] Hex);

//Should assign HELO to 0,1,2,3 respectively
//if an assignment is commented out, it represents a time where that segment should be lit up.
assign Hex[0]=  (~C[0]&~C[1]&~C[2])| //0 or H
	      //( C[0]&~C[1]&~C[2])| //1 or E
		(~C[0]& C[1]&~C[2])| //2 or L
	      //( C[0]& C[1]&~C[2])| //3 or O
		(~C[0]&~C[1]& C[2])| //4 or (blank)
		( C[0]&~C[1]& C[2])| //5 or (blank)
		(~C[0]& C[1]& C[2])| //6 or (blank)
		( C[0]& C[1]& C[2]); //7 or (blank)
//Segment zero is off most of the time. It's only on for E and O 
assign Hex[1]=//(~C[0]&~C[1]&~C[2])| //0 or H
		( C[0]&~C[1]&~C[2])| //1 or E
		(~C[0]& C[1]&~C[2])| //2 or L
	      //( C[0]& C[1]&~C[2])| //3 or O
		(~C[0]&~C[1]& C[2])| //4 or (blank)
		( C[0]&~C[1]& C[2])| //5 or (blank)
		(~C[0]& C[1]& C[2])| //6 or (blank)
		( C[0]& C[1]& C[2]); //7 or (blank)
//segment 1 is only used for H and O
assign Hex[2]=//(~C[0]&~C[1]&~C[2])| //0 or H
		( C[0]&~C[1]&~C[2])| //1 or E
		(~C[0]& C[1]&~C[2])| //2 or L
	      //( C[0]& C[1]&~C[2])| //3 or O
		(~C[0]&~C[1]& C[2])| //4 or (blank)
		( C[0]&~C[1]& C[2])| //5 or (blank)
		(~C[0]& C[1]& C[2])| //6 or (blank)
		( C[0]& C[1]& C[2]); //7 or (blank)
//segment 2 is only used for H and O
assign Hex[3]=  (~C[0]&~C[1]&~C[2])| //0 or H
	      //( C[0]&~C[1]&~C[2])| //1 or E
	      //(~C[0]& C[1]&~C[2])| //2 or L
	      //( C[0]& C[1]&~C[2])| //3 or O
	        (~C[0]&~C[1]& C[2])| //4 or (blank)
		( C[0]&~C[1]& C[2])| //5 or (blank)
		(~C[0]& C[1]& C[2])| //6 or (blank)
		( C[0]& C[1]& C[2]); //7 or (blank)
//segment three is used for everything except H
assign Hex[4]=//(~C[0]&~C[1]&~C[2])| //0 or H
	      //( C[0]&~C[1]&~C[2])| //1 or E
	      //(~C[0]& C[1]&~C[2])| //2 or L
	      //( C[0]& C[1]&~C[2])| //3 or O
	        (~C[0]&~C[1]& C[2])| //4 or (blank)
		( C[0]&~C[1]& C[2])| //5 or (blank)
		(~C[0]& C[1]& C[2])| //6 or (blank)
		( C[0]& C[1]& C[2]); //7 or (blank)
//Segment 4 is used for all letters
assign Hex[5]=//(~C[0]&~C[1]&~C[2])| //0 or H
	      //( C[0]&~C[1]&~C[2])| //1 or E
	      //(~C[0]& C[1]&~C[2])| //2 or L
	      //( C[0]& C[1]&~C[2])| //3 or O
	        (~C[0]&~C[1]& C[2])| //4 or (blank)
		( C[0]&~C[1]& C[2])| //5 or (blank)
		(~C[0]& C[1]& C[2])| //6 or (blank)
		( C[0]& C[1]& C[2]); //7 or (blank)
//segment 5 is used for all letters
assign Hex[6]=//(~C[0]&~C[1]&~C[2])| //0 or H
	      //( C[0]&~C[1]&~C[2])| //1 or E
	        (~C[0]& C[1]&~C[2])| //2 or L
	        ( C[0]& C[1]&~C[2])| //3 or O
	        (~C[0]&~C[1]& C[2])| //4 or (blank)
		( C[0]&~C[1]& C[2])| //5 or (blank)
		(~C[0]& C[1]& C[2])| //6 or (blank)
		( C[0]& C[1]& C[2]); //7 or (blank)
//segment 6 is used for H and E


endmodule
