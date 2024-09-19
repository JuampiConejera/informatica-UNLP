program ejercicio1b;
var
  ale, i: integer;
begin
  Randomize;
  for i := 1 to 20 do begin
    ale := Random(100);
    WriteLn('El número aleatorio generado es: ', ale);
  end;
end.