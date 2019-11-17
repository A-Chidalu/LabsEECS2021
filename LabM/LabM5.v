/*

Some General Notes for Myself for LabM5:

-the **mem** sequential compoenent has feature that allows us to initialize memory from a text file named ram.dat

-when mem componenet is first instantiated it looks in the current folder for the RAM.DAT file
-if the RAM.DAT file exists, it reads the content of Ram.DAT to initialize the memory words.

-Each record in ram.dat holds an adress, and content/value pair
    THAT LOOKS SOMETHING LIKE :@a c // optional comment

-adress MUST be prefixed with @ and followed by the content c.
-Both values MUST be in Hex and are seperated by whitespace.

-OUR MAIN GOAL IS TO SIMULATE A PROGRAM THAT LOOKS SOMETHING LIKE THIS:
ARRAY:
DW 1, 3, 5, 7, 9, 11, 0
SUM-ORRED:
DW 0, 0
START:
add t5, x0, x0 # index
add s0, x0, x0 # sum
add a0, x0, x0 # or reduction
LOOP:
lw t0, 0(t5) # loop: t0 = array[t5]
beq t0, x0, DONE # if (t0 == 0) done
add s0, s0, t0
or a0, a0, t0
addi t5, t5, 4 # t5++
jal x0, LOOP
DONE:
sw s0, 0x20(x0) # done: save s0
sw a0, 0x24(x0) # save a0







*/



module labM;
reg clk, read, write;
reg [31:0] address, memIn; 
wire [31:0] memOut;

mem data(memOut, address, memIn, clk, read, write); 

initial
begin
    address = 16'h28; write = 0; read = 1;
    repeat (11)
    begin
        #4 $display("Address %d contains %h", address, memOut); 
        address = address + 4;
    end

    $finish;
end



always
begin
		#4 clk = ~clk;
end


endmodule