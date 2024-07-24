program ejercicio9;
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

procedure cargarVector(var v: vector;dimL: integer);
var
  dni: integer;
begin
  dni := random(100) - 1;
  while(dni <> -1) and (dimL <= dimF) do begin
    dimL := dimL+1;
    v[dimL].inscripcion := random(100);
    v[dimL].dni := dni;
    v[dimL].apellido := chr(random(26) + 65);
    v[dimL].nombre := chr(random(26) + 65);
    v[dimL].nacimiento := random(100);
    dni := random(100) - 1;
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
  dimL: integer;
begin
  randomize;
  dimL := 0;
  cargarVector(v);
  procesarVector(v);
end.
{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información
de a lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}