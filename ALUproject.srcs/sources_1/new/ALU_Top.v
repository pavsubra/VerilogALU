`timescale 1ns / 1ps

module ALU_Top(
    input wire clk,
    input wire rst,
    input wire [3:0] fsm_input,  
    input wire [7:0] reg1_in,   
    input wire [7:0] reg2_in,   
    output reg [7:0] alu_result, 
    output wire [6:0] sseg_out_lo, 
    output wire [6:0] sseg_out_hi
);

    
    wire [3:0] current_state; 
    wire [15:0] sel; 
    wire [7:0] reg1_out, reg2_out; 
    reg [3:0] sseg_input_lo_reg, sseg_input_hi_reg; 
    wire negative;
    wire [3:0] out_hi, out_lo; 


    fsm fsm_inst (
        .clk(clk),
        .in(fsm_input[0]),
        .areset(rst),
        .current_state(current_state)
    );


    decoder decoder_inst (
        .state(current_state),
        .sel(sel)
    );

 
    register reg1 (
        .clk(clk),
        .areset(rst),
        .d(reg1_in),
        .q(reg1_out)
    );
    
    register reg2 (
        .clk(clk),
        .areset(rst),
        .d(reg2_in),
        .q(reg2_out)
    );
    
    
    alu alu_inst (
        .clk(clk),
        .a(reg1_out),
        .b(reg2_out),
        .sel(sel),
        .negative(negative),
        .out_hi(out_hi),
        .out_lo(out_lo)
    );
    
    // Synchronize ALU output with clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            alu_result <= 8'b0;
            sseg_input_lo_reg <= 4'b0000;
            sseg_input_hi_reg <= 4'b0000;
        end 
        else begin
            alu_result <= {out_hi, out_lo};
            sseg_input_lo_reg <= out_lo;
            sseg_input_hi_reg <= out_hi;
        end
    end

    
    sseg sseg_inst_lo (
        .result(sseg_input_lo_reg),
        .seg_a(sseg_out_lo[6]),
        .seg_b(sseg_out_lo[5]),
        .seg_c(sseg_out_lo[4]),
        .seg_d(sseg_out_lo[3]),
        .seg_e(sseg_out_lo[2]),
        .seg_f(sseg_out_lo[1]),
        .seg_g(sseg_out_lo[0])
    );

    sseg sseg_inst_hi (
        .result(sseg_input_hi_reg),
        .seg_a(sseg_out_hi[6]),
        .seg_b(sseg_out_hi[5]),
        .seg_c(sseg_out_hi[4]),
        .seg_d(sseg_out_hi[3]),
        .seg_e(sseg_out_hi[2]),
        .seg_f(sseg_out_hi[1]),
        .seg_g(sseg_out_hi[0])
    );

endmodule
