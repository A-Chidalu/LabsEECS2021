module labL;
reg signed [31:0] a, b;
reg [31:0] expect;
reg[31:0] ZERO;
reg [2:0] op;
wire ex;
wire [31:0] z, temp;
reg ok, flag;
integer i;

yAlu mine(z, ex, a, b, op);

initial
begin
    for(i = 0; i < 10; i = i + 1)
    begin
        a = $random;
        b = $random;
        op = 3'b111;
        ok = 0;
        if(op === 0) 
            expect = a & b;
        else if(op === 1)
            expect = a | b;
        else if(op === 2)
            expect = a + b;
        else if (op == 3'b111)
            expect = (a < b) ? 1 : 0;
        else if(op === 6)
            expect = a + (~b) + 1;
        else 
            $display("Lol wut. How did we even end up here");
            #1;

        // Compare the circuit's output with "expect"
        if(expect === z)
        ok = 1;
        if(ok === 1) 
        $display("PASS: a=%b b=%b expect=%b z=%b ok=%b op=%b", a, b, expect, z, ok, op);
        else
        $display("FAIL: a=%b b=%b expect=%b z=%b ok=%b op=%b", a, b, expect, z, ok, op);
        // and set "ok" accordingly

        // Display ok and the various signals

        $finish;
    end
end
endmodule