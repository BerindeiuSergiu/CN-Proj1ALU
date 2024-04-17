//01 - right, 10 - left, 11 - load
module logicalshifter(
    input clk, rst,
    input [1:0] s,
    input reg [15:0] inputreg,
    output reg [15:0] outputreg
);

always @(posedge clk)
    begin
        if(rst == 1)
            outputreg <= 0;
        else if(s == 2'b01)
            outputreg <= {1'b0, inputreg[15:1]};
            else if(s == 2'b10)
                outputreg <= {inputreg[14:0], 1'b0};
                else if(s == 2'b11)
                    outputreg <= inputreg;
    end
endmodule



