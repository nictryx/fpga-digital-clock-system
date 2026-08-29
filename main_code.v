`timescale 1ns / 1ps

module ClockFinalProject(
input clk,
input reset, 
input set,
input[1:0] select,
input[5:0] val,
input mode,
output [7:0] hex_to_7seg,
output [7:0] AN); 


wire [6:0] cathode;
assign hex_to_7seg = {1'b0, cathode};
hexTo7Seg h1 (dig, cathode);
reg [5:0] dig = 6'd0;
reg [7:0] AN_wire = 8'b11111110;
assign AN = AN_wire;

reg [5:0] minutes = 6'd0;
reg [5:0] hours = 6'd0;
reg [5:0] seconds = 6'd0;
reg [5:0] amPm = 6'd10; //default value for AM
reg [5:0] days = 6'd1; //default value for AM
reg [5:0] months = 6'd1; //default value for months is 1
reg [5:0] years = 6'd22; //default value for years is the present year which is 2022

integer counter = 0;       // we used 32 bits for the counter because there is 1000hz in a 1 ms clock   
integer oneSecondCounter = 100000000;  //it is basically the number of ticks/taps in 1 second which is 100,000,000
integer TenMSecondsCounter = 100000;      //it is basically the number of ticks/taps in 1 milli second 100,000
    


always @(posedge clk)
begin
counter <= counter + 1;

if (reset)
begin
seconds <= 6'd0;
minutes <= 6'd0;
hours <= 6'd0;
amPm <= 6'd10;
days <= 6'd1;
months <= 6'd1;
years <= 6'd22;
end

  if(mode == 1'b0 && set == 1'b1)
  begin 
  case(select)
  2'b00 : hours = val % 13;
  2'b01 : minutes = val % 60;
  2'b10 : seconds = val % 60;
  2'b11 : amPm = (val == 0)? 6'd10 : 6'd11;
  endcase
  end
  
  else if(mode == 1'b1 && set == 1'b1)
  begin
  case (select)
  2'b00 : days = (val + 1) % 31; 
  2'b01 : months = (val + 1) % 13;
  2'b10 : years = val + 22;
  endcase
  end
  
else 
begin 
    seconds <= ((counter % oneSecondCounter)==0)? (seconds + 1) % 60 : seconds; //if counter equals exactly one second we will increment the seconds
    if(seconds == 6'd59 && minutes == 6'd59 && hours == 6'd11) begin 
            if(amPm == 6'd11) days <= days + 1;
            amPm <= (amPm == 6'd10) ? 6'd11 : 6'd10; //toggle am to pm and vise versa
    end
    else if(hours == 13) begin
        hours = 1;
        end
    
    if(seconds == 59) begin //check for max value of sec
seconds = 0; //reset seconds
minutes = minutes + 1; //increment minutes
end

    if(minutes == 60) begin //check for max value of min
minutes = 0; //reset minutes
hours = hours + 1; //increment hours
end
    

if (days == 31) begin //check for max value of days
days = 1; //reset days
months = months + 1; // increment months
end

if (months == 13) begin //check for max value of months
days = 1; // reset days
months = 1; // reset months
years = years + 1; // increment years
end

end
AN_wire <= ((counter % TenMSecondsCounter) == 0)? {AN_wire[6:0], AN_wire[7]} : AN_wire;
end

always @ (AN_wire)
    begin
    if(mode == 1'b0)
    case(AN_wire)
    8'b11111110: dig <= amPm;
    8'b11111101: dig <= 6'b100000;
    8'b11111011: dig <= seconds%10;
    8'b11110111: dig <= seconds/10;
    8'b11101111: dig <= minutes%10;
    8'b11011111: dig <= minutes/10;
    8'b10111111: dig <= hours%10;
    8'b01111111: dig <= hours/10;
    endcase
 else if (mode == 1'b1)
    case(AN_wire)
    8'b11111110: dig <= years%10;
    8'b11111101: dig <= years/10;
    8'b11111011: dig <= 6'b000000;
    8'b11110111: dig <= 6'b000010;
    8'b11101111: dig <= months%10;
    8'b11011111: dig <= months/10;
    8'b10111111: dig <= days%10;
    8'b01111111: dig <= days/10;
    endcase
               
       end
  
endmodule