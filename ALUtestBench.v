`timescale 1ns / 1ps

module ALUtestBench();
    reg[7:0] A;
    reg[7:0] B;
    reg[3:0] Sel;
    wire[7:0] Su;
    wire Z;
    wire C;
    wire S;
    wire P;
    ALU8bit aluObj(A,B,Sel,Su,Z,C,S,P);

    initial begin
    
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0000;
    #5
    
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0001;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0010;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0011;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0100;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0101;
    #5    
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0110;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b0111;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1000;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1001;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1010;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1011;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1100;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1101;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1110;
    #5
        
    A = 8'd3;
    B = 8'd2;
    Sel = 4'b1111;
    #5
    
    
    $finish;
    end
    endmodule