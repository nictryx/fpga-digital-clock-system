`timescale 1ns / 1ps


module hexTo7Seg(
input[5:0] dig, output[6:0] dispOUT);
reg[6:0] disp;
always @ (*)
begin
case(dig)
6'b000000: disp <= 7'b1111110; //0
6'b000001: disp <= 7'b0110000; //1
6'b000010: disp <= 7'b1101101; //2
6'b000011: disp <= 7'b1111001; //3
6'b000100: disp <= 7'b0110011; //4
6'b000101: disp <= 7'b1011011; //5
6'b000110: disp <= 7'b1011111; //6
6'b000111: disp <= 7'b1110000; //7
6'b001000: disp <= 7'b1111111; //8
6'b001001: disp <= 7'b1111011; //9
6'b001010: disp <= 7'b1110111; //for A 
6'b001011: disp <= 7'b1100111; //FOR P

default: disp <= 7'b0000000;
endcase
end
assign dispOUT = disp;
endmodule
