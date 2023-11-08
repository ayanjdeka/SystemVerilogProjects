module control
(
    input logic Clk, Run, Reset_Load_Clear, M, Reset,
    output logic  Addition, Subtraction, clear_led, Shift_En, Clear_multiplication

);

    enum logic [4:0] {A, B, C, D, E, F, G, H, I, J, B_Shift, C_Shift, D_Shift, E_Shift, F_Shift, G_Shift, H_Shift, I_Shift}   curr_state, next_state; 
    always_ff @(posedge Clk) begin
        if (~Reset)
				curr_state <= A;			
        else 
            curr_state <= next_state;
	 end
        
	always_comb
    begin
        
		next_state  = curr_state;
        unique case (curr_state) 
		  
            A :    if (~Run)
                       next_state = B;
							  
            B :    next_state = B_Shift;
				B_Shift: 	 next_state = C;
				
				C :    next_state = C_Shift;
				C_Shift: 	 next_state = D;
				
				D :    next_state = D_Shift;
				D_Shift: 	 next_state = E;
				
				E :    next_state = E_Shift;
				E_Shift: 	 next_state = F;
				
				F :    next_state = F_Shift;
				F_Shift: 	 next_state = G;
				
				G :    next_state = G_Shift;
				G_Shift: 	 next_state = H;
				
				H :    next_state = H_Shift;
				H_Shift: 	 next_state = I;
				
				I :    next_state = I_Shift;
				I_Shift: 	 next_state = J;
				
            J :    if (Run) 
                       next_state = A;

							  
        endcase
   
		  
		Clear_multiplication = 1'b0;
        case (curr_state) 
	   	   		A: 
	         	begin
						Addition = 1'b0;
						Subtraction = 1'b0;
						Clear_multiplication = 1'b1;
                	clear_led = Reset_Load_Clear;
                	Shift_En = 1'b0;
		      	end
				B:
				begin
						Addition = M;
						Subtraction = 1'b0;
                	clear_led =  1'b1;;
                	Shift_En = 1'b0;
		      	end
				C:
				begin
					clear_led =  1'b1;
					Shift_En = 1'b0;
					Addition = M;
					Subtraction = 1'b0;
		      	end
				D:
				begin
					Addition = M;
					Subtraction = 1'b0;
					clear_led =  1'b1;;
					Shift_En = 1'b0;
		      	end
				E: 
				begin
					Addition = M;
					Subtraction = 1'b0;
					clear_led =  1'b1;
					Shift_En = 1'b0;
		      	end
				F:
				begin
					Addition = M;
					Subtraction = 1'b0;
					clear_led =  1'b1;
					Shift_En = 1'b0;
		      	end
				G: 
				begin
					Addition = M;
					Subtraction = 1'b0;
					clear_led =  1'b1;
					Shift_En = 1'b0;
		      	end	
				H: 
				begin
					 Addition = M;
					 Subtraction = 1'b0;
					clear_led =  1'b1;
					Shift_En = 1'b0;
		      	end
				I:
				begin
					Addition = 1'b0;
					if (M)begin
						Subtraction = 1'b1;
					end else
						Subtraction = 1'b0; 
					clear_led =  1'b1;
               Shift_En = 1'b0;
				end
	   	   		J: 
				begin
					Addition = 1'b0;
					Subtraction = 1'b0;
					clear_led =  1'b1;
					Shift_En = 1'b0;
				end
//					K: begin
//						Addition = 1'b0;
//						Subtraction = 1'b0;
//						clear_led =  1'b1;
//						Shift_En = 1'b0;
//						end
	   	   default:
		    begin 
				Addition = 1'b0;
				Subtraction = 1'b0;
            clear_led = 1'b1;
            Shift_En = 1'b1;
		    end
        endcase
    end
endmodule