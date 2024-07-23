program ejercicio6;
const
  dimF = 100;
type
  rangoDimF = 1..dimF;
  vector = array[rangoDimF] of integer;
procedure inicializarVector(var v: vector;var dimL: integer);
var
  num: integer;
begin
  ReadLn(num);
  while(num <> 0) and (dimL <= 100) do begin
    v[dimL] := num;
    dimL := dimL + 1;
    ReadLn(num);
  end;
end;

procedure maximoYminimo(v: vector;var max,posMax,min,posMin: integer);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    if(v[i] > max) then begin
      max := v[i];
      posMax := i;
    end;
    if(v[i] < min) then begin
      min := v[i];
      posMin := i;
    end;
  end;
end;


procedure procesarVector(var v: vector;dimL: integer);
var
  max,min,posMax,posMin: integer;
begin
  max:=-1;
  posMax := 0;
  min:=9999;
  posMin := 0;
  maximoYminimo(v,max,posMax,min,posMin);
  WriteLn('El elemento máximo ', max,' que se encontraba en la posición ', posMax, ' fue intercambiado con el elemento minimo ', min, ' que se encontraba en la posición ',posMin);
end;
var
  v: vector;
  dimL: integer;
begin
  dimL := 0;
  inicializarVector(v,dimL);
  procesarVector(v,dimL)
end.
{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo
y otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva
ambas posiciones.}