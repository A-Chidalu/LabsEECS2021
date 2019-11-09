module LabL4;

parameter SIZE = 32;
reg[SIZE - 1: 0] a0, a1, a2, a3;
reg[1 : 0] c;
wire [SIZE - 1: 0] z;




yMux4to1 #(32) M(z, a0, a1, a2, a3, c);


initial 
begin
    repeat(100)
    begin
        a0 = $random;
        a1 = $random;
        a2 = $random;
        a3 = $random;
        c = $random % 4;
        #6;
        if(c === 0 && z === a0)
        $display("PASS: a0=%b a1=%b a2=%b a3=%b z=%b c=%b", a0, a1, a2, a3, z, c);
        else if(c === 1 && z === a1)
        $display("PASS: a0=%b a1=%b a2=%b a3=%b z=%b c=%b", a0, a1, a2, a3, z, c);
        else if(c === 2 && z === a2)
        $display("PASS: a0=%b a1=%b a2=%b a3=%b z=%b c=%b", a0, a1, a2, a3, z, c);
        else if(c === 3 && z === a3)
        $display("PASS: a0=%b a1=%b a2=%b a3=%b z=%b c=%b", a0, a1, a2, a3, z, c);
        else
        $display("FAIL: a0=%b a1=%b a2=%b a3=%b z=%b c=%b", a0, a1, a2, a3, z, c);

        //WORKS AS EXPECTED, ALL TESTS PASS
    end
$finish;
end
endmodule