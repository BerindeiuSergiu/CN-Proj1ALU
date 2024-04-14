module andnr(
    input clk,
    input reg [15:0] A,
    input reg [15:0] B,
    output reg[15:0] outputreg
);

assign outputreg = A & B;
endmodule

module and1bit(
    input clk,
    input reg A,
    input reg B,
    output reg outputreg
);

assign outputreg = A & B;
endmodule

