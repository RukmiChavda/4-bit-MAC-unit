`timescale 1ns / 1ps

module MAC_4_bit(f,i,j,clk,rst);
    
    input [3:0]i,j;
    input clk,rst;
    output [8:0]f;
    
    wire [7:0]m,a;
    wire [8:0]t;
    wire ca1;
    
    wmul_4_bit multiply(m,i,j);
    
    csa_8_bit adder(a,ca1,m,t[7:0],t[8]);
    
    buf_9_bit accmulator(t,{ca1,a},clk,rst);
    
    assign f = t;
    
endmodule

//////////////////////////////////////////////////////////////////////////////////

module buf_9_bit(q,d,clk,rst);

    input [8:0]d;
    input clk,rst;
    output [8:0]q;

        d_ff buffer0(q[0],d[0],clk,rst);
        d_ff buffer1(q[1],d[1],clk,rst);
        d_ff buffer2(q[2],d[2],clk,rst);
        d_ff buffer3(q[3],d[3],clk,rst);
        d_ff buffer4(q[4],d[4],clk,rst);
        d_ff buffer5(q[5],d[5],clk,rst);   
        d_ff buffer6(q[6],d[6],clk,rst);
        d_ff buffer7(q[7],d[7],clk,rst);
        d_ff buffer8(q[8],d[8],clk,rst);
   
endmodule

//////////////////////////////////////////////////////////////////////////////////

module d_ff(q,d,clk,rst);

    input d,clk,rst;
    output reg q;
    
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            q <= 1'b0; 
        else 
            q <= d; 
    end
        
endmodule 

//////////////////////////////////////////////////////////////////////////////////

module csa_8_bit(sum,cout,a,b,cin);
    
    input [7:0]a,b;
    input cin;
    output [7:0]sum;
    output cout;
    
    wire [7:0]s,c;
    wire [6:0]t;
    
    full_adder adder0(s[0],c[0],a[0],b[0],cin);
    full_adder adder1(s[1],c[1],a[1],b[1],cin);
    full_adder adder2(s[2],c[2],a[2],b[2],cin);
    full_adder adder3(s[3],c[3],a[3],b[3],cin);
    full_adder adder4(s[4],c[4],a[4],b[4],cin);
    full_adder adder5(s[5],c[5],a[5],b[5],cin);
    full_adder adder6(s[6],c[6],a[6],b[6],cin);
    full_adder adder7(s[7],c[7],a[7],b[7],cin);
    
    assign sum[0] = s[0];
    
    half_adder adder8(sum[1],t[0],c[0],s[1]);
    full_adder adder9(sum[2],t[1],c[1],s[2],t[0]);
    full_adder adder10(sum[3],t[2],c[2],s[3],t[1]);
    full_adder adder11(sum[4],t[3],c[3],s[4],t[2]);
    full_adder adder12(sum[5],t[4],c[4],s[5],t[3]);
    full_adder adder13(sum[6],t[5],c[5],s[6],t[4]);
    full_adder adder14(sum[7],t[6],c[6],s[7],t[5]);
    half_adder adder15(cout, ,c[7],t[6]);
 
       
endmodule

//////////////////////////////////////////////////////////////////////////////////

module wmul_4_bit(c,a,b);

    input [3:0]a,b;
    output [7:0]c;
    
    reg p[3:0][3:0];
    wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11;
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
    
    integer i,j;
    
    always @ (a or b)
    begin
        
        for(i=0;i<=3;i=i+1)
            for(j=0;j<=3;j=j+1)
                p[j][i] <= a[j]&b[i];
        
     end 
     
     half_adder adder1(s0,c0,p[0][1],p[1][0]);
     full_adder adder2(s1,c1,p[0][2],p[1][1],p[2][0]);
     full_adder adder3(s2,c2,p[0][3],p[1][2],p[2][1]);
     half_adder adder4(s3,c3,p[1][3],p[2][2]);
     
     half_adder adder5(s4,c4,s1,c0);
     full_adder adder6(s5,c5,s2,c1,p[3][0]);
     full_adder adder7(s6,c6,s3,c2,p[3][1]);
     full_adder adder8(s7,c7,p[2][3],c3,p[3][2]);
     
     half_adder adder9(s8,c8,s5,c4);
     full_adder adder10(s9,c9,s6,c5,c8);
     full_adder adder11(s10,c10,s7,c6,c9);
     full_adder adder12(s11,c11,p[3][3],c7,c10);
     
     assign c[0] = p[0][0];
     assign c[1] = s0;
     assign c[2] = s4;
     assign c[3] = s8;
     assign c[4] = s9;
     assign c[5] = s10;
     assign c[6] = s11;
     assign c[7] = c11;
     
endmodule
        
//////////////////////////////////////////////////////////////////////////////////
        
module full_adder(sum,carry,a,b,c);
    
    output sum,carry;
    input a,b,c;
        
    wire w1,w2,w3;
        
    half_adder adder1(w1,w2,a,b);
    half_adder adder2(sum,w3,w1,c);
    or(carry,w2,w3);
        
endmodule
    
//////////////////////////////////////////////////////////////////////////////////
    
module half_adder(sum,carry,a,b);
    
    output sum,carry;
    input a,b;
        
    xor(sum,a,b);
    and(carry,a,b);
        
endmodule
