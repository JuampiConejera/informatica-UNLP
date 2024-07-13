(* 2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el
año 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese
año.
a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada
casamiento.
b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el
definido en el inciso a.
c.c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura
finaliza al ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos
realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos
realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura
de fecha *)
program ejercicio2;
Type
	fecha = record
		dia : integer;
		mes : integer;
		ano : integer;
	end;

procedure leerFecha (var f:fecha);
begin
	write('Indique el dia del casamiento:  ');
	readln(f.dia);
	write('Indique el mes del casamiento:  ');
	readln(f.mes);
	write('Indique el año del casamiento:  ');
	readln(f.ano);
end;
var
	casamientosVerano, casamientosDiez : integer;
	casamiento : fecha;
begin
	casamientosVerano := 0;
	casamientosDiez := 0;
	leerFecha(casamiento);
	while(casamiento.ano <> 2020) do begin
		if((casamiento.mes >= 1) and (casamiento.mes < 4)) then
			casamientosVerano := casamientosVerano + 1;
		if((casamiento.dia >= 1) and (casamiento.dia < 11)) then
			casamientosDiez := casamientosDiez + 1;
		leerFecha(casamiento);
	end;
	writeln('La cantidad de casamientos de verano son: ', casamientosVerano);
	writeln('La cantidad de casamientos en los primeros diez dias del mes son: ', casamientosDiez);
end.
