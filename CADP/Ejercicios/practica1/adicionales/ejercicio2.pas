(*
Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5 autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8
Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)
Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)
Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se entrega en tiempo y forma y con al menos el 40% de respuestas correctas.
Solucion:		*)
program ejercicio2;
type
	notas = -1..10;
	rangoLegajos = -1..99999;
var
	condicion : char;
	legajo : rangoLegajos;
	nota : notas;
	i, iCondicionRendir, rCondicionRendir, cantIngresantes, cantRecursantes, todoEvaluacion, cantProdigios, notaCero, alumnoCero, primeroCeros, segundoCeros, primeroDieces, segundoDieces, cerosPorAlumno, diecesPorAlumno : integer;
	presente, porcentajeTotalRendirIngresantes, porcentajeTotalRendirRecursantes, notaPromedio : real;
begin
	//los dos alumnos con mayor cantidad de 10
	primeroDieces := 0;
	segundoDieces := 0;
	//los dos alumnos con mayor cantidad de 0
	primeroCeros := 0;
	segundoCeros := 0;
	//cantidad de alumnos que obtuvieron 0 puntos en al menos una autoevaluación.
	alumnoCero := 0;
	//cantidad de alumnos cuya nota promedio fue mayor a 6.5
	cantProdigios := 0;
	//cantidad de Recursantes/Ingresantes
	cantRecursantes := 0;
	cantIngresantes := 0;
	//Recursantes/Ingresantes que estén en condiciones de rendir el parcial
	rCondicionRendir := 0;
	iCondicionRendir := 0;
	//porcentaje de Recursantes/Ingresantes en condiciones de rendir el parcial
	porcentajeTotalRendirIngresantes := 0;
	porcentajeTotalRendirRecursantes := 0;
	//alumnos que aprobaron todas las autoevaluaciones
	todoEvaluacion := 0; 
	
	write('Legajo: ');
	readln(legajo);
	while(legajo <> -1) do begin
		write('Condicion: ');
		readln(condicion);
		if(condicion = 'i') or (condicion = 'r')then begin
			cerosPorAlumno := 0;
			diecesPorAlumno := 0;
			NotaCero := 0;
			presente := 0;
			notaPromedio := 0;
			for i := 1 to 5 do begin
				writeln('Notas: ');
				readln(nota);
				if(nota >= 4) then
					presente := presente + 1;
				notaPromedio := notaPromedio + nota;
				if(nota = 0) then begin
					notaCero := notaCero + 1;
					cerosPorAlumno := cerosPorAlumno + 1;
				end;
				if(nota = 10) then
					diecesPorAlumno := diecesPorAlumno + 1;
				if(notaCero = 1) and (nota = 0) then
					alumnoCero := alumnoCero + 1;
			end;
			notaPromedio := notaPromedio / 5;
			if(notaPromedio > 6.5) then
				cantProdigios := cantProdigios + 1;
			presente := presente / 5;
			if(presente = 1) then
				todoEvaluacion := todoEvaluacion + 1;
			if(condicion = 'i') then begin
				cantIngresantes := cantIngresantes + 1;
				if(presente > 0.75) then
					iCondicionRendir := iCondicionRendir + 1;
			end;
			if(condicion = 'r') then begin
				cantRecursantes := cantRecursantes + 1;
				if(presente > 0.75) then
					rCondicionRendir := rCondicionRendir + 1;
			end;
			if(cerosPorAlumno >= segundoCeros) then begin
				if(cerosPorAlumno >= primeroCeros) then begin
					segundoCeros := primeroCeros;
					primeroCeros := legajo;
				end
				else
					segundoCeros := legajo;
			end;
			if(diecesPorAlumno >= segundoDieces) then begin
				if(diecesPorAlumno >= primeroDieces) then begin
					segundoDieces := primeroDieces;
					primeroDieces := legajo;
				end
				else
					segundoDieces := legajo;
			end;
		end
		else
			writeln('Escribe "i" para ingresante o "r" para recursante.');
		write('Legajo: ');
		readln(legajo);
	end;
	writeln('Cantidad de ingresantes: ', cantIngresantes);
	if(cantIngresantes = 0) then
		cantIngresantes := 1;
	porcentajeTotalRendirIngresantes := (iCondicionRendir / cantIngresantes) * 100;
	writeln('Cantidad de ingresantes en condiciones de rendir el parcial: ', iCondicionRendir);
	writeln('Porcentaje sobre el total de ingresantes: ', porcentajeTotalRendirIngresantes:1:2, '%');
	writeln('--------------------------------------');
	writeln('Cantidad de recursantes: ', cantRecursantes);
	if (cantRecursantes = 0) then
		cantRecursantes := 1;
	porcentajeTotalRendirRecursantes := (rCondicionRendir / cantRecursantes) * 100;
	writeln('Cantidad de recursantes en condiciones de rendir el parcial: ', rCondicionRendir);
	writeln('Porcentaje sobre el total de recursantes: ', porcentajeTotalRendirRecursantes:1:2, '%');
	writeln('--------------------------------------');
	writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones: ', todoEvaluacion);
	writeln('--------------------------------------');
	writeln('Cantidad de alumnos con mayor promedio a 6.5: ', cantProdigios);
	writeln('--------------------------------------');
	writeln('Cantidad de alumnos con nota 0 (cero): ', alumnoCero);
	writeln('--------------------------------------');
	writeln('Los dos alumnos con mayor cantidad de 0 (cero) son los legajos: N. ', primeroCeros, ' y N. ', segundoCeros);
	writeln('--------------------------------------');
	writeln('Los dos alumnos con mayor cantidad de 10 (diez) son los legajos: N. ', primeroDieces, ' y N. ', segundoDieces);
	
end.
