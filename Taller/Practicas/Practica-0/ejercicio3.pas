program ejercicio3;
type
  rangoProductos = 1..1000;
  mercaderia = record
    precio : real;
    stock : integer;
  end;
  tabla = array[rangoProductos] of mercaderia;

  detalle = record
    codigo : integer;
    cantidadVendido : integer;
    precioUnitario : real;
  end;
  
  lista = ^nodo;
  nodo = record
    dato : detalle;
    sig : lista;
  end;
  
  ticket = record
    codigo : integer;
    detalles : lista;
    montoTotal : real;
  end;
  listaTickets = ^nodoTickets;
  nodoTickets = record
    dato : ticket;
    sig : listaTickets;
  end;

procedure agregarAtras(var l : lista; d: detalle);
var
  nuevo,aux: lista;
begin
  New(nuevo);
  nuevo^.dato := d;
  nuevo^.sig := nil;
  if(l = Nil) then
    l := nuevo
  else begin
    aux := l;
    while(aux^.sig <> nil) do begin
      aux := aux^.sig;
    end;
    aux^.sig := nuevo;
  end;
end;

procedure agregarAtrasTicket(var l: listaTickets; t: ticket);
var
  nuevo, aux : listaTickets;
begin
  New(nuevo);
  nuevo^.dato := t;
  nuevo^.sig := Nil;
  if (l = Nil) then
    l := nuevo
  else begin
    aux:=l;
    while (aux^.sig<>nil) do begin
      aux:=aux^.sig;
    end;
      aux^.sig:=nuevo;
  end;
end;

procedure leerVenta(t : tabla; var listaDetalles : lista; var monto : real);
var
  d : detalle;
begin
  d.codigo := random(10)+1;
  d.cantidadVendido := random(5);
  while(d.cantidadVendido <> 0) do begin
    if(d.cantidadVendido > t[d.codigo].stock) then begin
      d.cantidadVendido := t[d.codigo].stock;
      t[d.codigo].stock := 0; 
    end 
    else
      t[d.codigo].stock := t[d.codigo].stock - d.cantidadVendido;
    d.precioUnitario := t[d.codigo].precio;
    monto := monto + (d.precioUnitario * d.cantidadVendido);
    agregarAtras(listaDetalles,d);
    d.codigo := random(10)+1;
    d.cantidadVendido := random(5);
  end;
end;

procedure cargarVentas(t : tabla; var l :listaTickets);
var
  nuevo : ticket;
begin
  Write('Codigo venta: ');ReadLn(nuevo.codigo);
  while (nuevo.codigo <> -1) do begin
    nuevo.detalles := nil;
    nuevo.montoTotal := 0;
    leerVenta(t,nuevo.detalles,nuevo.montoTotal);
    agregarAtrasTicket(l,nuevo);
    write('Codigo venta: ');ReadLn(nuevo.codigo);
  end;
end;

procedure procesarVentas(l: listaTickets; codigoProducto: integer; var contador: integer);
begin
  while(l <> Nil) do begin
    if(l^.dato.detalles.codigo = codigoProducto) then
      contador := contador + 1;
    l := l^.sig;
  end; 
end;
var
  t: tabla;
  l: listaTickets;
  codigoProducto, contador : integer;
begin
  randomize;
  cargarTabla(t); //SE DISPONE
  l := Nil;
  cargarVentas(t,l);
  contador := 0;
  ReadLn(codigoProducto);
  procesarVentas(l,codigoProducto,contador);
end.
{3.- Implementar un programa que procese las ventas de un supermercado. El supermercado
dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas.
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de
venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura
de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En
caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.
c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de
producto y retorne la cantidad de unidades vendidas de ese código de producto.}