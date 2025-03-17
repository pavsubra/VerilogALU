`timescale 1ns / 1ps

module fsm_tb();

    reg clk;
    reg in;
    reg areset;
    wire [3:0] current_state;

    initial in = 1;
    initial areset = 0;
    
    initial clk = 0;
    always #1 clk = ~clk;

    integer i = 0;

    initial begin
    
        $dumpfile("dump.vcd");
        $dumpvars(0);
        
            areset = 1;
            in = 0;
            #2
            areset = 0;
            #2
            in = 1;
            #2
            in = 1;
            #2.5
            areset = 1;
            #2
            areset = 0;
            in = 1;
            #2.5
            in =0;
          for (i = 0; i < 14; i= i + 1) begin
                #2 in =1;
          end
          #2 $finish;
      end

    fsm dut_fsm(clk, in, areset, current_state);

endmodule
