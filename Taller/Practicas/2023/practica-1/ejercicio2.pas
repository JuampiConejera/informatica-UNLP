program ejercicio2;
type
  oficina = record
    codigoIdentificacion : integer;
    dni : integer;
    valorExpensa : real;
  end;
  vectorOficinas = array[1..300] of oficina;

procedure leerOficina(var o : oficina);
begin
  o.codigoIdentificacion := Random(302) - 1;
  o.dni := Random(99999);
  o.valorExpensa := Random(99999);
end;
procedure cargarVector(var v : vectorOficinas; var dimL : integer); //A
begin
  dimL := dimL + 1;
  leerOficina(v[dimL]);
  while(v[dimL].codigoIdentificacion <> -1) do begin
    dimL := dimL + 1;
    leerOficina(v[dimL]);
  end;
end;

procedure insercion(var v: vectorOficinas; dimL : Integer);
var
  i,j,actual : Integer;
begin
  for i := 2 to dimL do begin
    actual := v[i].codigoIdentificacion;
    j := i-1;
    while(j>0) and (v[j].codigoIdentificacion > actual) do begin
      v[j+1] := v[j];
      j := j - 1;
    end;
    v[j+1].codigoIdentificacion := actual;
  end;
end;

procedure seleccion(var v : vectorOficinas; dimL : Integer);
var
  i,j,p : integer;
  aux : oficina;
begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := i+1 to dimL do
      if(v[j].codigoIdentificacion < v[p].codigoIdentificacion) then
        p := j;
      aux := v[p];
      v[p] := v[i];
      v[i] := aux;
  end;
end;

procedure imprimir(v : vectorOficinas; dimL : integer);
var i : integer;
begin
  for i := 1 to dimL do begin
    WriteLn(v[i].codigoIdentificacion);
    WriteLn(v[i].dni);
    WriteLn(v[i].valorExpensa);
  end;
end;

var
  v : vectorOficinas;
  dimL : integer;
begin
  Randomize;
  dimL := 0;
  cargarVector(v,dimL);
  insercion(v,dimL);
  seleccion(v,dimL);
  imprimir(v,dimL);
end.

{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}