module labK;
reg a, b; // reg without size means 1-bit
wire tmp, z;

not my_not(tmp, b);
and my_and(z, a, tmp);

initial
begin
    a = 1; b = 1;
    $display("a=%b b=%b z=%b", a, b, z);
    $finish;
end

endmodule 