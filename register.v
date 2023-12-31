module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);

 
	input [4:0] ReadRegister1,ReadRegister2,WriteRegister;
	input [31:0] WriteData;
	input RegWrite,Clk;
	
	output reg [31:0] ReadData1,ReadData2;
	
	
	
	reg [31:0] Registers [0:31];
	
	initial begin
		Registers[0] <= 32'h00000000;
		Registers[1] <= 32'h00000000;
		Registers[2] <= 32'h00000000;
		Registers[3] <= 32'h00000000;
		Registers[4] <= 32'h00000000;
		Registers[5] <= 32'h00000000;
		Registers[6] <= 32'h00000000;
		Registers[7] <= 32'h00000000;
		Registers[8] <= 32'h00000000;
		Registers[9] <= 32'h00000000;
		Registers[10] <= 32'h00000010;
		Registers[11] <= 32'h00000000;
		Registers[12] <= 32'h00000000;
		Registers[13] <= 32'h00000000;
		Registers[14] <= 32'h00000111;
		Registers[15] <= 32'h00001000;
		Registers[16] <= 32'h00000000;
		Registers[17] <= 32'h00000010;
		Registers[18] <= 32'h00000000;
		Registers[19] <= 32'h00000000;
		Registers[20] <= 32'h00000010;
		Registers[21] <= 32'h00000100;
		Registers[22] <= 32'h00000101;
		Registers[23] <= 32'h00000000;
		Registers[24] <= 32'h00000000;
		Registers[25] <= 32'h00000000;
		Registers[29] <= 32'd252;
		Registers[31] <= 32'b0;
	end
	
	
	always @(posedge Clk)
	begin
		
		if (RegWrite == 1) 
		begin
			Registers[WriteRegister] <= WriteData;
		end
	end
	
	always @(negedge Clk)
	begin
		ReadData1 <= Registers[ReadRegister1];
		ReadData2 <= Registers[ReadRegister2];
	end
	
	

endmodule
