`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:53 02/12/2021
// Design Name:   VendingMachine
// Module Name:   C:/Users/subhi/Documents/CDA4203 - System Design/Lab4/VendingMachine_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VendingMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VendingMachine_tb;

	// Inputs
	reg Q;
	reg D;
	reg N;
	reg soda;
	reg diet;
	reg reset;
	reg CLK;

	// Outputs
	wire GiveSoda;
	wire GiveDiet;

	// Instantiate the Unit Under Test (UUT)
	VendingMachine uut (
		.Q(Q), 
		.D(D), 
		.N(N), 
		.soda(soda), 
		.diet(diet), 
		.reset(reset), 
		.GiveSoda(GiveSoda), 
		.GiveDiet(GiveDiet), 
		.CLK(CLK)
	);

	// Clock Generator
	always begin
		CLK = ~CLK;
		#5;
	end

	initial begin
		// Initialize Inputs
		CLK = 0;
		Q = 0;
		D = 0;
		N = 0;
		soda = 0;
		diet = 0;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		//1Quarter 2Dimes
		soda = 1;
		#10;
		Q = 1;
		#10;
		Q = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		soda = 0;
		#50
		
		//Reset command 
		reset = 1;
		#20;
		
		//5Dimes
		reset = 0;
		#10
		diet = 1;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10
		diet = 0;
		#50
		
		reset = 1;
		#20;
		
		//4Dimes 1Quarter
		reset = 0;
		#10
		diet = 1;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		D = 1;
		#10;
		D = 0;
		#10;
		Q = 1;
		#10;
		Q = 0;
		#10
		diet = 0;
		#50;
		
		reset = 1;
		#20;
		reset = 0;

	end
      
endmodule

