program once;
const
    dimF = 10;
type
    alumno = record
        legajo : integer;
        apellido : string[15];
        promedio : real;
    end;
    listaAlumnos = ^nodoAlumnos;
    nodoAlumnos = record
        dato : alumno;
        sig : listaAlumnos;
    end;
    vecMejoresEgresados = array[1..dimF] of alumno;
procedure leerAlumno(var a : alumno);
begin
    write('Numero de Legajo: ');readln(a.legajo);
    if(a.legajo <> 0) then begin
        write('Apellido: ');readln(a.apellido);
        write('Promedio: ');readln(a.promedio);
    end;
end;
procedure insertarOrdenado(var l : listaAlumnos;a : alumno);
var
    actual, anterior, nuevo : listaAlumnos;
begin
    new(nuevo);
    nuevo^.dato := a;
    nuevo^.sig := Nil;
    actual := l;
    anterior := l;
    while(actual <> nil) and (actual^.dato.promedio > a.promedio) do begin
        anterior := actual;
        actual := actual^.sig;
    end;
    if(actual = anterior) then
        l := nuevo
    else
        anterior^.sig := nuevo;
    nuevo^.sig := actual;
end;
procedure cargarAlumnos(var l : listaAlumnos);
var
    a : alumno; 
begin
    leerAlumno(a);
    while(a.legajo <> 0) do begin
        insertarOrdenado(l,a);
        leerAlumno(a);
    end;
end;
procedure cargarVector(var v : vecMejoresEgresados; l : listaAlumnos);
var
    i : integer;
begin
    for i := 1 to dimF do begin
        v[i] := l^.dato;
        l := l^.sig;
    end;
end;
procedure imprimirVector(v : vecMejoresEgresados);
var
    i : integer;
begin
    for i := 1 to dimF do
        WriteLn('El alumno ', v[i].apellido, '. Numero de legajo: ', v[i].legajo, ' está en el puesto ', i, ' con un promedio de: ', v[i].promedio:0:2,'.');
end;
var
    a : alumno;
    l : listaAlumnos;
    v : vecMejoresEgresados;
begin
    l := nil;
    cargarAlumnos(l);
    cargarVector(v,l);
    imprimirVector(v);
end.
{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y
el promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
del egresado (de mayor a menor).}