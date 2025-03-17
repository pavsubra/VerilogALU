`timescale 1ns / 1ps

module alu_tb();

    reg clk;
    reg [7:0] a;
    reg [7:0] b;
    reg [15:0] sel;
    wire negative;
    wire [3:0] out_hi;
    wire [3:0] out_lo;

    initial clk = 0;
    always #2 clk <= ~clk;
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      
      a = 8'd48;
      b = 8'd92;
      
          sel = 16'b0000000000000001;
       #2 sel = 16'b0000000000000010;
       #2 sel = 16'b0000000000000100;
       #2 sel = 16'b0000000000001000;
       #2 sel = 16'b0000000000010000;
       #2 sel = 16'b0000000000100000;
       #2 sel = 16'b0000000001000000;
       #2 sel = 16'b0000000010000000;
       #2 sel = 16'b0000000100000000;
       #2 $finish;
   end
   
   alu alu_dut(clk, a, b, sel, negative, out_hi, out_lo);

endmodule
