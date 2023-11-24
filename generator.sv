//// generator
`include "transaction.sv"

class generator;

transaction driv_trans;
transaction score_trans;

mailbox gen2driv;
mailbox gen2score;


function new(mailbox gen2drive , mailbox gen2score );
this.gen2driv = gen2driv;
this.gen2score = gen2score;
driv_trans = new();
score_trans = new();
count = 0 ;
endfunction

endclass
