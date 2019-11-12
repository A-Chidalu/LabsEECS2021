module labL;
reg signed [31:0] a, b;
reg [31:0] expect;
reg [2:0] op;
wire zero;
wire [31:0] z, temp;
reg ok, flag, tmp;
integer i;

yAlu mine(z, ex, a, b, op);

initial
begin
    repeat(10)
    begin
        #10 a = $random;
        b = $random;
        tmp = $random % 2;
        if (tmp == 0) b = a;
        op = 3'b111;
        ok = 0;
        #10;
        if(op === 0) 
            begin
            expect = a & b;
            zero = (expect == 0) ? 1 : 0;
            end
        else if(op === 1)
            begin
            expect = a | b;
            zero = (expect == 0) ? 1 : 0;
            end
        else if(op === 2)
            begin
            expect = a + b;
            zero = (expect == 0) ? 1 : 0;
            end
        else if (op == 3'b111)
            begin
            expect = (a < b) ? 1 : 0;
            zero = (expect == 0) ? 1 : 0;
            end
        else if(op === 6)
            begin
            expect = a + (~b) + 1;
            zero = (expect == 0) ? 1 : 0;
            end
        else 
            begin
            $display("Lol wut. How did we even end up here");
            zero = (expect == 0) ? 1 : 0;
            #1;
            end

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