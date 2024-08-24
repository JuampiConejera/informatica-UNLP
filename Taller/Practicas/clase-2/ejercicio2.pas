program ejercicio2;
type
  lista = ^nodo;
  nodo = record
    dato: integer;
    sig: lista;
  end;

procedure agregarAdelante(var l:lista;num: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := num;
  aux^.sig := l;
  l := aux;
end;

procedure cargarLista(l: lista);
var
  num: integer;
begin
  num := random(101)+100;
  agregarAtras(l,num);
  if(num <> 100) then
    cargarLista(l);
end;

procedure imprimirListaOrden(l: lista);
begin
  if(l <> Nil) then begin
    WriteLn(l^.dato);
    imprimirLista(l^.sig);
  end;
end;

procedure imprimirListaInversa(l: lista);
begin
  if(l <> Nil) then begin
    imprimirListaInversa(l^.isg);
    WriteLn(l^.dato);
  end;
end;

procedure minimo(l: lista;var min: integer);
begin
  if(l <> Nil) then begin
    if(l^.dato > min) then 
      min := l^.dato;
    minimo(l^.sig);
  end;
end;
{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros “random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}