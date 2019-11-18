/*
Some General Notes from the Lab Manual:

-We are now trying to build something called the data path of the cpu
-Therefore we now need to implement a circut for instruction fetch from memory.


-Given some memory address PCin the circut goes and looks for the instruction (ins) stored at that adress
and makes it avalible.

-The circut also computes PCp4 = PCin + 4

-Once again we also have clk which tells the circut to only start fetching when clk = 1 (the positive edge of clk)
- At any other time (when clk = 0) the circut should do nothing, and its outputs remain unchanged

-TO implement this cirut we will used a register named PC. The purpose of PC is to store the memory adress
from which the instruction is to be fetched.

-The register is enabled at all times, and has clk as its clock.

-Output of PC register will go into the adress input port of our mem unit
- Due to the fact that we are only READING and NEVER WRITING we dont even need a write port on our mem
-Signals memRead and memWrite are set to 1 and 0


*/


module labM;
reg [31:0] PCin; 
reg clk;
wire [31:0] ins, PCp4;

yIF my_IF(ins, PCp4, PCin, clk); 

initial
begin
    //------------------------------------Entry point 
    PCin = 16'h28;
    //------------------------------------Run program
    repeat (11) 
    begin
        //---------------------------------Fetch an ins
        clk = 1; 
        #1;
        //---------------------------------Execute the ins
        clk = 0; 
        #1;
        //---------------------------------View results
        $display("instruction = %h", ins);
        // Add a statement to prepare for the next instruction
        PCin = PCp4;
    end
$finish;
end
endmodule


