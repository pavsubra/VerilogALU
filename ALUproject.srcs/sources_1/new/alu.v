`timescale 1ns / 1ps

module alu(
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [15:0] sel,
    output reg negative,
    output [3:0] out_hi,
    output [3:0] out_lo
    );
    
    reg [7:0] result;
    
    always @(*) begin
        case(sel)
            16'd1: begin
                result <= a + b;
                negative <= 0;
            end
            16'd2: begin
                if ( a > b) begin
                    negative <= 0;
                    result <= a - b;
                end
                else begin
                    negative <= 1;
                    result <= a - b;
                end
            end
            16'd4: begin
                result <= ~a;
                negative <= 0;
            end
            16'd8: begin
                result <= ~(a&b);
                negative <= 0;
            end
            16'd16: begin
                result <= ~(a | b);
                negative <= 0;
            end
            16'd32: begin
                result <= a & b;
                negative <= 0;
            end
            16'd64: begin
                result <= a^b;
                negative <= 0;
            end
            16'd128: begin
                result <= a | b;
                negative <= 0;
            end
            16'd256: begin
                result <= ~(a^b);
                negative <= 0;
            end
            default: begin
                result <= 8'd0;
                negative <= 0;
            end             
        endcase
    end
    
    assign out_hi = result[7:4];
    assign out_lo = result[3:0];
    
endmodule
