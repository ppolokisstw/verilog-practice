module seg(seg_output,side,num_now);
output reg[7:0] seg_output;
input[3:0] num_now,side;
reg[6:0]num_reg;
parameter 
s0=4'b0001,
s1=4'b0010,
s2=4'b0100,
s3=4'b1000;
parameter
num0=7'b0000001,
num1=7'b1001111,
num2=7'b0010010,
num3=7'b0000110,
num4=7'b1001100,
num5=7'b0100100,
num6=7'b0100000,
num7=7'b0001111,
num8=7'b0000000,
num9=7'b0000100,
num10=7'b0000001;



initial 
num_reg=0;

always@(num_now)
case(num_now)
4'b0000:num_reg=num0;
4'b0001:num_reg=num1;
4'b0010:num_reg=num2;
4'b0011:num_reg=num3;
4'b0100:num_reg=num4;
4'b0101:num_reg=num5;
4'b0110:num_reg=num6;
4'b0111:num_reg=num7;
4'b1000:num_reg=num8;
4'b1001:num_reg=num9;
4'b1010:num_reg=num0;
endcase
always@(num_reg,side)
case(side)
s0:seg_output={num_reg,1'b0};
s0:seg_output={num_reg,1'b1};
s0:seg_output={num_reg,1'b0};
s0:seg_output={num_reg,1'b1};
endcase
endmodule
