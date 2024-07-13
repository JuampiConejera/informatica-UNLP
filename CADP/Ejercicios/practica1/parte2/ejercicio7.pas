(*
7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.
Solución:		*)
program ejercicio7;
var
	nombre, nombreUltimo, nombrePenultimo, nombrePrimero, nombreSegundo: string;
	tiempo, tiempoUltimo, tiempoPenultimo, tiempoPrimero, tiempoSegundo : real;
	i : integer;
begin
	//Inicializo strings ya que sino no se pueden actualizar en la primer pasada del bucle
	nombreUltimo := '';
	nombrePenultimo := '';
	nombrePrimero := '';
	nombreSegundo := '';
	//Inicializo integer para poder actualizarlos sin datos
	tiempoUltimo := -999999;
	tiempoPenultimo := -999998;
	tiempoPrimero := 999999;
	tiempoSegundo := 999998;
	for i := 1 to 4 do begin
		write('nombre: ');
		readln(nombre);
		write('tiempo: ');
		readln(tiempo);
		if (tiempo > tiempoPenultimo) or (tiempo < tiempoSegundo) then begin
			if (tiempo > tiempoPenultimo) then begin
				if (tiempo > tiempoUltimo) then begin
					nombrePenultimo := nombreUltimo;
					tiempoPenultimo := tiempoUltimo;
					nombreUltimo := nombre;
					tiempoUltimo := tiempo;
				end
				else begin
					tiempoPenultimo := tiempo;
					nombrePenultimo := nombre;
				end;
			end;
			if (tiempo < tiempoSegundo) then begin
				if (tiempo < tiempoPrimero) then begin
					nombreSegundo := nombrePrimero;
					tiempoSegundo := tiempoPrimero;
					nombrePrimero := nombre;
					tiempoPrimero := tiempo;
				end
				else begin
					nombreSegundo := nombre;
					tiempoSegundo := tiempo;
				end;
			end;
		end;
	end;
	write('ULTIMO: ', nombreUltimo, ' ');
	write(tiempoUltimo:1:2);
	write('ms');
	writeln('');
	write('PENULTIMO: ', nombrePenultimo, ' ');
	write(tiempoPenultimo:1:2);
	write('ms');
	writeln('');
	write('SEGUNDO: ', nombreSegundo, ' ');
	write(tiempoSegundo:1:2);
	write('ms');
	writeln('');
	write('PRIMERO: ', nombrePrimero, ' ');
	write(tiempoPrimero:1:2);
	write('ms');
	writeln('');
end.
