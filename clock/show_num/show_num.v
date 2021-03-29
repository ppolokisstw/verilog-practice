module show_num(num,side,reset,switch,start,clk_org,btn_ten_sec_plus,preset_mod);
output[7:0] num;
output[3:0] side;
input clk_org,switch,reset,start,preset_mod,btn_ten_sec_plus;
wire t3;
wire[3:0] t0,t2,t4,t5;
wire to_zero,btn_ten_sec_plus_tran;
wire[3:0] n0,n1,n2,n3,num_now,p_min,p_ten_sec;
wire to_TenofOne_sec,to_sec,to_ten_sec,to_min,side_carry,clk_start,start_tran0,reset_mod,clk_test;
//module count(carry_out,num_now,top,preset,reset,switch,carry_in);
//module seg(seg_output,side,num_now);
//module side(side_4bit,num_now,side_carry,n0,n1,n2,n3);
start_btn start_tran(start_tran0,start,reset,to_zero);
assign clk_start=clk_org&&start_tran0&&reset;
//count test(clk_test,t5,50000000,0,reset,switch,clk_start);//test if the clok is true or not
count clk_TenofOne_sec(to_TenofOne_sec,t0,5000000,0,reset,switch,clk_start);

count clk_to_sec(to_sec,n0,10,0,reset,switch,to_TenofOne_sec);
count clk_to_ten_sec(to_ten_sec,n1,10,0,reset,switch,to_sec);
count clk_to_min(to_min,n2,6,p_ten_sec,reset,switch,to_ten_sec);
count clk_min(to_zero,n3,10,p_min,reset,switch,to_min);
count clk_side(side_carry,t2,100000,0,1,switch,clk_org);
side side_set(side,num_now,side_carry,n0,n1,n2,n3,p_ten_sec,p_min,preset_mod);
seg seg_show(num,side,num_now);

assign btn_ten_sec_plus_tran=!btn_ten_sec_plus&&preset_mod;
nand g0 (reset_mod,!reset,preset_mod);
count preset_ten_sec(to_preset_min,p_ten_sec,6,0,reset_mod,0,btn_ten_sec_plus_tran);
count preset_min(t3,p_min,10,0,reset_mod,0,to_preset_min);
//module zero_stop(to_zero,switch,n0,n1,n2,n3);
//zero_stop stop(to_zero,switch,n0,n1,n2,n3);

endmodule
