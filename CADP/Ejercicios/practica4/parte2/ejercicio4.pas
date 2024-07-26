program ejercicio4;
type
  alumno = record
    numero: integer;
    appelidoNombre: string[30];
    cantAsistencia: integer;
  end;
  vectorDispone = array[1..1000] of alumno;
procedure cargarVector(var v: vector);begin end;//SE DISPONE
begin
  WriteLn('Alta paja hacerlo no lo toman');
end.
{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.}