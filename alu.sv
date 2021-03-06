`include "config.sv"
`include "constants.sv"

module alu (
    input        [4:0]  alu_function,
    input signed [31:0] operand_a,
    input signed [31:0] operand_b,
    output logic [31:0] result,
    output              result_equal_zero
);

always_comb begin 
   
     if(alu_function==5'b00001) begin 
        result=operand_a + operand_b;
        
     end else if(alu_function==5'b00010) begin 
        result=operand_a - operand_b;
        
     end else if(alu_function==5'b00011) begin 
        result=operand_a << operand_b;
        
     end else if(alu_function==5'b00100) begin
        result=operand_a >> operand_b;
        
     end else if(alu_function==5'b00101) begin
        result=operand_a >>> operand_b;
        
     end else if(alu_function==5'b00110) begin 

     if(operand_a==operand_b) begin
        result=31'b1;
        end else begin
        result = 31'b0;
        end        
     end else if(alu_function==5'b00111) begin 

     if(operand_a < operand_b) begin
        result=31'b1;
        end else begin
        result = 31'b0;
        end
        
     end else if(alu_function==5'b01000) begin 

     if($unsigned(operand_a) < $unsigned(operand_b)) begin
        result=31'b1;
        end else begin
        result = 31'b0;
        end

     end else if(alu_function==5'b01001) begin 
        result=operand_a ^ operand_b;
        
     end else if(alu_function==5'b01010) begin 
        result=operand_a | operand_b;
        
    end else if(alu_function==5'b01011) begin 
        result=operand_a & operand_b;   
     end
 end
    
assign result_equal_zero = (result == 32'b0);

endmodule
