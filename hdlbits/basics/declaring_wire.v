`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire y1,y2,y3;
    and(y1,a,b);
    and(y2,c,d);
    or(out,y1,y2);
    not(out_n,out);

endmodule
