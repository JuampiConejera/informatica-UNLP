program ejercicio2;
type
  rangoZona = 1..5;
  propiedad = record
    codigoPropiedad : integer;
    tipoPropiedad : integer;
    precioTotal : integer;
  end;
  lista = ^nodo;
  nodo = record
    dato : propiedad;
    sig : lista;
  end;
  vector = array[rangoZona] of lista;

procedure leerPropiedad(var p : propiedad; var zona : rangoZona; var cantidadm2 : integer; var preciom2 : real);
begin
  Write('Codigo propiedad:'); ReadLn(p.codigoPropiedad);
  Write('Tipo propiedad:'); ReadLn(p.tipoPropiedad);
  Write('Zona:'); ReadLn(zona);
  Write('Codigo propiedad:'); ReadLn(p.codigoPropiedad);
  Write('Precio m2:'); ReadLn(preciom2);
  p.precioTotal := preciom2 * cantidadm2;
end;
procedure insertarOrdenado(var l : lista;p : propiedad);
var
  actual, anterior, nuevo : lista;
begin
    new(nuevo);
    nuevo^.num := p;
    actual := l;
    anterior := l;
    while (actual <> Nil) and (actual^.num < nuevo^.dato.tipoPropiedad) do begin
        anterior := actual;
        actual := actual^.sig;
    end;
    if (actual = anterior) then 
        l := nuevo
    else
        anterior^.sig := nuevo;
    nuevo^.sig := actual;
end;
procedure CargarLista(var v : vector);
var
  p : propiedad;
  zona : rangoZona;
  cantidadm2 : integer;
  preciom2 : real;
begin
  leerPropiedad(p,zona,cantidadm2,preciom2);
  while (preciom2 <> -1) do begin
    insertarOrdenado(v[zona],p);
    leerPropiedad(p,zona,cantidadm2,preciom2);
  end;
end;

procedure procesarLista(v : vector;zona : rangoZona;tipoPropiedad : integer);
var
  aux : lista;
begin
  aux := v[zona];
  while (aux <> Nil) do begin
    if (aux^.dato.tipoPropiedad = tipoPropiedad) then
      WriteLn(aux^.dato.codigoPropiedad);
    aux := aux^.sig;
  end;
end;

procedure inicializarVector(var v : vector);
var
  i : integer;
begin
  for i := 1 to 5 do
    v[i] := Nil;
end;

var
  v : vector;
  zona : rangoZona;
  tipoPropiedad : integer;
begin
  inicializarVector(v);
  CargarLista(v);
  ReadLn(zona);
  ReadLn(tipoPropiedad);
  procesarLista(v,zona,tipoPropiedad);
End.
{2.- Implementar un programa que procese información de propiedades que están a la venta en una inmobiliaria.
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza
cuando se ingresa el precio del metro cuadrado -1.
b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido.}