`timescale 1ns / 1ps

module decoder_tb();

reg [3:0] state;
wire [15:0] sel;

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      
      state = 4'd0;
      #2
      state = 4'd1;
      #2
      state = 4'd2;
      #2
      state = 4'd3;
      #2
      state = 4'd4;
      #2
      state = 4'd5;
      #2
      state = 4'd6;
      #2
      state = 4'd7;
      #2
      state = 4'd8;
      #2
      $finish;
    end

    decoder decoder_dut(state, sel);



endmodule
