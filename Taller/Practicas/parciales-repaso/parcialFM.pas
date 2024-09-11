program parcialFM;
type
	rangoDia = 1..31;
	compra = record
		codigoCliente: integer;
		dia: rangoDia;
		cantidadProductos: integer;
		montoPagado: real;
	end;
	infoLista = record
		dia: rangoDia;
		cantidadProductos: integer;
		montoPagado: real;
	end;
	lista = ^nodoLista;
	nodoLista = record
		dato: infoLista;
		sig: lista;
	end;
	cliente = record
		codigoCliente: integer;
		infoCompras: lista;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: cliente;
		HI: arbol;
		HD: arbol;
	end;

procedure agregarAdelante(var l: lista; c: compra);
var
	aux: lista;
begin
	new(aux);
	aux^.dato.dia := c.dia;
	aux^.dato.cantidadProductos := c.cantidadProductos;
	aux^.dato.montoPagado := c.montoPagado;
	aux^.sig := l;
	l := aux;
end;

procedure agregarNodo(var a: arbol; c: compra);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codigoCliente := c.codigoCliente;
		a^.dato.infoCompras := Nil;
		agregarAdelante(a^.dato.infoCompras,c);
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(a^.dato.codigoCliente = c.codigoCliente) then
			agregarAdelante(a^.dato.infoCompras,c)
		else if(c.codigoCliente < a^.dato.codigoCliente) then
			agregarNodo(a^.HI,c)
		else
			agregarNodo(a^.HD,c);
	end;
end;	

procedure leerRegistro(var c: compra);
begin
	write('Codigo Cliente: ');readln(c.codigoCliente);
	write('Dia: ');readln(c.dia);
	write('Cantidad Productos: ');readln(c.cantidadProductos);
	write('Monto Pagado: ');readln(c.montoPagado);
end;	

procedure cargarArbol(var a: arbol);
var
	c: compra;
begin
	leerRegistro(c);
	while(c.cantidadProductos <> 0) do begin
		agregarNodo(a,c);
		leerRegistro(c);
	end;
end;

procedure moduloB(a: arbol; var l: lista; cod: integer);
begin
	if(a <> Nil) then begin
		if(cod = a^.dato.codigoCliente) then
			l := a^.dato.infoCompras
		else if(cod < a^.dato.codigoCliente) then
			moduloB(a^.HI,l,cod)
		else
			moduloB(a^.HD,l,cod);
	end
	else
		writeln('cliente no encontrado');
end;

function moduloC(l: lista) : real;
	procedure calcularMaximo(l: lista; max: integer;var montoMax: real);
	begin
		if(l <> nil) then begin
			if(l^.dato.cantidadProductos > max) then begin
				max := l^.dato.cantidadProductos;
				montoMax := l^.dato.montoPagado;
			end;
			calcularMaximo(l^.sig,max,montoMax);
		end;
	end;
var
	montoMax: real;
	max: integer;
begin
	montoMax := -1;
	max := -1;
	calcularMaximo(l,max,montoMax);
	moduloC := montoMax;
end;

var
	a: arbol;
	l: lista;
	cod: integer;
begin
	a := nil;
	cargarArbol(a);
	l := nil;
	write('Codigo de cliente a buscar: ');readln(cod);
	moduloB(a,l,cod);
	writeln;
	writeln;
	writeln(moduloC(l));
end.
{Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de Julio de 2022.
	De cada compra se conoce código del cliente, dia, cantidad de productos y monto pagado.
a. Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la busqueda por codigo del cliente, donde para cada codigo de cliente se alamacenan juntas 	 todas sus compras (dia, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0. Se sugiere utilziar el modulo leerRegistro()-
b. implementar un modulo que reciba la estructura generada en a. y un codigo de cliente y retorne todas las compras de dicho cliente.
c.Realizar un modulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos.
NOTA: implementar el programa principal, que invoque a los incisos a, b y c.}
