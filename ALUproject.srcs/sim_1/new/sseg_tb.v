`timescale 1ns / 1ps

module sseg_tb();
    
    reg [3:0] result;
    wire seg_a;
    wire seg_b;
    wire seg_c;
    wire seg_d;
    wire seg_e;
    wire seg_f;
    wire seg_g;
    
    
    initial begin
            result = 4'h0;
        #2  result = 4'h1;
        #2  result = 4'h2;
        #2  result = 4'h3;
        #2  result = 4'h4;
        #2  result = 4'h5;
        #2  result = 4'h6;
        #2  result = 4'h7;
        #2  result = 4'h8;
        #2  result = 4'h9;
        #2  result = 4'hA;
        #2  result = 4'hB;
        #2  result = 4'hC;
        #2  result = 4'hD;
        #2  result = 4'hE;
        #2  result = 4'hF;
        #2 $finish;
     end
    
    sseg sseg_dut(result, seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g);
        
        
endmodule
