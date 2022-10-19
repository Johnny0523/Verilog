module hw2(A3,B3,A2,B2,A1,B1,A0,B0,D2,D1,D0);

input A3,B3,A2,B2,A1,B1,A0,B0;
output D2,D1,D0;
wire a,b,c,d,e,f,g,h,nA0,nA1,nA2,nA3,nB0,nB1,nB2,nB3;
wire x3,x2,x1,x0;
wire i,j,k,l,m,n;

not not1(nA0,A0);
not not2(nA1,A1);
not not3(nA2,A2);
not not4(nA3,A3);
not not5(nB0,B0);
not not6(nB1,B1);
not not7(nB2,B2);
not not8(nB3,B3);

and and11(a,nA3,B3);
and and12(b,nB3,A3);
and and13(c,nA2,B2);
and and14(d,nB2,A2);
and and15(e,nA1,B1);
and and16(f,nB1,A1);
and and17(g,nA0,B0);
and and18(h,nB0,A0);

nor nor1(x3,a,b);
nor nor2(x2,c,d);
nor nor3(x1,e,f);
nor nor4(x0,g,h);

and and21(i,x3,c);
and and22(j,x3,d);
and and23(k,x3,x2,e);
and and24(l,x3,x2,f);
and and25(m,x3,x2,x1,g);
and and26(n,x3,x2,x1,h);


or or1(D2,a,i,k,m);
or or2(D1,b,j,l,n);
and and27(D0,x3,x2,x1,x0);



endmodule