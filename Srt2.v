
module Division (
    input clk, 
    input load, 
    input reset,
    input [15:0] Dividend,
    input [15:0] Divisor, 
    output reg [15:0] Q,
    output reg [15:0] R,
    output reg ready
);

    reg [15:0] A; 
    reg [31:0] Dividend_copy, Divisor_copy, diff; 
    reg [4:0] count1, count2; 
    reg [31:0] bit; 
    assign ready = load;
	
    always @ (posedge clk or negedge reset) begin
        if (!reset) begin
            A <= 16'b0;
            Dividend_copy <= 32'b0;
            Divisor_copy <= 32'b0;
            diff <= 32'b0;
            count1 <= 5'b0;
            count2 <= 5'b0;
            bit <= 32'b0;
            Q <= 16'b0;
            R <= 16'b0;
        end else begin
            if (load) begin
                bit <= 32'd16;
                Dividend_copy <= {16'd0, Dividend};
                Divisor_copy <= {1'b0, Divisor, 15'd0};
            end else begin
                diff <= Dividend_copy - Divisor_copy;
                if (diff[31] == 1'b0) begin
                    Q[15] <= Q[15];
                    Q[14:0] <= A[15:1];
                    A <= diff;
                end
                count1 <= count1 + 1;
                Dividend_copy <= A;
            end
        end
    end

    assign R = Dividend_copy[15:0];

endmodule
