(*
2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”
Solución:		*)
program ejercicio2;
var
	mayor, numero : longint;
	i, posicion, contador : integer;
begin
	mayor := 0;
	contador := 0;
	posicion := 0;
	writeln('Escribir la secuencia de 10 números');
	for i := 1 to 10 do
	begin
		readln(numero);
		if (numero > mayor) then
			begin
				contador := contador + 1;
				mayor := numero;
				posicion := contador;
			end;
	end;
	writeln('El mayor numero leido fue el: ', mayor, ' en la posición ', posicion);
end.
