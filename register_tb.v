module reg_tb;

reg [4:0] readregister1,readregister2,writeregister;
reg [31:0] writedata;
reg regwrite,clk;
wire [31:0] readdata1,readdata2;

RegisterFile u1 (.ReadRegister1(readregister1), .ReadRegister2(readregister2), .WriteRegister(writeregister), 
		 .WriteData(writedata), .RegWrite(regwrite), .Clk(clk), .ReadData1(readdata1), .ReadData2(readdata2));

initial begin
clk=0;
forever #10 clk = ~clk;
end

initial begin
regwrite = 0;
#5
writeregister = 5'b01011;
writedata = 32'b1000101;
#20
regwrite = 1;
readregister1 = 5'b01011;
readregister2 = 5'b01110;
#40
readregister1 = 5'b10101;
readregister2 = 5'b10110;
writeregister = 5'b10101;
writedata = 32'b0010101;
#5
regwrite = 0;
#40
readregister1 = 5'b10001;
readregister2 = 5'b00101;
writeregister = 5'b00101;
writedata = 32'b000101;
#100

#10
$finish;
end 

endmodule
