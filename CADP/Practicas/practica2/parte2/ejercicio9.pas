(*
9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.*)
program ejercicio9;
procedure infoAlumnos(var nombre, apellido, apellidoA, apellidoB, nombreA, nombreB : string; var numInscripcion, inscripcionBajoA, inscripcionBajoB, inscripcionAltoA, inscripcionAltoB, cantInscriptosPar, cantInscriptos : integer;var  porcentaje : real);
begin
	cantInscriptos := 0;
	cantInscriptosPar := 0;
	//inscripcion mas chica;
	apellidoA := '';
	inscripcionBajoA := 32767;
	//segunda inscripcion mas chica;
	apellidoB := '';
	inscripcionBajoB := 32766; 
	//inscripcion mas alta;
	nombreA := '';
	inscripcionAltoA := -32767;
	//segunda inscripcion mas alta;
	nombreB := '';
	inscripcionAltoB := -32768; 
	repeat
		cantInscriptos := cantInscriptos + 1;
		write('Nombre: ');
		readln(nombre);
		write('Apellido: ');
		readln(apellido);
		write('Ingrese el numero de inscripcion: ');
		readln(numInscripcion);
		if (numInscripcion < inscripcionBajoB) then begin
			if (numInscripcion < inscripcionBajoA) then begin
				inscripcionBajoB := inscripcionBajoA;
				apellidoB := apellidoA;
				inscripcionBajoA := numInscripcion;
				apellidoA := apellido;
			end
			else begin
				inscripcionBajoB := numInscripcion;
				apellidoB := apellido;
			end;
		end;
		if (numInscripcion > inscripcionAltoB) then begin
			if (numInscripcion > inscripcionAltoA) then begin
				inscripcionAltoB := inscripcionAltoA;
				nombreB := nombreA;
				inscripcionAltoA := numInscripcion;
				nombreA := nombre;
			end
			else begin
				inscripcionAltoB := numInscripcion;
				nombreB := nombre;
			end;
		end;
		if (numInscripcion mod 2 = 0) then
			cantInscriptosPar := cantInscriptosPar + 1;
	until numInscripcion = 1200;
	porcentaje := (cantInscriptosPar / cantInscriptos) * 100;
end;
var
	nombre, apellido, apellidoA, apellidoB, nombreA, nombreB : string;
	numInscripcion, inscripcionBajoA, inscripcionBajoB, inscripcionAltoA, inscripcionAltoB, cantInscriptosPar, cantInscriptos : integer;
	porcentaje : real;

begin
	infoAlumnos(nombre, apellido, apellidoA, apellidoB, nombreA, nombreB, numInscripcion, inscripcionBajoA, inscripcionBajoB, inscripcionAltoA, inscripcionAltoB, cantInscriptosPar, cantInscriptos, porcentaje);
	writeln('Los dos alumnos con numero de inscripcion mas chico son: ', apellidoB, ' y ', apellidoA);
	writeln('los dos alumnos con numero de inscripcion mas grande son: ', nombreA, ' y ', nombreB);
	writeln('porcentaje: ', porcentaje:1:2, '%');
end.
