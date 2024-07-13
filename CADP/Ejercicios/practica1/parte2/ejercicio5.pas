(*
5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.
Solución:		*)
program ejercicio5;
var
	numero, minimo, maximo, suma : integer;
begin
	minimo := 32767;
	maximo := -32768;
	suma := 0;
	writeln('Escriba la secuencia de  números enteros:  ');
	repeat
		readln(numero);
		suma := suma + numero;
		if (numero < minimo) then
			minimo := numero;
		if (numero > maximo) then
			maximo := numero
	until numero = 100;
	writeln('El minimo es: ', minimo);
	writeln('El maximo  es: ', maximo);
	writeln('la suma es: ', suma);
end.

