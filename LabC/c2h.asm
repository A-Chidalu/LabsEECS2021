fc1: DF -2.0
fc2: DF 3.0
fld f1, fc1(x0) ;loading -2.0 into f1
fld f2, fc2(x0) ;loading 3.0 into f2
fsgnj.d f3, f1, f1 ;f3=f1 
fsgnjn.d f4, f1, f1 ;f3=-f1
fsgnjx.d f5, f1, f1 ;f3=abs(f1)