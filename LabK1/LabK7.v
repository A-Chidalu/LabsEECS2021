module labK;
reg a, b, c, flag;
wire z, notOutput, lowerInput, and1, and2, orFinal;
integer i, j, k;

not my_not(notOutput, c);
assign lowerInput = notOutput;

and(and1, lowerInput, a);
and(and2, b, c);

or(orFinal, and1, and2);
assign z = orFinal;

initial 
begin
     flag = $value$plusargs("a=%b", a);
     if (flag == 0)
     $display("There was no value specified for A", $time);
     flag = $value$plusargs("b=%b", b);
     flag = $value$plusargs("c=%b", c);
     #1;
     $display("a=%b b=%b c=%b z=%b", a, b, c, z);

 $finish;
end  

endmodule


