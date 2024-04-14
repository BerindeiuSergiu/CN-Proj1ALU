module xor1(
    input clk,
    input reg [15:0] A,
    input reg [15:0] B,
    output reg[15:0] outputreg
);

assign outputreg = (A & (~B) | (~A) & B);

endmodule
