program ejercicio3;
type
  lista = ^nodo;
  nodo = record
    dato : integer;
    sig : lista;
  end;

procedure agregarAdelante(var l: lista;num : integer);
var
  aux: lista;
begin
  New(aux);
  aux^.dato := num;
  aux^.sig := l;
  l := aux;
end;

procedure cargarLista(var l: lista);
var
  num: integer;
begin
  num := random(100);
  if(num <> 0) then begin
    agregarAdelante(l,num);
    cargarLista(l^.sig);
  end;
end;

procedure imprimir(l: lista);
begin
  while(l <> Nil) do begin
    Writeln(l^.dato);
    l := l^.sig;
  end;
end;

procedure minimo(l: lista; var min: integer);
begin
  if(l <> Nil) then begin
    if(l^.dato < min) then
      min := l^.dato;
    minimo(l^.sig,min);
  end;
end;

procedure maximo(l: lista;var max: integer);
begin
  if(l <> Nil) then begin
    if(l^.dato > max) then
      max := l^.dato;
    maximo(l^.sig,max); 
  end;
end;

function buscar(l: lista;num: integer) : Boolean;
begin
  buscar := false;
  if(l <> Nil) then begin
    if(l^.dato = num) then
      buscar := true
    else
      buscar := buscar(l^.sig,num);
  end;
end;

var
  l: lista;
  max,min: integer;
begin
  l := Nil;
  cargarLista(l);
  WriteLn;
  WriteLn;
  imprimir(l);
  WriteLn;
  WriteLn;

  min := 101;
  minimo(l,min);
  max := 0;
  maximo(l,max);
  WriteLn(min);
  WriteLn(max);
  WriteLn(buscar(l,3));
end.
{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.}