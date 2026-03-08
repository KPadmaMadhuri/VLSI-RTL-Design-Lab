module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always@(posedge clk) begin
        case(L)
            1'b0 : begin
                case(E)
                    1'b0 : Q <= Q;
                    1'b1 : Q <= w;
                endcase
            end
            1'b1 : Q <= R;
        endcase
    end

endmodule
