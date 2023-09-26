`timescale 1ns / 1ns

module lockcomp_tb();

	reg		clk;
	reg		set, clr,enable;
	reg		[15:0] new_code;
	reg		[15:0] pressed_code;
	wire		equal;

	// instantiate device to be tested
	lockcomp dut (
		.clk(clk),
		.set(set),
		.clr(clr),
		.enable(enable),
		.new_code(new_code),
		.pressed_code(pressed_code),
		.equal(equal)
	);

	// generate clock to sequence tests
	   
	//clock time period = 20ns (`timescale 1ns / 1ps)
    always #10 clk = ~clk;

	initial begin
		clk <= 0;
		set <= 1'b0;
		clr <= 0;
		enable <= 1'b0;
		new_code <= 16'h0000;
		pressed_code <= 16'h0000;
		
	end
	// initialize test
	integer i=0;
	initial
		begin
			clr <= 1; # 20; clr <= 0;
			#10 enable<=1'b1;
			#10 new_code<=16'h1234;
			#10 enable<=1'b0;
			#10 new_code<=16'h0000;
			while(equal!=1'b1)
			begin
				#10 pressed_code<=i+1;
				$monitor("Input: %d Equal: %d",pressed_code, equal);
				#1 i=i+1;
			end
			$finish
		end
	

endmodule
