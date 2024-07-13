(*
1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.
Solución:       *)
program p1p2ej1;
var
	numEntero, resultado, contadorMayores, i : integer;
begin
	resultado := 0;
	contadorMayores := 0;
	writeln('Escribir el número entero a sumar');
	for i := 1 to 10 do
	begin
		readln(numEntero);
		resultado := resultado + numEntero;
		if (numEntero > 5) then
			contadorMayores := contadorMayores + 1;
	end;
writeln('Resultado: ', resultado);
writeln('numeros mayores a 5: ', contadorMayores);
end.