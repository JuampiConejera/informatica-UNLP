program ejercicio3;
type
	producto = record
		codigo: integer;
		TotalVendidas: integer;
		montoTotal: real;
	end;
	venta = record
		codigoVenta: integer;
		codigoProducto: integer;
		unidadesVendidas: integer;
		precioUnitario: real;
	end;
	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
procedure agregarArbol(var a: arbol; v: venta);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codigo := v.codigoProducto;
		a^.dato.totalVendidas := v.unidadesVendidas;
		a^.dato.montoTotal := v.precioUnitario;
	end
	else
		if(a^.dato.codigo = v.codigoProducto) then begin
			a^.dato.totalVendidas += v.unidadesVendidas;
			a^.dato.montoTotal += v.precioUnitario;
		end
		else begin
			if(v.codigoProducto < a^.dato.codigo) then
				agregarArbol(a^.HI,v)
			else
				agregarArbol(a^.HD,v);
		end;
end;	

procedure leerVenta(var v: venta);
begin
	write('Codigo venta: '); readln(v.codigoVenta);
	write('Codigo Producto: '); readln(v.codigoProducto);
	write('Cantidad unidades vendidas: ');readln(v.unidadesVendidas);
	write('Precio: '); readln(v.precioUnitario);
end;
procedure cargarArbol(var a: arbol);
var
	v: venta;
begin
	leerVenta(v);
	while(v.codigoVenta <> -1) do begin
		agregarArbol(a,v);
		leerVenta(v);
	end;
end;

procedure imprimirOrden(a: arbol);
begin
	if(a <> Nil) then begin
		if(a^.HI <> Nil) then
			imprimirOrden(a^.HI);
		writeln('Codigo Producto: ', a^.dato.codigo);
		writeln('Total de unidades vendidas: ', a^.dato.totalVendidas);
		writeln('Monto total: ', a^.dato.montoTotal);
		if(a^.HD <> Nil) then
			imprimirOrden(a^.HD);
	end;
end;

function maximo(a: arbol) : integer;
	procedure calcularMaximo(a: arbol;var codMax: integer; cantMax: integer);
	begin
		if(a <> Nil) then begin
			if(a^.dato.totalVendidas > cantMax) then begin
				codMax := a^.dato.codigo;
				cantMax := a^.dato.totalVendidas;
			end;
			if(a^.HI <> Nil) then 
				calcularMaximo(a^.HI, codMax, cantMax);
			if(a^.HD <> Nil) then
				calcularMaximo(a^.HD, codMax, cantMax);
		end;
	end;
var
	cantMax,codMax: integer;
begin
	cantMax := 0;
	codMax := -1;
	calcularMaximo(a,codMax,cantMax);
	maximo := codMax;
end;

function cantidadCodigosMayores(a: arbol; cod: integer) : integer;
begin
	if(a = nil) then
		cantidadCodigosMayores := 0
	else begin
		if(a^.dato.codigo < cod) then
			cantidadCodigosMayores := cantidadCodigosMayores(a^.HI,cod) + cantidadCodigosMayores(a^.HD,cod) + 1
		else
			cantidadCodigosMayores := cantidadCodigosMayores(a^.HI,cod) + cantidadCodigosMayores(a^.HD,cod);
	end;
end;

{function montoTotalEntreCodigos(a: arbol; primero,segundo : integer) : real;
begin
	if(a = nil) then
		montoTotalEntreCodigos := 0
	else begin
		if((a^.dato.codigo > primero) and (a^.dato.codigo < segundo)) then
			montoTotalEntreCodigos := montoTotalEntreCodigos(a^.HI,primero,segundo) + montoTotalEntreCodigos(a^.HD,primero,segundo) + a^.dato.montoTotal
		else
			montoTotalEntreCodigos := montoTotalEntreCodigos(a^.HI,primero,segundo) + montoTotalEntreCodigos(a^.HD,primero,segundo);
	end;
end;}

function montoTotalEntreCodigos(a: arbol; primero,segundo: integer) : real;
begin
	if(a = nil) then
		montoTotalEntreCodigos := 0
    else begin
	    if(a^.dato.codigo > primero) then begin
		    if(a^.dato.codigo < segundo) then
			    montoTotalEntreCodigos := a^.dato.montoTotal + montoTotalEntreCodigos(a^.HI,primero,segundo) + montoTotalEntreCodigos(a^.HD,primero,segundo)
			else
				montoTotalEntreCodigos := montoTotalEntreCodigos(a^.HI,primero,segundo);
		end
		else
			montoTotalEntreCodigos := montoTotalEntreCodigos(a^.HD,primero,segundo);
	end;
end;

var
	a: arbol;
	primero,segundo,cod: integer;
begin
	a := nil;
	cargarArbol(a);
	imprimirOrden(a);
	writeln('El codigo de producto con mayor cantidad de unidades vendidas es: ',Maximo(a));
	write('Codigo de producto a calcular: '); readln(cod);
	writeln('La cantidad de codigos menores al recibido es: ', cantidadCodigosMayores(a,cod));
	write('Escriba el codigo menor para calcular: ');readln(primero);
	write('Escriba el codigo mayor para calcular: ');readln(segundo);
	writeln('El monto total entre todos los codigos recibidos es: ', montoTotalEntreCodigos(a,primero,segundo));
end.
{3. Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}
