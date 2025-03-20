`timescale 1ns / 1ps

module ALU_Top_tb;

    
    reg clk;
    reg rst;
    reg [3:0] fsm_input;
    reg [7:0] reg1_in, reg2_in;
    wire [7:0] alu_result;
    wire [6:0] sseg_out_lo, sseg_out_hi;

    
    ALU_Top uut (
        .clk(clk),
        .rst(rst),
        .fsm_input(fsm_input),
        .reg1_in(reg1_in),
        .reg2_in(reg2_in),
        .alu_result(alu_result),
        .sseg_out_lo(sseg_out_lo), 
        .sseg_out_hi(sseg_out_hi)  
    );

    
    always #5 clk = ~clk;

    
    initial begin
        
        clk = 0;
        rst = 1;
        fsm_input = 4'b0000;
        reg1_in = 8'h30; // 48 in decimal
        reg2_in = 8'h5C; // 92 in decimal

        
        #10 rst = 0;

        
        #20 fsm_input = 4'b0001; // Addition
        #20 fsm_input = 4'b0010; // Subtraction
        #20 fsm_input = 4'b0011; // Bitwise NOT on A
        #20 fsm_input = 4'b0100; // NAND
        #20 fsm_input = 4'b0101; // NOR
        #20 fsm_input = 4'b0110; // AND
        #20 fsm_input = 4'b0111; // XOR
        #20 fsm_input = 4'b1000; // OR

        
        #40 $stop;
    end

    initial begin
        $monitor("Time: %0t | FSM: %b | ALU Result: %h | SSEG_HI: %b | SSEG_LO: %b",
                 $time, fsm_input, alu_result, sseg_out_hi, sseg_out_lo);
    end

endmodule
