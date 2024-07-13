program ejercicio5;
Type
	auto = record
		marca, modelo : string;
		precio : real;
	end;

procedure LeerAuto(var c:auto);
begin
	write('marca: ');
	readln(c.marca);
	write('modelo: ');
	readln(c.modelo);
	write('precio: ');
	readln(c.precio);
end;
procedure masCaro(c:auto;var precioMasCaro : real;var marcaCaro : string;var modeloCaro : string);
begin
	if(c.precio > precioMasCaro) then begin
		precioMasCaro := c.precio;
		marcaCaro := c.marca;
		modeloCaro := c.modelo;
	end;
end;
function promedioMarca(cantAuto:integer; totalMarca:real):real;
begin
	promedioMarca := totalMarca / cantAuto;
end;

var
	coche : auto;
	cantAuto : integer;
	totalMarca, precioMasCaro : real;
	marcaActual, marcaCaro, modeloCaro: string;
begin
	precioMasCaro := -9999;
	cantAuto := 0;
	totalMarca := 0;
	leerAuto(coche);
	while(coche.marca <> 'zzz') do begin
		marcaActual := coche.marca;
		cantAuto := 0;
		totalMarca := 0;
		while(marcaActual = coche.marca) do begin
			masCaro(coche, precioMasCaro, marcaCaro, modeloCaro);
			cantAuto := cantAuto + 1;
			totalMarca := totalMarca + coche.precio;
			leerAuto(coche);
		end;
		writeln('El promedio de ', marcaActual, ' es de $', promedioMarca(cantAuto, totalMarca):0:2);
	end;
	writeln('El auto más caro es: ', modeloCaro, ', ', marcaCaro, '. $', precioMasCaro:0:2);
end.
