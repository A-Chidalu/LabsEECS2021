/*

Some General Notes for myself from the lab Manual:

-The last sequential componenet is somehting called mem and it stimulates memory
-this component is made up of many 32 bit works

TO READ/RETRIEVE a word:
1) Pass the adress of the word to "adress"
2) turn "memRead" to 1
3) After some delay the words content will be put inside memOut

TO WRITE/PASS - IN a word:
1) Set the value of the word you would like to pass in, into memIn
2) set the destination/location in memory of where you would like that word to be stored in "address"
3) turn on memWrite ---> set it equal to 1
4) wait for clk to rise to 1 and the data will be written to the adress you have selected

*/

module labM;
reg [31 : 0] address, memIn;
reg clk, memRead, memWrite;
wire [31: 0] memOut;

mem data(memOut, address, memIn, clk, memRead, memWrite); //MAKE SURE THESE NAMES MATCH YOUR REGISTER

initial 
begin

    memWrite = 1; memRead = 0; address = 16; 
    clk = 0;
    memIn = 32'h12345678;
    #4 memRead = 1;
    #1 $display("Address %d contains %h", address, memOut); 
    address = address + 4; 
    #4 memRead = 0;
    memIn = 32'h89abcdef;
    #4 memRead = 1;
    #1 $display("Address %d contains %h", address, memOut); 
    #4;
 
    memWrite = 0; memRead = 1; address = 16;
    
    repeat (3) 
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

