module count(carry_out,num_now,top,preset,reset,switch,carry_in);
output reg carry_out;
output reg[3:0] num_now;
input[32:0] top,preset;
input carry_in;
input switch;
input reset;
reg[32:0] count0;
initial 
count0<=preset;
always@(negedge reset,posedge carry_in)
if(!reset)
count0<=0;
else
begin
count0=count0+1;
if(count0+switch==top)
begin
count0<=0;
carry_out=1;
end
else
carry_out=0;
end
always@(count0)
if(switch==1)
num_now=top-count0;
else 
num_now=count0;
endmodule


