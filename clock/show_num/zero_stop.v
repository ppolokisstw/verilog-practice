module zero_stop(to_zero,switch,n0,n1,n2,n3);
input switch;
input[3:0] n0,n1,n2,n3;
output reg to_zero;
parameter zero_num=4'b0000;
initial to_zero<=0;
always@(n0,n1,n2,n3,switch)
if(n0==zero_num&&n1==zero_num&&n2==zero_num&&n2==zero_num&&n3==zero_num&&switch==1)
to_zero<=1;
else
to_zero<=0;
endmodule
