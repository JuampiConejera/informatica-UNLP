program sumador;
 type
 vnums = array [1..10] of integer;
var
numeros : vnums;
i : integer;
 begin
for i:=1 to 10 do {primer bloque for}
numeros[i] := i;

for i:=1 to 9 do {segundo bloque for}
numeros[i+1] := numeros[i];
WriteLn(numeros[1]);
WriteLn(numeros[2]);
WriteLn(numeros[3]);
WriteLn(numeros[4]);
WriteLn(numeros[5]);
WriteLn(numeros[6]);
WriteLn(numeros[7]);
WriteLn(numeros[8]);
WriteLn(numeros[9]);
WriteLn(numeros[10]);

end.
