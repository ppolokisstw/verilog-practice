module start_btn(start_tran,start_org,reset,to_0);
input start_org,reset;
output reg start_tran;
reg nextstart;
reg to_0tran;
reg to_0tran_next;
input to_0;
initial
begin
 start_tran<=0;
to_0tran<=1'b0;
end

always@(posedge to_0, negedge start_org)
to_0tran<=to_0tran_next;
always@(posedge to_0, negedge start_org)
case(to_0tran)
1'b0:
case(to_0)
1'b1:to_0tran_next<=1'b1;
endcase
1'b1:
case(start_org)
1'b0:to_0tran_next<=1'b0;
endcase
endcase






always@(posedge start_org,negedge reset,posedge to_0tran)
if(!reset||to_0tran)
start_tran<=0;
else
start_tran=nextstart;
always@( start_tran)
case(start_tran)
1'b0:nextstart=1'b1;
1'b1:nextstart=1'b0;
endcase
endmodule
