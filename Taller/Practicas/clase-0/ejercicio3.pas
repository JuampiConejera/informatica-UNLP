program ejercicio3;
Type
  lista = ^nodo;
  nodo = record
    dato: integer;
    sig: lista;
  end;

procedure agregarAdelante(var l: lista;n: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := n;
  aux^.sig := l;
  l := aux;
end;

procedure cargarLista(var l: lista);
var
  num: integer;
begin
  num := Random(51) + 100;
  while(num <> 120) do begin
    agregarAdelante(l,num);
    num := Random(51) + 100;
  end;
end;

procedure ImprimirLista(l: lista);
begin
  while(l <> Nil) do begin
    WriteLn(l^.dato); 
    l := l^.sig;
  end;
end;

function BuscarElemento(l: lista;n: integer): Boolean;
begin
  BuscarElemento := false;
  while((l <> Nil) and (not BuscarElemento)) do begin
    if(n = l^.dato) then
      BuscarElemento := true;
    l := l^.sig;
  end;
end;

var
  l: lista;
  numBuscar: integer;
begin
  randomize;
  l := Nil;
  cargarLista(l);
  ImprimirLista(l);
  WriteLn('Numero para buscar en la lista: ');ReadLn(numBuscar);
  WriteLn(BuscarElemento(l,numBuscar));
end.

{ACTIVIDAD 3: Crear un archivo ProgramaListas.pas
a) Implemente un módulo CargarLista que cree una lista de enteros y le
agregue valores aleatorios entre el 100 y 150, hasta que se genere el 120.
b) Implemente un módulo ImprimirLista que reciba una lista generada en a) 
e imprima todos los valores de la lista en el mismo orden que están almacenados.
c) Implemente un módulo BuscarElemento que reciba la lista generada
en a) y un valor entero y retorne true si el valor se encuentra en la lista y false en caso contrario.
d) Invocar desde el programa principal a los módulos implementados
para crear una lista, mostrar todos sus elementos y determinar si un
valor leído por teclado se encuentra o no en la lista.}