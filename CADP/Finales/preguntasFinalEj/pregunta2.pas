program pregunta2;
procedure calcular(var total: longInt;var dig3: longInt;var dig1: LongInt; dig2: LongInt);
begin
  total := dig1 + (dig2 mod 3);
  dig3 := dig3 + (total div 2);
end;
var
    dni,dig1,dig2,dig3, total : longInt;
begin
  ReadLn(dni);
  dig1 := dni mod 10;
  dig2 := dni mod 100;
  dig3 := dni mod 1000;
  total := 0;
  calcular(total,dig1,dig2,dig3);
  writeln('Total = ',total);
  writeln('dig1 = ',dig1);
  writeln('dig2 = ',dig2);
  writeln('dig3 = ',dig3);
end.