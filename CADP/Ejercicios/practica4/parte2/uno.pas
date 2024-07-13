program uno;
{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}
const
    dimF = 500;
type
    vector = array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
var
    i : integer;
begin
    dimL := 0;
    for i := 1 to dimF do begin
      v[i] := random(500);
      dimL := dimL+1;
    end;
end;
function comprobarN(v:vector; n, dimL : integer) : boolean;
var
    i : integer;
begin
  comprobarN := false;
  i := 1;
  while( (i <= dimL) and (not comprobarN)) do begin
    if (v[i] = n) then
      comprobarN := true
    else
      i := i + 1;
    end;
end;


 //PUNTO B//
function dicotomica (v: vector; dimL, n : integer) : boolean;
var
  first, last, mid : integer;
begin
  first := 1; 
  last := dimL;
  mid := (first + last) div 2;
  while( (first <= last) and (n <> v[mid])) do begin
    if (n < v[mid]) then
      last := mid - 1
    else
      first := mid + 1;
    mid := (first + last) div 2;
  end;
  if ( (first <= last) and (n = v[mid])) then
    dicotomica := true;
end;

//programa principal
var
    dimL, n: integer;
    v : vector;
begin
    cargarVector(v,dimL);
    WriteLn('Escribir N');
    readln(n);
    writeln(comprobarN(v,n,dimL));
end.
