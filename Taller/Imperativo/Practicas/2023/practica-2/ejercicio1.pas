program ejercicio1;
const
  dimF = 10;
type
  vector = array[1..dimF] of String;
  lista = ^nodo;
  nodo = record
    dato : Char;
    sig : lista;
  end;

procedure cargarVector(var v: vector; var dimL: integer);
var
  car: char;
begin
  Write('Caracter para vector: ');ReadLn(car);
  if((car <> '.') and (dimL <= dimF)) then begin
    dimL := dimL + 1;
    v[dimL] := car;
    cargarVector(v,dimL);
  end;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
  i : integer;
begin
  for i := 1 to dimL do
    WriteLn(v[i]);
end;

procedure imprimirRecursivamente(v: vector; dimL,pos: integer);
begin
  if(pos <= dimL) then begin
    WriteLn(v[pos]);
    imprimirRecursivamente(v,dimL,(pos+1));
  end;
end;

function contarCaracteres() : integer;
var
  car: Char;
begin
  Write('Caracter para contar: ');ReadLn(car);
  if(car <> '.') then
    contarCaracteres := contarCaracteres() + 1
  else
    contarCaracteres := 0;
end;

procedure agregarAtras(var l: lista; c: Char);
var
  nuevo, aux : lista;
begin
  New(nuevo);
  nuevo^.dato := c;
  nuevo^.sig := Nil;
  if(l = Nil) then
    l := nuevo
  else begin
    aux := l;
    while(aux^.sig <> Nil) do
      aux := aux^.sig;
    aux^.sig := nuevo;
  end;
end;

procedure cargarLista(var l: lista);
var
  c: Char;
begin
    write('Caracter para lista: ');ReadLn(c);
    agregarAtras(l,c);
  if(c <> '.') then
    cargarLista(l);
end;

procedure imprimirLista(l: lista);
begin
  if(l <> Nil) then begin
    WriteLn(l^.dato);
    imprimirLista(l^.sig);
  end;
end;

procedure imprimirListaInversa(l: lista);
begin
  if(l <> Nil) then begin
    imprimirListaInversa(l^.sig);
    WriteLn(l^.dato);
  end;
end;

var
  v: vector;
  dimL, pos: integer;
  l: lista;
begin
  dimL := 0;
  cargarVector(v,dimL);
  imprimirVector(v, dimL);
  pos := 0;
  imprimirRecursivamente(v,dimL,pos);
  WriteLn(contarCaracteres());
  l := Nil;
  cargarLista(l);
  imprimirLista(l);
  imprimirListaInversa(l);
end.
{1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.}