program ejercicio4;
type
  lista = ^nodo;
  nodo = record
    dato: integer;
    sig: lista;
  end;

procedure insertarOrdenado(var l: lista; n: integer);
var
  actual, anterior, nuevo: lista;
begin
  New(nuevo);
  nuevo^.dato := n;
  actual := l;
  anterior := l;
  while((actual <> Nil) and (n > actual^.dato)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = anterior) then
    l := nuevo
  else
    anterior^.sig := nuevo;
  nuevo^.sig := actual;
end;

procedure cargarListaOrdenada(var l: lista);
var
  num: integer;
begin
  num := Random(51) + 100;
  while(num <> 120) do begin
    insertarOrdenado(l,num);
    num := Random(51) + 100;
  end;
end;

procedure imprimirLista(l: lista);
begin
  while(l <> Nil) do begin
    WriteLn(l^.dato);
    l := l^.sig;
  end;
end;

function BuscarElementoOrdenado(l: lista; num: integer) : Boolean;
var
  aux: lista;
begin
  BuscarElementoOrdenado := false;
  aux := l;
  while((aux <> Nil) and (aux^.dato < num)) do
    aux := aux^.sig;
  if(aux <> Nil) and (aux^.dato = num) then
    BuscarElementoOrdenado := True;
end;

var
  l: lista;
  numBuscar: integer;
begin
  Randomize;
  l := Nil;
  cargarListaOrdenada(l);
  WriteLn('pasa');
  imprimirLista(l);
  Write('Numero a buscar: '); readln(numBuscar);
  writeln(BuscarElementoOrdenado(l,numBuscar));
end.
