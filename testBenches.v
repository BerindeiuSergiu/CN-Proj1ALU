
module or_tb;
reg clk, rst;
    reg [15:0] A;
    reg [15:0] B;
    wire [15:0] out;

    ornr uut(.clk(clk), .A(A), .B(B), .outputreg(out));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin
    A = 23;
    B = 101; 

    #1 $display("\n%b\n%b\n%b", A, B, out);
    end
endmodule


module or1bit_tb;
reg clk, rst;
    reg A;
    reg B;
    wire out;

    or1bit uut(.clk(clk), .A(A), .B(B), .outputreg(out));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin
    A = 0;
    B = 0; 

    #1 $display("\n%b\n%b\n%b", A, B, out);
    end
endmodule

module and_tb;
reg clk, rst;
    reg [15:0] A;
    reg [15:0] B;
    wire [15:0] out;

    and1 uut(.clk(clk), .A(A), .B(B), .outputreg(out));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin
    A = 23;
    B = 101; 

    #1 $display("\n%b\n%b\n%b", A, B, out);
    end
endmodule

module and1bit_tb;
reg clk, rst;
    reg A;
    reg B;
    wire out;

    and1bit uut(.clk(clk), .A(A), .B(B), .outputreg(out));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin
    A = 1;
    B = 1; 

    #1 $display("\n%b\n%b\n%b", A, B, out);
    end
endmodule

module logicalshifter_tb;
    reg clk, rst;
    reg [15:0] A;
    wire [15:0] B;

    logicalshifter uut(.clk(clk), .rst(rst), .s(2'b01), .inputreg(A), .outputreg(B));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin 
    A = 0;
    for (i = 0; i < 15; i = i + 1) begin
        //#1 A[i] = 0;
        #1 $display("\t%b\t%b", A, B);

        //#1 A[i] = 1;
        //#1 $display("\t%b\t%b", A, B);
    end
  end
endmodule

module arithmeticshifter_tb;
    reg clk, rst;
    reg [15:0] A;
    wire [15:0] B;

    arithmeticshifter uut(.clk(clk), .rst(rst), .s(2'b10), .inputreg(A), .outputreg(B));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin 
    A = 2**15;
    for (i = 0; i < 15; i = i + 1) begin
        #1 A[i] = 0;
        #1 $display("\t%b\t%b", A, B);

        #1 A[i] = 1;
        #1 $display("\t%b\t%b", A, B);
        end
    end
endmodule


module xor_tb;
reg clk, rst;
    reg [15:0] A;
    reg [15:0] B;
    wire [15:0] out;

    xor1 uut(.clk(clk), .A(A), .B(B), .outputreg(out));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin
    A = 23;
    B = 101; 

    #1 $display("\n%b\n%b\n%b", A, B, out);
    end
endmodule


module RCA_tb;
reg clk, rst;
    reg [15:0] A;
    reg [15:0] B;
    wire cout;
    wire [15:0] out;

    RCA uut(.a(A), .b(B), .cin(1'b0), .cout(cout), .sum(out));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin
    A = 447;
    B = 38; 

    #1 $display("\n%b\n%b\n%d", A, B, out);
    end
endmodule



module RCAD_tb;
reg clk, rst, ld;
    reg [15:0] A;
    reg [15:0] B;
    wire cout;
    wire [15:0] out;

    RCAD uut(.a(B), .b(A), .cin(1'b0), .cout(cout), .sum(out));
    integer i;

    initial begin
        clk = 0;
        repeat (200) #1 clk = ~clk;
    end

    initial begin
        rst = 0;
        #1 rst = ~rst;
    end

    initial begin
        A = 447;
        B = 38; 
        #1 $display("\n%b\n%b\n%b", A, B, out);
        end 


endmodule


module booth_tb;

	reg clk;
	reg load;
	reg reset;
	reg [15:0] M;
	reg [15:0] Q;

	wire [31:0] P;

	 booth uut (
		.clk(clk), 
		.load(load), 
		.reset(reset), 
		.M(M), 
		.Q(Q), 
		.P(P)
	);
	
	always
		#10 clk = ~clk;
  
  initial 
    begin
      	$dumpfile("design.vcd");
        $dumpvars(0,booth_tb );
      	$monitor ( $time, " Q = %b, M = %b, P = %b, cnt = %d              A = %b , Q_temp = %b",  Q, M, P, uut.cnt, uut.A, uut.Q_temp);
    end
	
	initial begin
		clk = 0;
		load = 0;
		reset = 1'b1;
		M = 931;
		Q = 788;
		#20;
		load = 1;
		reset = 1'b0;
		#20;
		load = 0;
		#500
		M = 442;
		Q = 131;
        #1200 $finish;

	end
      
endmodule


module division_tb;

    reg [15:0] divisor;
    reg [15:0] dividend;
    reg clk;
    reg load;
    reg rst;

    wire [15:0] result;
    wire [15:0] remainder;

    division uut (
        .clk(clk),
        .ld(load),
        .rst(rst),
        .a(divisor),
        .b(dividend),
        .r(remainder),
        .q(result)
    );
    
    always #5 clk = ~clk; // Toggle the clock every 5 time units

    initial begin
        clk = 0;
        load = 0;
        rst = 1;
        divisor = 3473;
        dividend = 147;
        #20; // Wait for a brief period
        rst = 0; // De-assert reset
        // #5; // Wait for a brief period
        load = 1; // Assert load
        #20; // Wait for a brief period
        load = 0; // De-assert load
        #1200 $finish; // Finish simulation after a long period
    end

    initial begin
        $monitor("Divisor: %b, Dividend: %b, Remainder: %d, Result: %d, AQ: %b, R=%b,  Count:%d", divisor, dividend, remainder, result, uut.AQ, uut.R, uut.R);
    end

endmodule





module alu_tb;

    reg clk, rst;
    reg [15:0] A, B;
    reg [3:0] select;
    wire [15:0] result;

    ALU xd(.clk(clk), .rst(rst), .A(A), .B(B), .select(select), .result(result));

    localparam ClOCKCYCLES=500;
    localparam CLKPERIOD=10;

    initial begin
        clk = 0;
        repeat(ClOCKCYCLES*2) #(CLKPERIOD/2) clk = ~clk;
    end

    integer i;

    initial begin
        A = 447;
        B = 38;
        rst = 1;
        #10 rst = 0;
        select = 4'b0;
        for(i = 0; i < 11; i = i + 1) begin
            select = i;
            #(CLKPERIOD * 15) $display("A = %d A = %b | B = %d B = %b | Result = %d Result %b | Operation : %b", A, A, B, B, result, result, select);
        end
        $display("\n");
        
        A = 194;
        B = 69;
        rst = 1;
        #10 rst = 0;
        select = 4'b0;
        for(i = 0; i < 11; i = i + 1) begin
            #10
            select = i;
            #(CLKPERIOD * 15) $display("A = %d A = %b | B = %d B = %b | Result = %d Result %b | Operation : %b", A, A, B, B, result, result, select);
        end
        $display("\n");

        A = 268;
        B = 33;
        rst = 1;
        #10 rst = ~rst;
        select = 4'b0;
        #10
        for(i = 0; i < 11; i = i + 1) begin
            #10
            select = i;
            #(CLKPERIOD * 15) $display("A = %d A = %b | B = %d B = %b | Result = %d Result %b | Operation : %b", A, A, B, B, result, result, select);
        end
        $display("\n");

    end

endmodule
