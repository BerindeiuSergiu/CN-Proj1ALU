module division (
    input clk,
    input ld,
    input rst,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] q,
    output reg [15:0] r
);

    reg [31:0] AQ;
    reg [15:0] B;
    reg [15:0] R;
    reg [4:0] count;
    reg lda = 1;


    always @(posedge clk, negedge rst) begin
        if (rst ) begin
            R = 16'b0;     // Reset values
            B = 16'b0;
            AQ = 32'b0;
            count = 0;
            lda = 1;
        end else if (lda) begin
            R = 0;
            AQ = {16'b0 , a}; // Load AQ with dividend 'a'
            B = b;           // Load divisor 'b'
            count = 0;
            lda = 0;
        end 
            else if (AQ[31] == 1'b1 && (count < 16)) begin
                AQ = AQ << 1;
                R = AQ[31:16] + B;
                AQ[31:16] = R;
                if(R[15] == 1'b1)
                begin 
                    AQ[0] = 0;
                end else AQ[0] = 1;
                count = count + 1;           // Decrement count
            end
            else if (AQ[31] == 1'b0 && (count < 16)) begin // Check if first two bits of AQ are '01'
                AQ = AQ << 1;
                R = AQ[31:16] - B;
                AQ[31:16] = R;
                if(R[15] == 1'b1)
                begin 
                    AQ[0] = 0;
                end else AQ[0] = 1;            // Increment R by 1
                count = count + 1;             // Decrement count
            end

    end


    assign q = AQ[15:0];
    assign r = AQ[31] == 1 ? AQ[31:16] + B : AQ[31:16];

endmodule
