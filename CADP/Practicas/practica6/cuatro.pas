program cuatro;
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
procedure aumentarLista(var l: lista);
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
    Write(l^.num); Write('  ');
  l := l^.sig;
  end;
end;
//punto a.
function maximo(l : lista) : integer;
var
    max : integer;
begin
  max := -999;
  while(l <> Nil) do begin
    if (l^.num >= max) then
        max := l^.num;
    l := l^.sig;
  end;
  maximo := max;
end;
//punto b.
function minimo(l : lista) : integer;
var
    min : integer;
begin
    min := 9999;
    while(l <> Nil) do begin
      if(l^.num <= min) then
        min := l^.num;
      l := l^.sig;
    end;
    minimo := min;
end;
//punto c.
function multiplos(l : lista) : Integer;
var
    num, mult : integer;
begin
  Write('numero para saber multiplo:    ');ReadLn(num);
  mult := 0;
  while(l <> nil) do begin
    if( (l^.num mod num) = 0) then
      mult := mult + 1;
    l := l^.sig;
  end;
  multiplos := mult;
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
    WriteLn();
    writeln(maximo(pri));
    writeln(minimo(pri));
    writeln(multiplos(pri));
end.

{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de
elementos de la lista que son múltiplos de A.
}
