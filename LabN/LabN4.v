module labN;
reg [31:0] entryPoint;
reg clk, INT;
wire [31:0] ins, rd2, wb;
yChip myChip(ins, rd2, wb, entryPoint, INT, clk);
initial
begin
entryPoint = 128; INT = 1; #1;
repeat (43)
begin
clk = 1; #1; INT = 0;
clk = 0; #1;
$display("%h: rd2=%2d wb=%2d", ins, rd2, wb);
end
$finish;
end
endmodule