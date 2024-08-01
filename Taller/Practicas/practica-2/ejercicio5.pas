program ejercicio5;
procedure busquedaDicotomica(v: vector; ini,fin: indice; dato: integer; var pos: indice);
var
  medio: indice;
begin
  if(ini > fin) then
    pos := -1
  else begin
    medio := (ini + fin) DIV 2;
    if(v[medio] = dato) then
      pos := medio
    else if(dato < v[medio]) then
      busquedaDicotomica(v,ini,medi1,dato,pos)
    else
      busquedaDicotomica(v,ini,medio+1,dato,pos);
  end;
end;
begin
end.
{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}