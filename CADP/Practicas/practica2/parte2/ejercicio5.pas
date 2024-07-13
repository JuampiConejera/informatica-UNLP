(*
5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores 4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).
*)
program ejercicio5;
function esDoble (numA, numB : integer) : boolean;
	begin
		if numA * 2= numB then
			esDoble := true
		else
			esDoble := false;
	end;
var
	numA, numB, totalPares, totalDobles : integer;
begin
	//inicializo lo necesario
	totalPares := 0;
	totalDobles := 0;
	write('Escriba el primer numero: ');
	readln(numA);
	write('Escriba el segundo numero: ');
	readln(numB);
	while (numA <> 0) and (numB <> 0) do begin
		totalPares := totalPares + 1;
		if esDoble(numA, numB) then
			totalDobles := totalDobles + 1;
		writeln('------------------');
		write('primer numero: ');
		readln(numA);
		write('segundo numero: ');
		readln(numB);
	end;
	writeln('Cantidad de pares leídos: ', totalPares);
	writeln('Cantidad de pares en los que numB es el doble de numA ', totalDobles);
end.