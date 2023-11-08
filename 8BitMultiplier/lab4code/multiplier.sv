module multiplier
(
	input logic Clk, Reset, Run, Reset_Load_Clear,
	input logic[7:0] SW,
	output logic X,       
	output logic[7:0] Aval, Bval, HEX0, HEX1, HEX2, HEX3
);

	logic[7:0] newA, newB, Adder, Sum;
	logic newX;
    
	logic clear_led;
	logic Shift_En;
	logic Addition, Subtraction;
	logic M;
	logic Clear_multiplication;
	logic AddX;
    always_ff @(posedge Clk) begin
		Aval <= newA;
		Bval <= newB;
		X <= newX;	
    end

	 always_comb begin
		if (Subtraction)
			Adder = ~SW;
		else if (~Addition)
			Adder = 8'h00;
		else
			Adder = SW;
		if (Clear_multiplication)
			newX = 1'b0;
		else
			newX = AddX;
	 end

   register_unit reg_unit
	(	
		.ARegisterIn(newX), 
		.BRegisterIn(newA[0]), 	
		.LoadA(Addition|Subtraction), 
		.LoadB(~clear_led), 
		.Clk, 
		.ResetA((Clear_multiplication)|(~clear_led)|(~Reset)), 
		.ResetB(~Reset),
		.Shift_En,
		.DataA(Sum),
		.DataB(SW),
		.A(newA),
		.B(newB)
	);

	
	control	control_unit
	(
		 .Clk,
		 .Reset,		 
		 .Run,
		 .Reset_Load_Clear,
		 .M(newB[0]),
		 .clear_led,
		 .Shift_En,
		 .Addition,
		 .Subtraction,
		 .Clear_multiplication
	);
	 
	nine_bit_adder FA9
	(
		 .A({newA[7],newA}),
		 .B({Adder[7],Adder}),
		 .C_in(Subtraction),
		 .Sum,
		 .X(AddX)
	); 
	 
    HexDriver HEX0_inst
    (
        .In0(newB[3:0]),
        .Out0(HEX0)
    );
    
    HexDriver HEX1_inst
    (
        .In0(newB[7:4]),
        .Out0(HEX1)
    );

    HexDriver HEX2_inst
    (
        .In0(newA[3:0]),
        .Out0(HEX2)
    );
    
    HexDriver HEX3_inst
    (
        .In0(newA[7:4]),
        .Out0(HEX3)
    );
 
    
    
endmodule