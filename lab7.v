module FA(A,B,C,sum,C_out);
input A, B, C;
output sum, C_out;
assign sum=A^B^C;
assign C_out=((A ^ B) & C) | (A & B);
endmodule

module adder3bit(in_a,in_b,cin,sum,cout);
input [2:0]in_a;
input [2:0]in_b;
input cin;
output [3:0]sum;
output cout;
wire [1:0]c;
FA(in_a[0],in_b[0],cin,sum[0],c[0]);
FA(in_a[1],in_b[1],c[0],sum[1],c[1]);
FA(in_a[2],in_b[2],c[1],sum[2],cout);
assign sum[3:3]=cout;
endmodule

module Seg3bit(din,dout);
input [2:0]din;
output reg[7:0]dout;
always@(din)
begin
	case(din)
		3'b000:dout=8'b11000000;//0
		3'b001:dout=8'b11111001;//1
		3'b010:dout=8'b10100100;//2
		3'b011:dout=8'b10110000;//3
		3'b100:dout=8'b10011001;//4
		3'b101:dout=8'b10010010;//5
		3'b110:dout=8'b10000010;//6
		3'b111:dout=8'b11111000;//7
		//4'b1000:dout=7'b0000000;//8
		//4'b1001:dout=7'b0010000;//9	
		endcase
end
endmodule

module Seg4bit(din,dout1,dout2);
input [3:0]din;
output reg[7:0]dout1;
output reg[7:0]dout2;
always@(din)
begin	
		case(din)
		4'b0000://0 00
		begin
		dout1=8'b11000000;//0
		dout2=8'b11000000;//0
		end
		4'b0001://1 01
		begin
		dout1=8'b11000000;//0
		dout2=8'b11111001;//1
		end
		4'b0010://2 02
		begin
		dout1=8'b11000000;//0
		dout2=8'b10100100;//2
		end
		4'b0011://3 03
		begin
		dout1=8'b11000000;//0
		dout2=8'b10110000;//3
		end
		4'b0100://4 04
		begin
		dout1=8'b11000000;//0
		dout2=8'b10011001;//4
		end
		4'b0101://5 05
		begin
		dout1=8'b11000000;//0
		dout2=8'b10010010;//5
		end
		4'b0110://6 06
		begin
		dout1=8'b11000000;//0
		dout2=8'b10000010;//6
		end
		4'b0111://7 07
		begin
		dout1=8'b11000000;//0
		dout2=8'b11111000;//7
		end
		4'b1000://8 08
		begin
		dout1=8'b11000000;//0
		dout2=8'b10000000;//8
		end
		4'b1001://9 09
		begin
		dout1=8'b11000000;//0
		dout2=8'b10010000;//9
		end	
		4'b1010://10 10
		begin
		dout1=8'b11111001;//1
		dout2=8'b11000000;//0
		end	
		4'b1011://11 11
		begin
		dout1=8'b11111001;//1
		dout2=8'b11111001;//1
		end	
		4'b1100://12 12
		begin
		dout1=8'b11111001;//1
		dout2=8'b10100100;//2
		end	
		4'b1101://13 13
		begin
		dout1=8'b11111001;//1
		dout2=8'b10110000;//3
		end	
		4'b1110://14 14
		begin
		dout1=8'b11111001;//1
		dout2=8'b10011001;//4
		end	
		4'b1111://15 15
		begin
		dout1=8'b11111001;//1
		dout2=8'b10010010;//5
		end	
		endcase
end
endmodule


module lab7(sw,HEX3,HEX2,HEX1,HEX0);
input [9:0]sw;
output [7:0]HEX3,HEX2,HEX1,HEX0;
wire [3:0]value;
wire[2:0]c;
Seg3bit (sw[9:7],HEX3);
Seg3bit (sw[6:4],HEX2);
adder3bit(sw[9:7],sw[6:4],sw[0:0],value,c);
Seg4bit(value[3:0],HEX1,HEX0);
endmodule









