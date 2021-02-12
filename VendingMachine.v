`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:44 02/09/2021 
// Design Name: 
// Module Name:    VendingMachine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VendingMachine(Q, D, N, soda, diet, reset, GiveSoda, GiveDiet, CLK);

parameter Wait = 4'b0000;
parameter five = 4'b0000;
parameter ten = 4'b0000;
parameter fifteen = 4'b0000;
parameter twenty = 4'b0000;
parameter twentyfive = 4'b0000;
parameter thirty = 4'b0000;
parameter thirtyfive = 4'b0000;
parameter forty = 4'b0000;
parameter fortyfive = 4'b0000;

reg [3:0] state = Wait;

// Inputs
input Q, D, N, reset, CLK;
input soda, diet;


//Outputs
output GiveSoda, GiveDiet;

reg GiveSoda, GiveDiet;

always @(posedge CLK)

	if(reset) begin
		state = Wait;
	end
	
	else
	
	/*				Summary
		One case for each state.  Advance to different state based
		on coin inputs.  At final state, dispense soda or diet soda
		based on selection inputs.	
	*/
		case (state)
			Wait : begin
				if(N)
					state = five;
				else if(D)
					state = ten;
				else
					state = twentyfive;
							
			end
			
			five : begin
				if(N)
					state = five;
				else if(D)
					state = ten;
				else
					state = twentyfive;
			
			end
			
			ten : begin
				if(N)
					state = fifteen;
				else if(D)
					state = twenty;
				else
					state = thirtyfive;
			
			end
			
			fifteen : begin
				if(N)
					state = twenty;
				else if(D)
					state = twentyfive;
				else
					state = forty;
			end
			
			twenty : begin
				if(N)
					state = twentyfive;
				else if(D)
					state = thirty;
				else
					state = fortyfive;
			end
			
			twentyfive : begin
				if(N)
					state = thirty;
				else if(D)
					state = thirtyfive;
				else
					state = fortyfive;
			end
		
			thirty : begin
				if(N)
					state = thirtyfive;
				else if(D)
					state = forty;
				else
					state = fortyfive;
			end
			
			thirtyfive : begin
				if(N)
					state = forty;
				else
					state = fortyfive;

			end
			
			forty : begin
				if(N)
					state = five;
				else
					state = fortyfive;
			
			end
			
			fortyfive : begin
				if(soda)
					GiveSoda = 1;
				else if(diet)
					GiveDiet = 1;
			end
			
	endcase
	
	//Reset coin inputs
	assign Q = 0;
	assign D = 0;
	assign N = 0;

endmodule
