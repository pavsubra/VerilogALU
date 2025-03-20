`timescale 1ns / 1ps

module register_tb();

    reg [7:0] d;
    reg clk;
    reg areset;
    wire [7:0] q;

    initial clk = 0;
    always #2 clk <= ~clk;

     initial begin
 
        $dumpfile("dump.vcd");
        $dumpvars(0);
      
  
        areset = 1;
        d = 8'h00;
        #5 areset = 0;  

        #4  d = 8'd1;
        #4  d = 8'd2;
        #4  d = 8'd4;
        #4  d = 8'd8;
        #4  d = 8'd16;
        #4  d = 8'd32;
        #4  d = 8'd64;
        #4  d = 8'd128;
        #4  d = 8'd255;

        #6 areset = 1;
        #4 areset = 0;

        #10 $finish; // End simulation
    end
    
    //instantiate design under test
    register dut(d, clk, areset, q);

endmodule
