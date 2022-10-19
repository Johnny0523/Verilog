module lab6(sw,led);

input [9:0]sw;
output [9:0]led;

assign led[9:0]=sw[9:0]; 

endmodule



