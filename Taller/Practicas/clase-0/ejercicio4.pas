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
  while(l <> Nil) and (n < actual^.dato) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = anterior) then
    l := nuevo
  else
    anterior^.sig := nuevo;
  nuevo^.sig := actual;
end;

procedure cargarListaOrdenada(l: lista);
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
  Write('Numero a buscar: ', numBuscar);
  BuscarElementoOrdenado(l,numBuscar);
end.
{ACTIVIDAD 4: Crear un archivo ProgramaListasOrdenadas.pas
a) Implemente un módulo CargarListaOrdenada que cree una lista de
enteros y le agregue valores aleatorios entre el 100 y 150, hasta que se
genere el 120. Los valores dentro de la lista deben quedar ordenados de menor a mayor.
b) Reutilice el módulo ImprimirLista que reciba una lista generada en a) e
imprima todos los valores de la lista en el mismo orden que están almacenados.
c) Implemente un módulo BuscarElementoOrdenado que reciba la lista
generada en a) y un valor entero y retorne true si el valor se encuentra
en la lista y false en caso contrario.
d) Invocar desde el programa principal a los módulos implementados
para crear una lista ordenada, mostrar todos sus elementos y
determinar si un valor leído por teclado se encuentra o no en la lista.}