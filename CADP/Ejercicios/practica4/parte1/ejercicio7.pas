program ejercicio7;
type
  vector = array[0..9] of integer;

procedure inicializarVector(var v: vector);
var i: integer;
begin for i:= 0 to 9 do v[i]:=0;end;

procedure contarDigitos(var v: vector;num: integer);
begin
  while(num <> 0) do begin
    v[num mod 10] := v[num mod 10] + 1;
    num := num div 10;
  end;
end;

procedure imprimir(v: vector);
var
  i: integer;
begin
  for i:= 0 to 9 do
    if(v[i] > 0) then WriteLn('Numero ',i,': ',v[i],' veces.');
end;

procedure maximo(v: vector);
var
  i,max: integer;
begin
  max := -1;
  for i := 0 to 9 do
    if(v[i] > max) then
      max := v[i];
  WriteLn('El digito mas leido fue el ',max);
end;


procedure imprimirNoOcurrencias(v: vector);
var
  i: integer;
begin
  WriteLn('Los digitos que no tuvieron ocurrencias son: ');
  for i := 0 to 9 do
    if(v[i] = 0) then WriteLn(i,', ');
end;

var
  v: vector;
  i,num: integer;
begin
  inicializarVector(v);
  ReadLn(num);
  while(num <> -1) do begin
    contarDigitos(v,num);
    ReadLn(num);
  end;
  imprimir(v);
  maximo(v);
  imprimirNoOcurrencias(v);
end.
{Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. La cantidad de ocurrencias de cada dígito procesado.
b. El dígito más leído.
c. Los dígitos que no tuvieron ocurrencias.
Por ejemplo: si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}