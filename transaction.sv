/// transactions
class transaction;

rand bit [4:0] ReadRegister1,ReadRegister2,WriteRegister;
rand bit [31:0] WriteData;
rand bit RegWrite;
bit clk;
bit [31:0] ReadData1, ReadData2;


function void post_randomize();
$display("----------------------------");
$display("\t ReadRegister1 = %0h\t ,ReadRegister2 = %0h\t , WriteRegister = %0h",ReadRegister1,ReadRegister2,WriteRegister);
$display("\t WriteData = %0h\t , RegWrite = %0h",WriteData,RegWrite);
$display("\t ReadData1 = %0h\t , ReadData2 = %0h",ReadData1,ReadData2);
$display("----------------------------");
endfunction
endclass
