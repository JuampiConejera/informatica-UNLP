program ejercicio1c;
var
  N, A, B, i, ale: integer;
begin
  ReadLn(N);ReadLn(A);ReadLn(B);
  Randomize;
  for i := 1 to N do begin
    ale := Random(B-A) + A;
    WriteLn('El número aleatorio generado es: ',ale);
  end;
end.