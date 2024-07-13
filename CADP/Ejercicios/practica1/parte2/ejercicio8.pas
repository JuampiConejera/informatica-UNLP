(*
8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.
Solución:		*)
program ejercicio8;
var
	i, cantVentas, dia, mayorCant, diaMayor: integer;
	montoVentas, temp : real;
begin
	mayorCant := 0; //almacena la mayor cantidad de ventas
	dia := 0;
	montoVentas := 0;
	for i := 1 to 3 do begin
		dia := dia + 1;
		writeln('dia: ', dia);
		cantVentas := 0;
		writeln('Monto de la venta: ');
		readln(temp);
		montoVentas := montoVentas + temp;
		while (temp <> 0) do begin
			writeln('Monto de la venta: ');
			readln(temp);
			montoVentas := montoVentas + temp;
			cantVentas := cantVentas + 1;
		end;
		writeln('');
		writeln(cantVentas, ' ventas en el dia: ', dia);
		writeln('------------------------');
		if (cantVentas > mayorCant) then begin
			mayorCant := cantVentas;
			diaMayor := dia;
		end;
	end;
	write('Total vendido: $');
	write(montoVentas:1:2);
	writeln('El dia ', diaMayor, ' fue el dia con mayores ventas. Alcanzando ', mayorCant, 'ventas.');
end.
