module adder(a,b,c,sum,co);
input a,b,c;
output sum,co;
wire w1,w2,w3;

assign w1=a^b;
assign sum=w1^c;
assign w2=a&b;
assign w3=w1&c;
assign co=w2|w3;

endmodule

module s1093311_lab2(a,b,c,sum,carr);

input [3:0] a;
input [3:0] b;
input c;
output [3:0] sum;
wire [4:1] co;
output carr;

adder(a[0],b[0],c,sum[0],co[1]);
adder(a[1],b[1],co[1],sum[1],co[2]);
adder(a[2],b[2],co[2],sum[2],co[3]);
adder(a[3],b[3],co[3],sum[3],carr);

endmodule