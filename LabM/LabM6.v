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
        if(memOut[6:0] == 7'h33)  //R type
        begin
            $display("funct7=%h rs2=%h rs1=%h funct3=%h rd=%h opcode=%h", memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        end
       
        if(memOut[6:0] == 7'h6F) // UJ Type
        begin
            $display("imm=%h rd=%h opcode=%h", memOut[31:12], memOut[11:7], memOut[6:0]);
        end

        if (memOut[6:0] == 7'h3 || memOut[6:0] == 7'h13) //I type
        begin
            $display("imm=%h rs1=%h funct3=%h rd=%h opcode=%h", memOut[31:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        end

        if (memOut[6:0] == 7'h23) //S-type
        begin
            $display("imm=%h rs1=%h funct3=%h imm4_0=%h opcode=%h", memOut[31:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        end

        if (memOut[6:0] == 7'h63) // SB type
        begin
            $display("imm12=%h rs2=%h rs1=%h funct3=%h imm4=%h opcode=%h", memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        end
        #4;
         //$display("Address %d contains %h", address, memOut); 
        address = address + 4;
    end

    $finish;
end



always
begin
		#4 clk = ~clk;
end


endmodule