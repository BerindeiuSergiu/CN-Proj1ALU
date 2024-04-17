module ALU(
    input clk,
    input rst,
    input [15:0] A, B,
    input [3:0] select,
    output reg [15:0] result
);

wire [15:0] add, substraction, divsionRemainder, divisionResult, shift_left, shift_right, a_shift, andRes, orRes, xorRes;
wire [31:0] multiplyResult;
wire addcout, substractioncout;


andnr op1(.clk(clk), .A(A), .B(B), .outputreg(andRes));
ornr op2(.clk(clk), .A(A), .B(B), .outputreg(orRes));
xor1 op3(.clk(clk), .A(A), .B(B), .outputreg(xorRes));
arithmeticshifter op4(.clk(clk), .rst(rst), .s(2'b01), .inputreg(A), .outputreg(a_shift));
logicalshifter op5_1R(.clk(clk), .rst(rst), .s(2'b01), .inputreg(A), .outputreg(shift_right));
logicalshifter op5_1L(.clk(clk), .rst(rst), .s(2'b10), .inputreg(A), .outputreg(shift_left));
RCA op6(.a(A), .b(B), .cin(1'b0), .cout(addcout), .sum(add));
RCAD op7(.a(B), .b(A), .cin(1'b0), .cout(substractioncout), .sum(substraction));
booth op8(.clk(clk), .load(1'b1), .reset(rst), .M(B), .Q(A), .P(multiplyResult));
division op9(.clk(clk), .ld(1'b1), .rst(rst), .a(A), .b(B), .r(divsionRemainder), .q(divisionResult));


always @(*) begin
    case(select)
        4'b0000 : result = andRes;
        4'b0001 : result = orRes;
        4'b0010 : result = xorRes;
        4'b0011 : result = a_shift;
        4'b0100 : result = shift_right;
        4'b0101 : result = shift_left;
        4'b0110 : result = add;
        4'b0111 : result = substraction;
        4'b1000 : result = multiplyResult; // in case trebuie pe 32 de biti la iesire:)
        4'b1001 : result = divisionResult;
        4'b1010 : result = divsionRemainder;
    default : result = 0;
    endcase


end


endmodule