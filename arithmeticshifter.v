//01 - right, 10 - left, 11/00 - load
module arithmeticshifter(
    input clk, rst,
    input [1:0] s,
    input reg [15:0] inputreg,
    output reg[15:0] outputreg
);

always @(posedge clk, negedge rst)
    begin
        if(!rst)
            outputreg <= 0;
        else if(s == 2'b01) // right
            outputreg <= {inputreg[15], inputreg[15:1]};
            else if(s == 2'b10) // left
                outputreg <= {inputreg[14:0], inputreg[0]};
                else if(s == 2'b11)
                    outputreg <= inputreg;
    end
endmodule

