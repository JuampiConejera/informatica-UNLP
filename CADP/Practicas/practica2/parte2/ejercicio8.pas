(*
8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.*)
program ejercicio8;
procedure paresImpares (numEntero : longint; var sumaPares, cantImpares : longint);
begin
	while (numEntero <> 0) do begin
		if (numEntero mod 2 = 0) then
			sumaPares := sumaPares + (numEntero mod 10)
		else
			cantImpares := cantImpares + 1;
		numEntero := numEntero div 10
	end;
end;
var
	numEntero, sumaPares, cantImpares : longint;
begin
	sumaPares := 0;
	cantImpares := 0;
	write('Escriba el numero entero que desee: ');
	readln(numEntero);
	while (numEntero <> 123456) do begin
		paresImpares(numEntero, sumaPares, cantImpares);
		write('Escriba el numero entero que desee: ');
		readln(numEntero);
	end;
	writeln('Suma de digitos pares: ', sumaPares);
	writeln('Cantidad de digitos impares: ', cantImpares);
end.