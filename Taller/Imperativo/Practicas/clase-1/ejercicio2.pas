program ejercicio2;
const
  dimF = 300;
type
  oficina = record
    codigoIdentificacion: integer;
    dniPropietario: integer;
    valorExpensa: real;
  end;
  vector = array[1..dimF] of oficina;

procedure leerVector(var o: oficina);
begin
  write('Codigo de identificacion: ');{ReadLn(o.codigoIdentificacion);}o.codigoIdentificacion := random(50)-1;
  write('DNI propietario: ');{ReadLn(o.dniPropietario);} o.dniPropietario := random(500);
  write('Valor expensa: ');{ReadLn(o.valorExpensa);} o.valorExpensa := random(60);
end;

procedure cargarVector(var v:vector; var dimL: integer);
var
  o: oficina;
begin
  leerVector(o);
  while((o.codigoIdentificacion <> -1) and (dimL < dimF)) do begin
    dimL += 1;
    v[dimL] := o;
    leerVector(o);
  end;
end;

procedure seleccion(var v: vector;dimL: integer);
var
  i, j, pos: integer;
  item: oficina;
begin
  for i := 1 to (dimL - 1) do begin
    pos := i;
    for j := i+1 to dimL do
      if(v[i].codigoIdentificacion < v[pos].codigoIdentificacion) then
        pos := j;
      item := v[pos];
      v[pos] := v[i];
      v[i] := item;
  end;
end;

procedure insercion(var v: vector; dimL: integer);
var
  i, j: integer;
  actual: oficina;
begin
  for i := 2 to dimL do begin
    actual := v[i];
    j := i-1;
    while((j > 0) and (v[j].codigoIdentificacion < actual.codigoIdentificacion))do begin
      v[j+1] := v[j];
      j := j - 1;
    end;
    v[j+1] := actual;
  end;
end;


procedure imprimirVector(v: vector; dimL: integer);
var
  i: integer;
begin
  for i := 1 to dimL do begin
    WriteLn(v[i].codigoIdentificacion);
    WriteLn(v[i].dniPropietario);
    WriteLn(v[i].valorExpensa);
    WriteLn;
  end;
end;
var
  v: vector;
  dimL: integer;
begin
  dimL := 0;
  cargarVector(v,dimL);
  seleccion(v,dimL);
  //insercion(v,dimL);
  insercion(v,dimL);
  WriteLn;
  WriteLn;
  WriteLn;
  imprimirVector(v,dimL);
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