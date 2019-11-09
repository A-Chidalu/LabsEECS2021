module LabL5;
reg a, b, cin;
wire z, cout;
integer i, j, k;

yAdder1 M(z, cout , a, b, cIN);

initial 
begin
    for(i = 0; i < 2; i = i + 1)
        begin
            for(j = 0; j < 2; j = j + 1)
                begin
                    for(k = 0; k < 2; k  k + 1)
                        begin
                            a = i; b = j; c = k;
                            #1;
                            $display("a=%b b=%b cin=%b z=%b", a, b, cin, z);
                        end
                end
        end
$finish;
end
endmodule