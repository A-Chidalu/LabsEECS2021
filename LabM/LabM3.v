/*

Some Genereal Notes for myself from the lab Manual:
-We are now trying to make somehting called a "register file"
-A register file is composed of 32 registers( x0-x31) <----- Kinda like RISC-V
-A register file allows us to read any two resgisters in parallel (AT THE SAME TIME) and 
write to any one register.

-if you want to read any two registers you put there register numbers in rs1 and rs2 notice how they are 5 bits
because 2^5 has a max value of 32 but with 5 bits you can only have a max value of 2^5 - 1 = 31 (31 resgisters possible)

-If you want to STORE a 32 bit value in a register you provide the value/ number you wanna store in wd and the
specific register number in wn

-The value will only be written on the positive edge of clk and only if w=1, therefore w is an ENABLER
- register 0 is read only and its value is 0 JUST LIKE x0 in RISC-V

*/

module labM;
reg[4:0] rs1, rs2, wn;
reg[31: 0] wd;
wire[31 : 0] rd1, rd2;
reg clk, w;
integer i;

//Making/instantiating a register file 

rf #(32) myRF(rd1, rd2, rs1, rs2, wn, wd, clk, w);


initial 
begin
w = 1;
for(i = 0; i < 32; i = i + 1)
    begin   
        clk = 0; #1;
        wd = i * i; #1;
        wn = i; #1;
        clk = 1; #1;
        #1;
    end
$finish;    
end
endmodule 

