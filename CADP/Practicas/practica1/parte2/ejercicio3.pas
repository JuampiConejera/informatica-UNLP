(*
3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota.
Solución:		*)
program ejercicio3;
Type
	notas = 1..10;
var
	alumnosAprobados, alumnos7 : integer;
	nota : notas;
	alumno : string;
begin
	alumnosAprobados := 0;
	alumnos7 := 0;
	repeat
		writeln('nombre:  ');
		readln(alumno);
		writeln('nota:  ');
		readln(nota);
		if (nota >= 8) then
			alumnosAprobados := alumnosAprobados + 1;
		if (nota = 7) then
			alumnos7 := alumnos7 + 1;
		until alumno = 'Zidane Zinedine';
	writeln('aprobados: ', alumnosAprobados, '| nota 7: ', alumnos7);
end.
	
