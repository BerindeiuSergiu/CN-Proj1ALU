
/*
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
    A = 7;
    B = 3; 

    #1 $display("\n%b\n%b\n%b", A, B, out);
    end
endmodule



module RCAD_tb;
reg clk, rst;
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
    for(i = 0; i < 15; i = i + 1) begin
        A = i+5;
        B = i+1; 
        #1 $display("\n%b\n%b\n%b", A, B, out);
        end 
    end


endmodule


module booth_tb;
    reg clk, rst, ld;
    reg [15:0] A;
    reg [15:0] B;
    wire [31:0] out;
    wire cnt;

    booth uut(.clk(clk), .rst(rst), .ld(ld), .Q(A), .M(B), .P(out), .cntout(cnt));

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0,booth_tb );
        $monitor( $time, " Q = %b, M = %b, P = %b, COUT = %b" , B, A, out, cnt);
    end

    initial begin
        // Initialize Inputs
        clk = 0;
        ld = 1;
        #1 rst = 1'b1;
        #1 ld = 1'b0;
        #1 rst = 1'b0;
        A = 23;
        B = 456;            
        #1 ld = 1'b0;  
        repeat (95) #10 clk = ~clk;
        #150 $finish;
    end
endmodule


module booth_tb;

	// Inputs
	reg clk;
	reg load;
	reg reset;
	reg [15:0] M;
	reg [15:0] Q;

	// Outputs
	wire [31:0] P;

	// Instantiate the Design Under Test (DUT)
	 booth dut (
		.clk(clk), 
		.ld(load), 
		.rst(reset), 
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
      	$monitor ( $time, " Q = %b, M = %b, P = %b", Q, M, P);
    end
	
	initial begin
		// Initialize Inputs
		clk  	= 0;
		load 	= 0;
		reset 	= 1'b1;
		M 		= 4'b1010;
		Q 		= 4'b1011;
		#20;
		load  	= 1;
		reset 	= 1'b0;
		#20;
		load 	= 0;
		#300 $finish;

	end  
endmodule

*/

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
        $dumpvars(0,iiitb_r2_4bit_bm_tb );
      	$monitor ( $time, " Q = %d, M = %d, P = %d, Q_t = %b, Q-1 = %b, A = %b, CNT = %b", Q, M, P, dut.Q_temp, dut.Q_minus_one, dut.A, dut.cnt);
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
		#500 $finish;

	end
      
endmodule
