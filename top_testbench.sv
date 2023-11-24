// top testbench
`include "interface.sv"
module top();
bit [4:0] ReadRegister1, ReadRegister2, WriteRegister;
  bit [31:0] WriteData;
  bit RegWrite;
  bit [31:0] ReadData1, ReadData2;
  bit reset;

bit clk=0;
initial
forever #5 clk = ~clk;
intf_reg intf(clk,reset);

 RegisterFile DUT (.ReadRegister1(ReadRegister1),
                   .ReadRegister2(ReadRegister2),
                   .WriteRegister(WriteRegister),
                   .WriteData(WriteData),
                   .RegWrite(RegWrite),
                   .clk(clk),
                   .ReadData1(ReadData1),
                   .ReadData2(ReadData2),
                   .reset(reset)
 );
endmodule
