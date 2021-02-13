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
parameter five = 4'b0001;
parameter ten = 4'b0010;
parameter fifteen = 4'b0011;
parameter twenty = 4'b0100;
parameter twentyfive = 4'b0101;
parameter thirty = 4'b0111;
parameter thirtyfive = 4'b1000;
parameter forty = 4'b1001;
parameter fortyfive = 4'b1011;

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
		GiveDiet = 0;
		GiveSoda = 0;
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
				else if(Q)
					state = twentyfive;
							
			end
			
			five : begin
				if(N)
					state = ten;
				else if(D)
					state = fifteen;
				else if(Q)
					state = thirty;
			
			end
			
			ten : begin
				if(N)
					state = fifteen;
				else if(D)
					state = twenty;
				else if(Q)
					state = thirtyfive;
			
			end
			
			fifteen : begin
				if(N)
					state = twenty;
				else if(D)
					state = twentyfive;
				else if(Q)
					state = forty;
			end
			
			twenty : begin
				if(N)
					state = twentyfive;
				else if(D)
					state = thirty;
				else if(Q)
					state = fortyfive;
			end
			
			twentyfive : begin
				if(N)
					state = thirty;
				else if(D)
					state = thirtyfive;
				else if(Q)
					state = fortyfive;
			end
		
			thirty : begin
				if(N)
					state = thirtyfive;
				else if(D)
					state = forty;
				else if(Q)
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

endmodule
