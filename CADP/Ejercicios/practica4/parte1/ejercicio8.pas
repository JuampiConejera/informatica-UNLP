program ejercicio8;
const
  dimF = 400;
type
  alumno = record
    inscripcion: integer;
    dni: integer;
    apellido: string;
    nombre: string;
    nacimiento: integer;
  end;
  vector = array[1..dimF] of alumno;

procedure cargarVector(var v: vector);
var
  i: integer;
begin
  for i:= 1 to dimF do begin
    v[i].inscripcion := random(100);
    v[i].dni := random(100);
    v[i].apellido := chr(random(26) + 65);
    v[i].nombre := chr(random(26) + 65);
    v[i].nacimiento := random(100);
  end;
end;

function dniPar(dni: integer) : Boolean;
var
  aux: integer;
begin
  dniPar := true;
  while(dni <> 0) do begin
    aux := dni mod 10;
    if(aux mod 2 = 1) then
      dniPar := false;
    dni := dni DIV 10;
  end;
end;

procedure maximos(a: alumno;var min1,min2: integer;var nombre1,nombre2,apellido1,apellido2: string);
begin
  if(a.nacimiento < min1) then begin
    min2 := min1;
    nombre2 := nombre1;
    apellido2 := apellido1;
    min1 := a.nacimiento;
    nombre1 := a.nombre;
    apellido1 := a.apellido;
  end
  else if(a.nacimiento < min2) then begin
    min2 := a.nacimiento;
    nombre2 := a.nombre;
    apellido2 := a.apellido;
  end;
end;

procedure procesarVector(v: vector);
var
  i,contadorPares,min1,min2: integer;
  nombre1,nombre2,apellido1,apellido2: string;
begin
  contadorPares :=0;
  min1:= 9999;
  min2:= 9999;
  nombre1 := '';nombre2 := '';apellido1 := '';apellido2 := '';
  for i:= 1 to dimF do begin
    if(dniPar(v[i].dni)) then
      contadorPares := contadorPares + 1;
    maximos(v[i],min1,min2,nombre1,nombre2,apellido1,apellido2);
  end;
  WriteLn(((contadorPares / dimF) * 100):2:2);
  Write(min1,'  ',nombre1,'   ',apellido1);
  WriteLn;
  Write(min2,'  ',nombre2,'   ',apellido2);
end;
var
  v: vector;
begin
  randomize;
  cargarVector(v);
  procesarVector(v);
end.
{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido,
nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b. Apellido y nombre de los dos alumnos de mayor edad.}