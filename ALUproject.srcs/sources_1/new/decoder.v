`timescale 1ns / 1ps

module decoder(
    input [3:0] state,
    output reg [15:0] sel 
    );
    
    always @(*)begin
        case(state)
            4'd0 : sel = 16'b0000000000000001;
            4'd1 : sel = 16'b0000000000000010;
            4'd2 : sel = 16'b0000000000000100;
            4'd3 : sel = 16'b0000000000001000;
            4'd4 : sel = 16'b0000000000010000;
            4'd5 : sel = 16'b0000000000100000;
            4'd6 : sel = 16'b0000000001000000;
            4'd7 : sel = 16'b0000000010000000;
            4'd8 : sel = 16'b0000000100000000;
            default: sel  = 16'b0000000000000000;
        endcase
    end
    
    
endmodule
