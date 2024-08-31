program ejercicio2;
type
  rangoDias = 1..31;
  rangoMeses = 1..12;
  rangoAnio = 1900..2024;
  rangoFecha = record
    dia: rangoDias;
    mes: rangoMeses;
    anio: rangoAnio;
  end;
  venta = record
    codigo: integer;
    fecha: rangoFecha;
    cant: integer;
  end;  
  arbol = ^nodo;
  nodo = record
    dato: venta;
    HI: arbol;
    HD: arbol;
  end;

  totalVentas = record
	codigo: integer;
	cantidadTotal: integer;
  end;
  
  arbolTotal = ^nodoTotal;
  nodoTotal = record
	dato: totalVentas;
	HI: arbolTotal;
	HD: arbolTotal;
  end;

  ventaRealizada = record
	fecha: rangoFecha;
	cant: integer;
  end;

  lista =  ^nodoLista;
  nodoLista = record
	dato: ventaRealizada;
	sig: lista;
  end;
  
  producto = record
	codigo: integer;
	info: lista;
  end;
  
  arbolListas = ^nodoListas;
  nodoListas = record
	dato: producto;
	HI: arbolListas;
	HD: arbolListas;
  end;

procedure leerVentas(var v: venta);
begin
  v.codigo := random(100);
  v.fecha.dia := random(31);
  v.fecha.dia := random(31);
  v.fecha.dia := random(31);
  v.cant := random(100);
end;

procedure agregarAdelante(var l: lista;v: venta);
var
	aux: lista;
begin
	New(aux);
	aux^.dato.fecha := v.fecha;
	aux^.dato.cant := v.cant;
	aux^.sig := l;
	l := aux;
end;

procedure agregar(var a: arbol;v: venta);
var
	aux: arbol;
begin
	if(a = Nil) then begin
		New(aux);
		aux^.dato := v;
		aux^.HI := Nil;
		aux^.HD := Nil;
		a := aux;
	end
	else begin
		if(a^.dato.codigo > v.codigo) then
			agregar(a^.HI,v)
		else
			agregar(a^.HD,v);
	end;
end;

procedure agregarArbolTotalVentas(var at: arbolTotal;v: venta);
begin
	if(at = nil) then begin
		New(at);
		at^.dato.codigo := v.codigo;
		at^.dato.cantidadTotal := v.cant;
		at^.HI := Nil;
		at^.HD := Nil;
	end
	else begin
		if(at^.dato.codigo = v.codigo) then
			at^.dato.cantidadTotal += at^.dato.cantidadTotal + v.cant
		else begin
			if(at^.dato.codigo > v.codigo) then
				agregarArbolTotalVentas(at^.HI,v)
			else
				agregarArbolTotalVentas(at^.HD,v);	
		end;
	end;
end;

procedure agregarArbolLista(var al: arbolListas;v: venta);
begin
	if(al = Nil) then begin
		New(al);
		al^.dato.codigo := v.codigo;
		agregarAdelante(al^.dato.info,v);
		al^.HI := Nil;
		al^.HD := Nil;	
	end
	else begin
		if(al^.dato.codigo = v.codigo) then
			agregarAdelante(al^.dato.info,v)
		else if(al^.dato.codigo > v.codigo) then
			agregarArbolLista(al^.HI,v)
		else
			agregarArbolLista(al^.HD,v);
	end;
end;


procedure cargarArboles(var a: arbol; var at: arbolTotal; var al: arbolListas);
var
	v: venta;
begin
	leerVentas(v);
	while(v.codigo <> 0) do begin
		agregar(a,v);
		agregarArbolTotalVentas(at,v);
		agregarArbolLista(al,v);
		leerVentas(v);
	end;
end;

function cantidadTotalProductos(a: arbol;f: rangoFecha) : integer;
	procedure contarTotal(a: arbol;f: rangoFecha; var cantidad: integer);
		begin
			if(a <> Nil) then begin
				if((a^.dato.fecha.dia = f.dia) and (a^.dato.fecha.mes = f.mes) and (a^.dato.fecha.anio = f.anio)) then
					cantidad += a^.dato.cant;
				contarTotal(a^.HI,f,cantidad);
				contarTotal(a^.HD,f,cantidad);
			end;
		end;
var
	cantidad: integer;
begin
	cantidad := 0;
	contarTotal(a,f,cantidad);
	cantidadTotalProductos := cantidad;

end;

function maximo(a: arbolTotal) : integer;
	procedure calcularMaximo(a: arbolTotal;var codigoMaximo: integer;maximoVentas: integer);
	begin
		if(a <> Nil) then begin
			if(a^.dato.cantidadTotal > maximoVentas) then begin
				codigoMaximo := a^.dato.codigo;
				maximoVentas := a^.dato.cantidadTotal;
			end;
			if(a^.HI <> Nil) then
				calcularMaximo(a^.HI,codigoMaximo,maximoVentas);
			if(a^.HD <> Nil) then
				calcularMaximo(a^.HD,codigoMaximo,maximoVentas);
		end
		else
			codigoMaximo := -1;
	end;
var
	maximoVentas, codigoMaximo: integer;
begin
	maximoVentas := -1;
	calcularMaximo(a,codigoMaximo,maximoVentas);
	maximo := codigoMaximo;
end;


var
	a: arbol; at: arbolTotal; al: arbolListas;
	f: rangoFecha;
begin
	a:= Nil;
	at:= Nil;
	al:= Nil;
	cargarArboles(a,at,al);
	writeLn('Escriba la fecha a buscar:');
	write('Dia: '); readln(f.dia);
	write('Mes: '); readln(f.mes);
	write('anio: '); readln(f.anio);
	writeLn('El ',f.dia,'/',f.mes,'/',f.anio,' hubo ', cantidadTotalProductos(a,f), ' productos vendidos.');
	writeLn('El producto con mas ventas es: ',maximo(at));
End.



{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.}
