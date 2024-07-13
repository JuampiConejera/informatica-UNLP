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