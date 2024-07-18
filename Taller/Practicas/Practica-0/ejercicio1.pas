program ejercicio1;
type
  rangoNota = 0..10;
  rangoMaterias = 1..36;
  vector = array[rangoMaterias] of rangoNota;
  alumno = record
    apellido : string;
    numero : integer;
    anio : integer;
    materiasAprobadas : rangoMaterias;
    notaObtenida : vector;
  end;
  lista = ^nodo;
  nodo = record
    dato : alumno;
    sig : lista;
  end;


procedure leerAlumno(var a : alumno);
var
  i : integer;
begin
  Write('Número de alumno:  ');ReadLn(a.numero);
  Write('Apellido:  ');ReadLn(a.apellido);
  Write('Año:  ');ReadLn(a.anio);
  Write('materias Aprobadas:  ');ReadLn(a.materiasAprobadas);
  for i := 1 to a.materiasAprobadas do begin
    Write('Nota obtenida ',i,':  ');ReadLn(a.notaObtenida[i]);
  end;
end;
procedure agregarAdelante(var l : lista; a : alumno);
var
  aux : lista;
begin
  New(aux);
  aux^.dato := a;
  aux^.sig := l;
  l := aux;
end;
procedure cargarLista(var l : lista);
var
  a : alumno;
begin
  repeat
    leerAlumno(a);
    agregarAdelante(l,a);
  until a.numero = 11111;
end;

procedure procesarAlumno(a : alumno;var numeroDeAlumno : Integer; var promedio : real);
var
  i : integer;
  total, cant : integer;
begin
  total := 0; cant := 0;
  numeroDeAlumno := a.numero;
  for i := 1 to a.materiasAprobadas do begin
    cant := cant + 1;
    total := total + a.notaObtenida[i];
  end;
  promedio := total/cant;
  WriteLn('El numero de alumno es: ', a.numero);
  WriteLn('El promedio es: ', promedio);
end;
procedure procesarLista(l : lista);
var
  promedio : real;
  numeroDeAlumno : Integer;
begin
  while (l <> nil) do begin
    procesarAlumno(l^.dato,numeroDeAlumno,promedio);
    l := l^.sig;
  end;

end;
var
  l : lista;
begin
  l := Nil;
  cargarLista(l);
  procesarLista(l);
end.
{1.- Implementar un programa que procese la información de los alumnos de la Facultad de
Informática.
a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de
todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso,
cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada
una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno
11111, el cual debe procesarse.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número
de alumno y promedio de cada alumno.
c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de
materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo
puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?}