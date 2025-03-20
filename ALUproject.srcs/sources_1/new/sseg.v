`timescale 1ns / 1ps

module sseg(
    input [3:0] result,
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g
    );
    
    //7 bits, one for each segment of the display
    reg [6:0] sseg_encode;
    
    
    always@(*) begin
        case(result)
            4'h0: sseg_encode = 7'b1111110;
            4'h1: sseg_encode = 7'b0110000;
            4'h2: sseg_encode = 7'b1101101;
            4'h3: sseg_encode = 7'b1111001;
            4'h4: sseg_encode = 7'b0110011;
            4'h5: sseg_encode = 7'b1011011;
            4'h6: sseg_encode = 7'b1011111;
            4'h7: sseg_encode = 7'b1110000;
            4'h8: sseg_encode = 7'b1111111;
            4'h9: sseg_encode = 7'b1111011;
            4'hA: sseg_encode = 7'b1110111;
            4'hB: sseg_encode = 7'b0011111;
            4'hC: sseg_encode = 7'b1001110;
            4'hD: sseg_encode = 7'b0111101;
            4'hE: sseg_encode = 7'b1001111;
            4'hF: sseg_encode = 7'b1000111;
            default: sseg_encode = 7'b0000000;
        endcase
    end
    
    assign seg_a = sseg_encode[6];
    assign seg_b = sseg_encode[5];
    assign seg_c = sseg_encode[4];
    assign seg_d = sseg_encode[3];
    assign seg_e = sseg_encode[2];
    assign seg_f = sseg_encode[1];
    assign seg_g = sseg_encode[0];        
    
endmodule
