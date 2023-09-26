// απο το βιντεο https://www.youtube.com/watch?v=jgQf0LaGDm0
module pipo_register
(
	input clk,clr,set,
	input  [15:0] c_in,
	input  enable,
	output reg [15:0] stored_number_c
);
	
	always @ (posedge clk)
	
	begin 
		if (enable)
		begin
			if (clr==1)	stored_number_c = 16'b0000000000000000;
			else if (set==1)	stored_number_c = 16'hffff;
			else	stored_number_c = c_in;
		end
		else stored_number_c = stored_number_c;

	end
endmodule	






module comparator
(
		
		// απο το αρχειο Combinational-Circuits-in-Verilog.pdf που εχω στον φακελο του VLSI


	input [15:0] arithmos_a,
	input [15:0] arithmos_b,
	
	output equal

);
	 
	
	assign equal = (arithmos_a==arithmos_b)? 1'b1 : 1'b0;
	
endmodule






module lockcomp
(
	input clk,
	input [15:0] pressed_code,
	input set,clr,enable,
	input [15:0] new_code,
	output equal


	
);	
	
	//wire pipo_register_out;
	
	wire [15:0] lock_code;
	

	pipo_register register (
		.clk(clk),
		.clr(clr),
		.set(set),
		.c_in(new_code),
		.enable(enable),
		.stored_number_c(lock_code)
	);
	
	comparator comp (
		.arithmos_a(lock_code),
		.arithmos_b(pressed_code),
		.equal(equal)
	);
	

	
endmodule
