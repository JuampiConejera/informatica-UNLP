program ejercicio;
type
  vector=array[1..10] of integer;
function maximoPar(v:vector):integer;
var
  i, max,posmax:integer;
begin
  posmax:=1;
  for i:=1 to 10 do begin
    if ((v[i] mod 2) = 0) and (v[i] > v[posmax]) then
begin
        posmax:=i;
      end;
  end;
  maximoPar:=v[posmax];
end;
begin
  z := 'b';
  d:= 1;
  if (v1[z] > 'd') then
        v2 := v1;
end.