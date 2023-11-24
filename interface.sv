///interface

interface intf_reg(input logic clk , reset );

logic [4:0] ReadRegister1,ReadRegister2,WriteRegister;
logic [31:0] WriteData;
logic RegWrite;
logic [31:0] ReadData1,ReadData2;

clocking driver_cb@(posedge clk);
default input #1 output #1;
output ReadRegister1;
output ReadRegister2;
output WriteRegister;
output WriteData;
output RegWrite;
input ReadData1;
input ReadData2;
endclocking


clocking monitor_cb@(posedge clk);
default input #1 output #1;
input ReadRegister1;
input ReadRegister2;
input WriteRegister;
input WriteData;
input RegWrite;
input ReadData1;
input ReadData2;
endclocking

modport DRIVER (clocking driver_cb,input clk,reset);
modport MONITOR (clocking monitor_cb,input clk,reset);

endinterface
