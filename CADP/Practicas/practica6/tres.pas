program tres;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
    nuevo, aux : lista;
begin
    new(nuevo);
    nuevo^.num := v;
    nuevo^.sig := nil;
    if (L = nil) then 
        L := nuevo
    else begin
        aux := L;
        while(aux^.sig <> nil) do
            aux := aux^.sig;
        aux^.sig := nuevo;
        end;
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

{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados, manteniendo un puntero al último ingresado.
}
{PUNTO B
procedure agregarAlFinal ( var l,ult: lista ; v: integer);
		var
			aux: lista;
		begin
			new(aux);
			aux^.num:= v;
			aux^.sig:= nil;
			if( L = nil) then
				L:= aux
			else
				ult^.sig:= aux;
			ult:= aux;
		end;}
