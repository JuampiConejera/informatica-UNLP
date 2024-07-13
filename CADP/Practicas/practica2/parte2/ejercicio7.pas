(*
7. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.*)
program ejercicio7;
procedure cantidadSuma (numEntero : integer; var cantDigitos, sumaDigitos : integer);
begin
	sumaDigitos := 0;
	cantDigitos := 0;
	while (numEntero <> 0) do begin
		sumaDigitos := sumaDigitos + (numEntero mod 10);
		numEntero := numEntero div 10;
		cantDigitos := cantDigitos + 1; 
	end;
end;
var
	numEntero, cantDigitos, sumaDigitos, totalDigitos : integer;
begin
	totalDigitos := 0;
	repeat
		write('Escriba el numero entero que desee: ');
		readln(numEntero);
		cantidadSuma(numEntero, cantDigitos, sumaDigitos);
		totalDigitos := totalDigitos + cantDigitos;
		writeln(numEntero, ' tiene ', cantDigitos, ' digitos, y su suma es: ', sumaDigitos);
	until sumaDigitos = 10;
	writeln('Hay ', totalDigitos, ' digitos en total.');
end.	
