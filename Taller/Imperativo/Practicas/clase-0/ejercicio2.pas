program ejercicio2;
type
  vector = array[1..50] of integer;
procedure CargarVector(min,max: integer;var v: vector; var pos: integer);
var
  num: integer;
begin
  pos := 1;
  num := random(max - min + 1) + min;
  while((num <> 0) and (pos <= 49)) do begin
    v[pos] := num;
    pos += 1;
    num := Random(max - min + 1) + min;
  end;
end;

procedure imprimirVector(v: vector;pos: integer);
var
  i: integer;
begin
  for i := 1 to pos do
    WriteLn(v[i]);
end;

var
  min, max, pos: integer;
  v: vector;
begin
  Write('Ingrese el mínimo del rango: ');ReadLn(min);
  Write('Ingrese el máximo del rango: ');ReadLn(max);
  CargarVector(min,max,v,pos);
  imprimirVector(v, pos)
end.
{a) Implemente un módulo CargarVector que cree un vector de enteros
con a lo sumo 50 valores aleatorios. Los valores, generados
aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
deben ser almacenados en el vector en el mismo orden que se
generaron, hasta que se genere el cero.
b) Implemente un módulo ImprimirVector que reciba el vector generago
en a) e imprima todos los valores del vector en el mismo orden que
están almacenados. Qué cambiaría para imprimir en orden inverso?
c) Escriba el cuerpo principal que invoque a los módulos ya
implementados.}