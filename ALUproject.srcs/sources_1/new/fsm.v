`timescale 1ns / 1ps

module fsm(
    input clk,
    input in,
    input areset,
    output reg [3:0] current_state        
    );
    
    //9 states
    reg [3:0] state, next_state;
    
    parameter s0 = 4'b0000,   s1 = 4'b0001, s2 = 4'b0010,
              s3 = 4'b0011,   s4 = 4'b0100, s5 = 4'b0101,
              s6 = 4'b0110,   s7 = 4'b0111, s8 = 4'b1000;          
  
  //state transition logic
  always @(*) begin
    case (state)
        s0: next_state = (in == 1) ? s1 : s0;
        s1: next_state = (in == 1) ? s2 : s1;
        s2: next_state = (in == 1) ? s3  :s2;
        s3: next_state = (in == 1) ? s4 : s3;
        s4: next_state = (in == 1) ? s5  :s4;
        s5: next_state = (in == 1) ? s6 : s5;
        s6: next_state = (in == 1) ? s7 : s6;
        s7: next_state = (in == 1) ? s8 : s7;
        s8: next_state = (in == 1) ? s0 : s8;
        default: next_state = s0;
    endcase
  end
  
  //state FFs with async reset
  always @(posedge clk, posedge areset) begin
    if (areset)
        state <= s0;
    else
        state <= next_state;
  end
    
  //output logic
  always @(*)
    assign current_state = state;
    
endmodule
