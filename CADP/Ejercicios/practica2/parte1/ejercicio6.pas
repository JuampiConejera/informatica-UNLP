(*
6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a
*)
(**)
program maximoParHastaNegativo;
function  negativo: integer;
var 
	maximoPar, numero : integer;
begin
	maximoPar := 1;
	write('Ingrese un número entero. (Negativo si quiere finalizar)');
	readln(numero);
	while (numero > 0) do begin
		if (numero > maximoPar) and (numero mod 2 = 0) then
		 maximoPar := numero;
		 readln(numero);
	end;
	negativo := maximoPar;
end;
var
	resultado : integer;
begin
	resultado := negativo;
	writeln('El numero par más grande fue : ', resultado);
end.
