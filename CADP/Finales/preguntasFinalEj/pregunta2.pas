program pregunta2;
procedure whilee(num: integer);
begin
    while(num <> 0) do
        ReadLn(num);
    WriteLn('Pasó el while');
end;

procedure forr(num: integer);
var
    i: integer;
begin
    while(1 < num) do 
  for i := 1 to num do
    ReadLn(num);
  WriteLn('Pasó el for');
end;
var
    num: integer;
begin
  ReadLn(num);
  whilee(num);
  forr(num);
end.