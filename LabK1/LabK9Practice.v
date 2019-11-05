module labK;
reg a, b, cin;
reg[1:0] expect;
integer i, j, k, flag;
wire lowerAND, upperAND, leftXOR, rightXOR, cOUT, z;

xor(leftXOR, b, a);
and(lowerAND, b, a);
xor(z, leftXOR, cin);
and(upperAND, cin, leftXOR);
or(cOUT, upperAND, lowerAND);


initial
begin
    for(i = 0; i < 3; i = i + 1)
        begin
            for(j = 0; j < 3; j = j + 1)
                begin
                    for(k = 0; k < 3; k = k + 1)
                        begin
                            flag = $value$plusargs("a=%b", a);
                            flag = $value$plusargs("b=%b", b);
                            flag = $value$plusargs("cin=%b", cin);
                            expect = a + b + cin;
                            #1; 
                            if(expect[0] === z && expect[1] === cOUT)
                            $display("PASS: a=%b b=%b cin=%b z=%b cOUT=%b", a, b, cin, z, cOUT);
                            else
                            $display("FAIL:");
                        end
                end
        end
$finish;
end
















endmodule