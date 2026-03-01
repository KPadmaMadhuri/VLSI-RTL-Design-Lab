module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [1:0] count;
    always@(posedge clk) begin
        if(reset) begin
            shift_ena <= 1'b1;
        end else begin
        	count = count+1;
        	if(count == 00)begin
            	shift_ena <= reset ? 1'b1 : 1'b0;
        	end
        end
 
    end
    
endmodule
