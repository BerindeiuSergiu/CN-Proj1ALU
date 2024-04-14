module booth(
	// control signals
	input clk, load, reset,
	input [15:0] M,
	input [15:0] Q,
	output reg [31:0] P

    );
	 
	 reg [15:0] A 		=  15'b0;
	 reg Q_minus_one 	=  0;
	 reg [15:0] Q_temp 	=  15'b0;
	 reg [15:0] M_temp 	=  15'b0;
	 reg [4:0] cnt 	= 0;
	 
	 
	 
	 always @ (posedge clk)
	 begin
		if (reset == 1)
		begin
			A = 15'b0;		//reset values
			Q_minus_one =  0;
			P = 31'b0;
			Q_temp = 15'b0;
			M_temp = 15'b0;
			cnt = 0;

		end

		else if (load == 1)
		begin
			Q_temp =  Q;
			M_temp =  M;
		end

		else if((Q_temp[0] == Q_minus_one ) && (cnt < 16))
		begin
			Q_minus_one = Q_temp[0];
			Q_temp = {A[0],Q_temp[15:1]};				// right shift Q							
			A = {A[15],A[15:1]};					// right shift A	
		    cnt = cnt + 1'b1;					
		end
		else if((Q_temp[0] == 0 && Q_minus_one == 1)  && (cnt < 16))
		begin
			A = A + M_temp;
			Q_minus_one = Q_temp[0];
			Q_temp = {A[0],Q_temp[15:1]};				// right shift Q
			A = {A[15],A[15:1]};					// right shift A
			cnt = cnt + 1'b1;
		end
		else if((Q_temp[0] == 1 && Q_minus_one == 0)  && (cnt < 16))
		begin
			A = A - M_temp;
			Q_minus_one = Q_temp[0];
			Q_temp = {A[0],Q_temp[15:1]};				// right shift Q
			A = {A[15],A[15:1]};					// right shift A
			cnt = cnt + 1'b1;
		end
		P = {A, Q_temp};
		
	 end

endmodule



