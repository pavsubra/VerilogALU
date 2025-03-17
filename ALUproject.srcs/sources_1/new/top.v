`timescale 1ns / 1ps

module top(

    //WIP as I do not have a FPGA board yet

    output seg1_a,
    output seg1_b,
    output seg1_c,
    output seg1_d,
    output seg1_e,
    output seg1_f,
    output seg1_g,
    
    output seg2_a,
    output seg2_b,
    output seg2_c,
    output seg2_d,
    output seg2_e,
    output seg2_f,
    output seg2_g

    );
    
    reg [7:0] a = 8'd48;
    reg [7:0] b = 8'd92;
    
    wire areset = 0;
    reg clk;
    
    initial clk = 0;
    always #2 clk = ~clk;
    
    reg in;
    always @(*) in = 1;
    wire [3:0] current_state;
    
    fsm fsm_top(clk, in, areset, current_state);
    
    wire [15:0] sel;
        
    decoder decoder_top(current_state, sel);
    
    reg [7:0] a_out;
    reg [7:0] b_out;
    
    register reg1_top(a, clk, areset, a_out);
    register reg2_top(b, clk, areset, b_out);
    
    wire negative;
    wire [3:0] out_hi;
    wire [3:0] out_lo;
    
    alu alu_top(clk, a_out, b_out, sel, negative, out_hi, out_lo);
    
    sseg sseg_msb(out_hi, seg1_a, seg1_b, seg1_c, seg1_d, seg1_e, seg1_f, seg1_g);
    sseg sseg_lsb(out_lo, seg2_a, seg2_b, seg2_c, seg2_d, seg2_e, seg2_f, seg2_g);
    
 
endmodule
