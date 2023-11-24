///driver
`include "transaction.sv"

`define DRIV_IF intf_reg.DRIVER.driver_cb;

class driver;

int no_transactions;
virtual intf_reg reg_vif;
mailbox gen2driv;

function new(virtual intf_reg reg_vif, mailbox gen2driv);
this. reg_vif = reg_vif;
this.gen2driv = gen2driv;
endfunction

task reset;
$display("resetting");
wait(vif_reg.reset);
DRIV_IF.ReadRegister1 <= 0;
DRIV_IF.ReadRegister2 <= 0;
DRIV_IF.WriteRegister <= 0;
DRIV_IF.RegWrite <= 0;
DRIV_IF.WriteData <= 0;
wait(!vif_reg.reset);
$display("resetting done");
endtask


task drive;
forever begin
transaction trans;
DRIV_IF.RegWrite <= 0;
gen2driv.get(trans);
  $display("no: of transactions = ",no_transactions);
@(posedge DRIV_IF.clk);
if(trans.RegWrite)begin
DRIV_IF.RegWrite <= trans.RegWrite;
DRIV_IF.ReadRegister1 <= trans.ReadRegister1;
DRIV_IF.ReadRegister2 <= trans.ReadRegister2;
DRIV_IF.WriteData <= trans.WriteData;
trans.ReadData1 = DRIV_IF.ReadData1;
trans.ReadData2 = DRIV_IF.ReadData2;
display("\t RegWrite = %0h \t ReadRegister1 = %0h \t ReadRegister2 = %0h \t WriteData = %0h",trans.RegWrite,trans.ReadRegister1,trans.ReadRegister1,trans.WriteData );
end


if (trans.RegWrite)begin
DRIV_IF.RegWrite <= trans.RegWrite;
@(posedge DRIV_IF.c1k);
DRIV_IF.RegWrite <= O;
@(posedge DRIV_1F.c1k);
trans.ReadData <= DRIV_IF.ReadData;
trans.ReadData1 <= DRIV_IF.ReadData1;
trans.ReadData2 <= DRIV_IF.ReadData2;
display("\t RegWrite = %0h \t ReadData1 = %0h \t ReadData2 = %0h",trans.RegWrite,trans.ReadData1,trans.ReadData2 );
end
no_transactions++;
end
endtask


task main;
forever begin
fork
begin
  wait(reg_vif.reset);
end
begin
drive();
end
join_any
disable fork;
end
endtask

endclass
