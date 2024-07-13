(*
4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse
Solución:		*)
program ejercicio4;
var
	primermin, segundomin, numero, i : integer;
begin
	primermin := 9999;
	segundomin := 9998;
	for i := 1 to 1000 do
	begin
		readln(numero);
		if (numero < segundomin) then begin
			if (numero < primermin) then begin
				segundomin := primermin;
				primermin := numero;
			end
			else
				segundomin := numero;
		end;
	end;
writeln('mas chico: ', primermin, ', segundo mas chico: ', segundomin);
end.

