(*
3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs.
As, con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO
para el año 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único
de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se
pide implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por
UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a. Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la
cantidad de alumnos y la cantidad de docentes).*)
program ejercicio3;
Type
	unesco = record
		cue : integer;
		nombreEstablecimiento : string;
		cantDocentes : integer;
		cantAlumnos : integer;
		localidad : string;
	end;
	
procedure leerEscuela(var e:unesco);
begin
	writeln('CUE:');
	readln(e.cue);
	writeln('Nombre del establecimiento:');
	readln(e.nombreEstablecimiento);
	writeln('Cantidad de docentes::');
	readln(e.cantDocentes);
	writeln('Cantidad de alumnos:');
	readln(e.cantAlumnos);
	writeln('Localidad:');
	readln(e.localidad);
end;

function relacionDA(e:unesco) : real;
begin
	relacionDA := e.cantAlumnos / e.cantDocentes;
end;
var
	mejorRelacion1, mejorRelacion2, relacion : real;
	mejorEscuela1, mejorEscuela2, escuela : unesco;
	cantLaPlata, i : integer;
begin
	mejorRelacion1 := 9999;
	mejorRelacion2 := 9999;
	cantLaPlata := 0;
	for i := 1 to 2400 do begin
		leerEscuela(escuela);
		relacion := relacionDA(escuela);
		if((relacion < 23.435) and (escuela.localidad = 'la plata')) then
			cantLaPlata := cantLaPlata + 1;
		if(relacion < mejorRelacion1) then begin
			mejorRelacion2 := mejorRelacion1;
			mejorRelacion1 := relacion;
			mejorEscuela2 := mejorEscuela1;
			mejorEscuela1 := escuela;
		end
		else if(relacion < mejorRelacion2) then begin
			mejorRelacion2 := relacion;
			mejorEscuela2 := escuela;
		end;
	end;
	writeln('En La Plata hay: ', cantLaPlata, ' escuelas con buena relacion D-A');
	writeln('La mejor escuela es: CUE= ', mejorEscuela1.cue, 'nombre= "',mejorEscuela1.nombreEstablecimiento,'"');
	writeln('La segunda mejor escuela es: CUE=', mejorEscuela2.cue, 'nombre= "', mejorEscuela2.nombreEstablecimiento, '"');
end.
