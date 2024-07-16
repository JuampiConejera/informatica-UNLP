program uno;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;
procedure aumentarLista(l: lista);
var
    aux : lista;
    n : integer;
begin
    aux := l;
    Write('ingresar valor a aumentar:   '); ReadLn(n);
    while(aux <> Nil) do begin
        aux^.num := aux^.num + n;
        aux := aux^.sig
    end;
end;
procedure imprimirLista(l : lista);
begin
  while(l <> Nil) do begin
    Write(l^.num,'  ');
  l := l^.sig;
  end;
end;


var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('‘Ingrese un numero’');
    readln(valor);
while (valor <> 0) do begin
    armarNodo(pri, valor);
    writeln('‘Ingrese un numero’');
    readln(valor);
end;
    imprimirLista(pri);
    aumentarLista(pri);
    imprimirLista(pri);
end.

{a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la
lista.}
//a. el programa agrega un nodo adelante de la lista hasta que valor sea 0 y luego la imprime.
//b. 48 > 13 > 21 > 10.
