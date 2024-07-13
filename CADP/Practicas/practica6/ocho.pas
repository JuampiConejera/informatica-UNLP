program ocho;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var l: lista; v: integer);
var
    actual, anterior, nuevo : lista;
begin
    new(nuevo);
    nuevo^.num := v;
    actual := l;
    anterior := l;
    while (actual <> Nil) and (actual^.num < nuevo^.num) do begin
        anterior := actual;
        actual := actual^.sig;
    end;
    if (actual = anterior) then 
        l := nuevo
    else
        anterior^.sig := nuevo;
    nuevo^.sig := actual;
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

{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la
lista queden ordenados de manera ascendente (insertar ordenado).}
