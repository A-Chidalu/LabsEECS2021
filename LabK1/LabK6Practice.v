module labk;
reg a,b,c;
integer i, j, k, expect;

wire tmp, and1, and2, z, lowerAND, upperAND;
not(tmp,c);
and(and1, tmp, a);

assign upperAND = and1;

and(and2, b, c);

assign lowerAND = and2;

or(z, upperAND, lowerAND);



initial
begin
    for(i = 0; i < 3; i = i + 1)
    begin
       for(j = 0; j < 3; j = j + 1)
       begin
            for(k = 0; k < 3; k = k + 1)
            begin
                a = i; b = j; c = k;
                expect = (a & ~c) | (b & c);
                #1; //Give program time to process z
                if(expect == z)
                $display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);
                else
                $display("FAIL:");
            end
        end
    end



        


$finish;
end











endmodule