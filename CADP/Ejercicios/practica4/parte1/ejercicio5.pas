program ejercicio5;
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

procedure maximo(v: vector;var max,pos: integer);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    if(v[i] > max) then begin
      max := v[i];
      pos := i;
    end;
  end;
end;

procedure minimo(v: vector;var min,pos: integer);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    if(v[i] < min) then begin
      min := v[i];
      pos := i;
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
  maximo(v,max,posMax);
  minimo(v,min,posMin);
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
{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al
finalizar la carga, se debe intercambiar la dimLición del mayor elemento por la del menor elemento, e
informe la operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la
dimLición ... fue intercambiado con el elemento mínimo ... que se encontraba en la dimLición ...”.}