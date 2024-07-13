{*
1. Dado el siguiente programa:
program Registros;
type
str20 = string[20];
alumno = record
codigo : integer;
nombre : str20;
promedio : real;
end;
procedure leer(var alu : alumno);
begin
writeln(‘Ingrese el código del alumno’);
read(alu.codigo);
if (alu.codigo <> 0) then begin
writeln(‘Ingrese el nombre del alumno’); read(alu.nombre);
writeln(‘Ingrese el promedio del alumno’); read(alu.promedio);
end;
end;
var
a : alumno;
begin
...
end.
a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e
informe la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que
no debe procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe
también el nombre del alumno con mejor promedio*}
program Registros;
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;
procedure leer(var alu : alumno; var cont : integer;var nombremejorpromedio : str20);
var
	mejorpromedio : real;
begin
	mejorpromedio := -1;
	writeln('Ingrese el código del alumno');
	readln(alu.codigo);
	while(alu.codigo <> 0) do begin
		writeln('Ingrese el nombre del alumno'); 
		readln(alu.nombre);
		writeln('Ingrese el promedio del alumno'); 
		readln(alu.promedio);
		cont := cont + 1;
		writeln('Ingrese el código del alumno');
		readln(alu.codigo);
		if (alu.promedio > mejorpromedio) then begin
			mejorpromedio := alu.promedio;
			nombremejorpromedio := alu.nombre;
			end;
	end;
end;
var
	a : alumno;
	cont : integer;
	nombremejorpromedio: str20;
begin
	cont := 0;
	leer(a, cont, nombremejorpromedio);
	writeln('La cantidad de alumnos leídos es: ', cont);
	writeln('El nombre del mejor promedio es: ', nombremejorpromedio);
end.
