`timescale 1ns / 1ps


module register(
    input [7:0] d,
    input clk,
    input areset,
    output reg [7:0] q
    );
    
    always @(posedge clk, posedge areset) begin
        if (areset)
            q <= 8'd0;
        else
            q <= d;
    end
endmodule
