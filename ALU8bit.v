`timescale 1ns / 1ps

module ALU8bit(
    input [7:0] A,
    input [7:0] B,
    input[3:0] Sel,
    output reg[7:0] Su = 0,
    output reg Z = 0,
    output reg C = 0,
    output reg S = 0,
    output reg P = 0 
);

reg k = 0;

always @(*)
    begin
    case(Sel)
    
    4'h0:
        begin
            Su = 0;
        end
    4'h1:
        begin
            Su = B;
        end 
    4'h2: 
        begin
            Su = ~B;
        end
    4'h3:   
        begin
            Su = A;
        end
    4'h4:   
        begin
            Su = ~A;
        end
    4'h5:   
        begin
            Su = A + 1;
        end
    4'h6: 
        begin
            Su = A - 1;
        end  
    4'h7:
        begin
           Su = A << B;
        end    
    4'h8:
        begin
            Su = A + B;
            Z = (Su == 8'b0)?1:0;
            C = (Su == 8'b0)?1:0;
            k = ~^Su;        //Odd Parity, XNOR of all the bits. If its 0 then Odd else Even
            if (k == 1'b0)
                P = 1;
            else 
                P = 0;
        end
    4'h9: 
        begin
            Su = A - B;
            if(B > A)
                S = 1;
            Z = (Su == 8'b0)?1:0;
            C = (Su == 8'b0)?1:0;
            k = ~^Su;
            if (k == 1'b0)
                P = 1;
            else 
                P = 0; 
            
        end
    4'hA:
        begin 
            Su = A + B;
            C = (Su == 8'b0)?1:0;
            Su = Su + C;
            Z = (Su == 8'b0)?1:0;
            k = ~^Su;
            if (k == 1'b0)
                P = 1;
            else 
                P = 0;
        end
    4'hB:
        begin
            Su = A - B;
            if(B > A)
                S = 1;
            C = (Su == 8'b0)?1:0;
            Su = Su - C;
            Z = (Su == 8'b0)?1:0;
            k = ~^Su;
            if (k == 1'b0)
                P = 1;
            else 
                P = 0;
        end
    4'hC: 
        begin
            Su = A & B;
            C = (Su == 8'b0)?1:0;
            Su = Su - C;
            Z = (Su == 8'b0)?1:0;
            k = ~^Su;
            if (k == 1'b0)
                P = 1;
            else 
                P = 0;
        end        
    4'hD:
        begin
            Su = A | B;
            C = (Su == 8'b0)?1:0;
            Su = Su - C;
            Z = (Su == 8'b0)?1:0;
            k = ~^Su;
            if (k == 1'b0)
                P = 1;
            else 
                P = 0;
        end      
    4'hE:
        begin
            Su = A ^ B;
            C = (Su == 8'b0)?1:0;
            Su = Su - C;
            Z = (Su == 8'b0)?1:0;
            k = ~^Su;
            if (k == 1'b0)
                P = 1;
            else 
                P = 0;
        end  
      
    4'hF:
        begin
            Su = ~(A ^ B);
            C = (Su == 8'b0)?1:0;
            Su = Su - C;
            Z = (Su == 8'b0)?1:0;
            k = ~^Su;
            if (k == 1'b0)
                P = 1;
            else 
                P = 0;
        end   
        default: Su = 0;
    endcase
    end

endmodule