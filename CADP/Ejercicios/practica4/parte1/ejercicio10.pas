program ejercicio10;
const
  dimF = 300;
type
  empleado = record
    numeroEmpleado: integer;
    salario: real;
  end;
  vector = array[1..dimF] of empleado;

procedure cargarVector(var v: vector;var dimL: integer);
var
  salario: real;
begin
  salario := Random(1000);
  while(salario <> 0) and (dimL < dimF) do begin
    dimL := dimL+1;
    v[dimL].numeroEmpleado := random(300);
    v[dimL].salario := salario;
    salario := Random(1000);
  end;
end;

procedure aumentarSueldo(var v: vector;dimL: integer;realX: real);
var
  i: integer;
begin
  for i := 1 to dimL do begin
    v[i].salario := v[i].salario * realX;
    WriteLn('Numero empleado: ',v[i].numeroEmpleado,'. Salario: $',v[i].salario:0:2);
  end;
end;

procedure imprimir(v: vector;dimL: integer);
var
  i: integer; suma: real;
begin
  suma := 0;
  for i := 1 to dimL do
    suma := suma + v[i].salario;
  WriteLn('Salario promedio: $',suma/dimL:0:2);
end;

var
  v: vector;
  aumento: real;
  dimL: integer;
begin
  randomize;
  dimL := 0;
  cargarVector(v,dimL);
  aumento := 1.15;
  aumentarSueldo(v,dimL,aumento);
  imprimir(v,dimL);
  WriteLn(dimL);
end.
{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando
se completa el vector. Una vez finalizada la carga de datos se pide:
a. Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar
un módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión
lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b. Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}