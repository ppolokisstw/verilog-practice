module side(side_4bit,num_now,side_carry,n0,n1,n2,n3,p_ten_sec,p_min,preset_mod);
output reg[3:0] side_4bit;
output reg[3:0]num_now;
input side_carry,preset_mod;
input[3:0] n0,n1,n2,n3,p_ten_sec,p_min;
reg[3:0] nextside,side;
parameter 
s0=4'b0001,
s1=4'b0010,
s2=4'b0100,
s3=4'b1000;
initial 
side<=s0;
always@(posedge side_carry)
side<=nextside;
always@(side)
case(side)
s0:nextside=s1;
s1:nextside=s2;
s2:nextside=s3;
s3:nextside=s0;
endcase
always@(side,n0,n1,n2,n3)
case(side)
s0:num_now=n0;
s1:num_now=n1;
s2:
case(preset_mod)
1'b0:num_now=n2;
1'b1:num_now=p_ten_sec;
endcase
s3:
case(preset_mod)
1'b0:num_now=n3;
1'b1:num_now=p_min;
endcase
endcase
always@(side)
side_4bit=side;
endmodule
