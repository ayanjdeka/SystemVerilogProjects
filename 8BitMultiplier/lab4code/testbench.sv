module testbench();

timeunit 10ns;

timeprecision 1ns;


logic Clk = 0;
logic Reset, Run, Reset_Load_Clear;
logic[7:0] SW;

logic X;
logic[7:0] Aval, Bval, HEX0, HEX1, HEX2, HEX3;


logic [7:0] ans_a, ans_b;


integer ErrorCnt = 0;

multiplier multiplier0(.*);


always #1 Clk = ~Clk;


initial begin
	Reset = 0;		
	Run = 1;
	Reset_Load_Clear = 1;
	
	SW = 8'b00000111; // 7

	#2 Reset = 1;

	#2 Reset_Load_Clear = 0; 
	#2 Reset_Load_Clear = 1;

	#10 SW = 8'b00111011; // 59

	#2 Run = 0;

	#40 Run = 1;

	//answer = 413
	ans_a = 8'h01;
	ans_b = 8'h9d;

	if (Aval != ans_a || Bval != ans_b)
		ErrorCnt++;
	
	#10 SW = 8'b00000111; //7
	#2 Reset_Load_Clear = 0; 
	#2 Reset_Load_Clear = 1;

	#10 SW = 8'b11000101; //-59
	#2 Run = 0;

	#40 Run = 1;

	//answer = -413
	ans_a = 8'hfe;
	ans_b = 8'h63;

	if (Aval != ans_a || Bval != ans_b)
		ErrorCnt++;
		
	#10 SW = 8'b11111001; //-7

	#2 Reset_Load_Clear = 0; 
	#2 Reset_Load_Clear = 1;

	#10 SW = 8'b00111011; //59

	#2 Run = 0;

	#40 Run = 1;

	//answer = -413
	ans_a = 8'hfe;
	ans_b = 8'h63;

	if (Aval != ans_a || Bval != ans_b)
		ErrorCnt++;
	
	#10 SW = 8'b11111001; // -7

	#2 Reset_Load_Clear = 0; 
	#2 Reset_Load_Clear = 1;

	#10 SW = 8'b11000101; // -59

	#2 Run = 0;

	#40 Run = 1;

	//answer = 413
	ans_a = 8'h01;
	ans_b = 8'h9d;

	if (Aval != ans_a || Bval != ans_b)
		ErrorCnt++;
		
	if (ErrorCnt == 0)
		$display("Success!");
	else
		$display("Try again!");
		
		
end

endmodule