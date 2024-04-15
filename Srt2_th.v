module Srt2_tb;

    reg clk;
    reg load;
    reg reset;
    reg [15:0] M;
    reg [15:0] Q;

    wire [31:0] P;

    Srt2_th uut (
        .clk(clk), 
        .load(load), 
        .reset(reset), 
        .Divident(M), 
        .Divisor(Q), 
        .M(M), 
        .R(P[15:0]), 
    );

    always #5 clk = ~clk; 

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, uut); 
        $monitor ($time, " Q = %d, M = %d, P = %d, Q_t = %b", Q, M, P, Q);
    end

    
    initial begin
        clk = 0;
        load = 0;
        reset = 1'b1;
        M = 100;
        Q = 20;
        #20;
        load = 1;
        reset = 1'b0;
        #20;
        load = 0;
        #1000; 
        $finish;
    end

endmodule
