module register_unit (
      input  logic ARegisterIn, BRegisterIn, LoadA, LoadB, Clk, ResetA, ResetB, Shift_En,
      input  logic [7:0]  DataA, DataB,
      output logic A_out, B_out, 
      output logic [7:0]  A, B);


    reg_4  reg_A (.Clk, .Reset(ResetA), .Shift_In(ARegisterIn), .Load(LoadA),
	               .Shift_En, .D(DataA), .Shift_Out(A_Out), .Data_Out(A));
    reg_4  reg_B (.Clk, .Reset(ResetB), .Shift_In(BRegisterIn), .Load(LoadB),
	               .Shift_En, .D(DataB), .Shift_Out(B_out), .Data_Out(B));

endmodule