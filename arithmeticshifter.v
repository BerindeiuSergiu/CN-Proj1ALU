//01 - right, 10/11/00 - load
module arithmeticshifter(
    input clk, rst,
    input [1:0] s,
    input reg [15:0] inputreg,
    output reg[15:0] outputreg
);

always @(posedge clk)
    begin
        if(rst == 1)
            outputreg <= 0;
        else if(s == 2'b01) // right
            outputreg <= {inputreg[15], inputreg[15:1]};
                else
                    outputreg <= inputreg;
    end
endmodule

