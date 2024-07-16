program nueve;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L,ult: lista; v: integer);
var
    aux: lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    if (L = nil) then
		L:= aux
	else
		ult^.sig:= aux;
	ult:= aux;
end;
procedure imprimirLista(l : lista);
begin
  while(l <> Nil) do begin
    Write(l^.num,'  ');
  l := l^.sig;
  end;
end;
//PUNTO A
function EstaOrdenada(l : lista) : boolean;
var
    aux : lista;
begin
	EstaOrdenada:= true;
	aux := l^.sig;
    while(aux <> Nil)do begin
		if ( l^.num > aux^.num) then
			EstaOrdenada:= false;
		l:= l^.sig;
		aux:= aux^.sig;  
    end;
end;
//PUNTO B
procedure eliminar (var l:lista; n:integer);
	var
		actual,ant: lista;
	begin
		actual:= l;
		while (actual <> nil) and (actual^.num <> n) do begin
			ant:= actual;
			actual:= actual^.sig;
		end;
		if (actual <> nil) then begin
			if(actual = l) then
				l:= l^.sig
			else
				ant^.sig:= actual^.sig;
		end;
		dispose(actual);
	end;
//PUNTO C
procedure sublista (var l,aux:lista; A,B: integer);
	var
		nue: lista;
	begin
		while (l <> nil) do begin
			if (l^.num > A) and (l^.num < B) then begin
				new(nue);
				nue^.num:= l^.num;
				nue^.sig:= l;
				aux:= nue;
			end;
			l:= l^.sig;
		end;	
	end;
	

var
    pri,ult : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero: ');
    readln(valor);
while (valor <> 0) do begin
    armarNodo(pri, ult, valor);
    writeln('Ingrese un numero: ');
    readln(valor);
end;
    WriteLn('¿Está ordenada?	', EstaOrdenada(pri));
	imprimirLista(ult);
end.
{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si
existe). Nota: la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista
con todos los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera descendente.
}