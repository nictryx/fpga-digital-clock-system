`timescale 1ns / 1ps


module Top_Module(
    output [7:0] cathode,
    output [7:0] anode, 
    input  clk, 
    input reset,
    input [5:0] val, 
    input[1:0] sel,
    input set, 
    input mode
    );
        
        wire[7:0] seg_7;
        ClockFinalProject uut(clk, reset, set, sel, val, mode, seg_7, anode);
        not g0 (cathode[0],seg_7[0]);
        not g1 (cathode[1],seg_7[1]);
        not g2 (cathode[2],seg_7[2]);
        not g3 (cathode[3],seg_7[3]);
        not g4 (cathode[4],seg_7[4]);
        not g5 (cathode[5],seg_7[5]);
        not g6 (cathode[6],seg_7[6]);
        not g7 (cathode[7],seg_7[7]);
    //assign cathode [7:0] = ~seg_7;
   
endmodule 