// TCES 330, Spring 2009
// Button Sync State Machine
// Ensures a button press is 
// only one clock period long
// R. Gutmann
//

module ButtonSyncReg( Bis, Bo, Clk );
  input Bis;      // unregistered input button press
  input Clk;      // system clock
  
  output logic Bo;  // our output
  
  // State assignments
  localparam S_A = 2'h0, 
             S_B = 2'h1,
             S_C = 2'h2,
             S_D = 2'h3;
             
  logic [1:0] State, StateNext;
  logic Bi;  // registered input
  
  // CombLogic
  always_comb begin
    case ( State )
      
      S_A: begin
        Bo = 0;             // turn output OFF
        if ( Bi == 1'b1 )
          StateNext = S_B;  // button push detected
        else
          StateNext = S_A;
      end
      
      S_B: begin
        Bo = 1; // turn output ON
        if ( Bi == 1'b1 )
          StateNext = S_C; 
        else
          StateNext = S_A;
      end
      
      S_C: begin
        Bo = 0; // turn output OFF
        if ( Bi == 1'b1 )
          StateNext = S_C;  // stay in this state
        else
          StateNext = S_A;  // otherwise, back to A
      end
      
      S_D: begin  // the only other possible value of State
        Bo = 0;
        StateNext = S_A;
      end
      
    endcase
  end // always
    
  // StateReg
  always_ff @( posedge Clk ) begin
  	Bi <= Bis;
    State <= StateNext;   // otherwise go to the state we set
  end  // always
  
endmodule
  
                   