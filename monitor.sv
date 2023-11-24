//monitor

`include "transaction.sv"
`define MONITOR_IF intf_reg.MONITOR.monitor_cb;

class monitor;
virtual intf_reg vif_reg;
mailbox mon2scb;

function new(virtual intf_reg vif_reg , mailbox mon2scb);
this.vif_reg = vif_reg;
this.mon2scb = mon2scb;
endfunction


task main;
forever begin
transaction trans;
trans = new();
@(posedge MONITOR_IF.clk);
wait(MONITOR_IF.RegWrite);
if(MONITOR_IF.RegWrite) begin
trans.RegWrite = MONITOR_IF.RegWrite;
trans.ReadRegister1 = MONITOR_IF.ReadRegister1;
trans.ReadRegister2 = MONITOR_IF.ReadRegister2;
trans.ReadData1 = MONITOR_IF.ReadData1;
trans.ReadData2 = MONITOR_IF.ReadData2;
$display("\t RegWrite = %0h \t ReadRegister1 = %0h \t ReadRegister2 = %0h \t WriteData = %0h",trans.RegWrite,trans.ReadRegister1,trans.ReadRegister1,trans.WriteData );
end
@(posedge MONITOR_IF.clk);

if(MONITOR_IF.WriteData)begin
trans.WriteData = MONITOR_IF.WriteData;

@(posedge clk)begin
trans.ReadData1 = MONITOR_IF.ReadData1;
trans.ReadData2 = MONITOR_IF.ReadData2;
$display("\t RegWrite = %0h \t ReadRegister1 = %0h \t ReadRegister2 = %0h \t WriteData = %0h",trans.RegWrite,trans.ReadRegister1,trans.ReadRegister1,trans.WriteData );
end

mon2scb.put(trans);
end
end
endtask
endclass
