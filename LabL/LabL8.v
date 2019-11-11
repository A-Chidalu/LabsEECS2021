module LabL;

reg signed[31: 0] a, b, expect;
wire signed[31: 0] z;
wire cout;
reg ctrl, cin;

yArith test(z, cout, a, b, ctrl);

initial
begin
repeat(10)
    begin
        a = $random;
        b = $random;
        ctrl = $random % 2;
        #1;
        if(ctrl === 1) 
        expect = a + (~b) + 1;
        else
        expect = a + b;

        if(z === expect && ctrl === 1) 
        $display("PASS: a=%b b=%b ctrl=%b z=%b expect=%b", a, b, ctrl, z, expect);
        else if(z === expect && ctrl === 0) 
        $display("PASS: a=%b b=%b ctrl=%b z=%b expect=%b", a, b, ctrl, z, expect);
        else
        $display("FAIL: a=%b b=%b ctrl=%b z=%b expect=%b", a, b, ctrl, z, expect);
    end
$finish;
end

endmodule