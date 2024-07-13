(*4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de
cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos
consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos
de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando
el módulo desarrollado en el inciso a y retorne la cantidad total de minutos y la cantidad total de MB a
facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta
$1,35.*)
program ejercicio4;
Type
	cliente = record
		codCliente, cantLineas : integer;
	end;
	linea = record
		numTel : string;
		cantMin, cantMB : integer;
	end;
procedure leerCliente(var c:cliente);
begin
	writeln('Codigo del cliente: ');
	readln(c.codCliente);
	writeln('Cantidad de lineas a sus disposicion: ');
	readln(c.cantLineas);
end;
procedure leerLinea(var l:linea);
begin
	writeln('Numero de telefono de la linea: ');
	readln(l.numTel);
	writeln('Cantidad de minutos utilizados: ');
	readln(l.cantMin);
	writeln('Cantidad de MB utilizados: ');
	readln(l.cantMB);
end;
procedure facturar(var c:cliente; var l: linea);
var
	precioMB ,precioMin, totalFacturar : real;
	i : integer;
begin
	precioMB := 1.35;
	precioMin := 3.4;
	totalFacturar := 0;
	leerCliente(c);
	for i := 1 to c.cantLineas do begin
		leerLinea(l);
		totalFacturar := totalFacturar + (precioMB * l.cantMB) + (precioMin * l.cantMin);
	end;
	writeln('el total a facturar del cliente nro. ', c.codCliente, 'es de: $', totalFacturar:0:2);
end;

var
	cli : cliente;
	li : linea;
	i : integer;
begin
	for i := 1 to 9300 do begin
		facturar(cli, li);
	end;
end.
