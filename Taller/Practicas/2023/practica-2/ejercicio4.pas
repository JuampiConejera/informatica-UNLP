program ejercicio4;
const
  dimF = 20;
type
  vector = array[1..dimF] of integer;
procedure cargarVector(var v: vector; var dimL: integer);
var
  num: integer;
begin
  num := Random(100);
  if(dimL <= dimF) then begin
    v[dimL] := num;
    dimL := dimL + 1;
    cargarVector(v,dimL);
  end;
end;

procedure maximo(v: vector;dimL: integer; var max: integer; pos: integer);
begin
  if(pos <= dimL) then begin
    if(v[pos] > max) then
      max := v[pos];
    maximo(v,dimL,max,(pos+1));
  end;
end;
procedure minimo(v: vector;dimL: integer;var min: integer;pos: integer);
begin
  if(pos <= dimL) then begin
    if(v[pos] < min) then
      min := v[pos];
    minimo(v,dimL,min,pos + 1)
  end;
end;

function sumaVector(v: vector;dimL,pos: integer) : integer;
begin
  if(pos <= dimL) then
    sumaVector := sumaVector(v,dimL,pos+1) + v[pos]
  else
    sumaVector := v[pos];
end;

var
  v: vector;
  dimL,min,max,pos : integer;
begin
  randomize;
  dimL := 0;
  cargarVector(v,dimL);
  pos := 1;
  max:= -1;
  maximo(v,dimL,max,pos);
  min := 100;
  minimo(v,dimL,min,pos);
  WriteLn(max);
  WriteLn(min);
  WriteLn;
  WriteLn(sumaVector(v,dimL,pos));
end.
{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}