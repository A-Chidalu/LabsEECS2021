module labK;
reg a, b, cIN, flag;
reg [1:0] expect;
integer i, j, k;
wire xOR1, xOR2, and1, and2, OR1, z, cOUT;

xor(xOR1, b, a);

and(and1, b, a);
and(and2, cIN, xOR1);

xor(xOR2, cIN, xOR1);
assign z = xOR2;

or(cOUT, and2, and1);


//QUESTION 50-51
initial
begin
    for(i = 0; i < 3; i = i + 1)
    begin   
        for(j = 0; j < 3; j = j + 1)
        begin
            for(k = 0; k < 3; k = k + 1)
            begin   
                a = i; b = j; cIN = k;
                expect = a + b + cIN;
                #1; //Wait for z
                if(expect[0] === z && expect[1] === cOUT)
                $display("PASS: a=%b b=%b cIN=%b, z=%b, cOUT=%b", a, b, cIN, z, cOUT);
                else
                $display("FAIL");
            end
        end
    end


#1 $finish;
end
//endmodule is BELOW 






/*
//THIS IS FOR QUESTION 47-50
initial
begin
     flag = $value$plusargs("a=%b", a);
     flag = $value$plusargs("b=%b", b);
     flag = $value$plusargs("cIN=%b", cIN);
     #1;
     $display("a=%b b=%b cIN=%b z=%b cOUT=%b", a, b, cIN, z, cOUT);
     
#1 $finish;
end
*/


endmodule


