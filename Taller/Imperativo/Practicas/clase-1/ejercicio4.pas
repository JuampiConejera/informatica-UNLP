program ejercicio4;
type
  subrangoRubro = 1..8;
  producto = record
    codigoProducto: integer;
    codigoRubro: subrangoRubro;
    precio: real;
  end;
  lista = ^nodo;
  nodo = record
    dato: producto;
    sig: lista;
  end;
  vector = array[subrangoRubro] of lista;
  vectorRubroTres = array[1..30] of producto;
procedure inicializarVector(var v: vector);
var
  i: integer;
begin
  for i := 1 to 8 do begin
    v[i] := Nil;
  end;
end;

procedure leerProducto(var p: producto);
begin
  Write('Codigo Producto: ');{ ReadLn(p.codigoProducto);}p.codigoProducto := random(100);
  Write('Codigo Rubro: '); {ReadLn(p.codigoRubro);}p.codigoRubro := random(8)+1;
  Write('Precio: '); {ReadLn(p.precio);}p.precio := random(150);
end;

procedure insertarOrdenado(var l: lista; p: producto);
var
  actual, nuevo, anterior: lista;
begin
  New(nuevo);
  nuevo^.dato := p;
  actual := l;
  anterior := l;
  while((actual <> Nil) and (p.codigoProducto > actual^.dato.codigoProducto)) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = anterior) then
    l := nuevo
  else
    anterior^.sig := nuevo;
  nuevo^.sig := actual;
end;

procedure cargarVector(var v: vector);
var
  p: producto;
begin
  leerProducto(p);
  while(p.precio <> 0) do begin
    insertarOrdenado(v[p.codigoRubro],p);
    leerProducto(p);
  end;
end;

procedure imprimirVector(v: vector);
var
  i: integer;
begin
  for i := 1 to 8 do begin
    WriteLn('Rubro ',i);
    while(v[i] <> Nil) do begin
      WriteLn(v[i]^.dato.codigoProducto);
      v[i] := v[i]^.sig;
    end;
  end;
end;

procedure cargarVectorRubro(var vrt: vectorRubroTres;var dimL: integer; l: lista);
begin
  while((l <> Nil) and (dimL < 30)) do begin
    dimL += 1;
    vrt[dimL] := l^.dato;
    l := l^.sig;
  end;
end;

procedure insercion(var v: vectorRubroTres;dimL: integer);
var
  i, j: integer;
  actual: producto;
begin
  for i := 2 to dimL do begin
    actual := v[i];
    j := i-1;
    while((j > 0) and (v[j].precio > actual.precio)) do begin
      v[j+1] := v[j];
      j := j - 1;
    end;
    v[j+1] := actual;
  end;
end;

procedure imprimirVectorRubro(v: vectorRubroTres;dimL: integer);
var
  i: integer;
begin
  for i := 1 to dimL do
    WriteLn(v[i].precio:0:2);
end;

procedure promedio(var v: vectorRubroTres;dimL: integer);
var
  cant, i: integer;
  suma: real;
begin
  cant := 0;
  suma := 0;
  for i := 1 to dimL do begin
    cant += 1;
    suma += v[i].precio;
  end;
  WriteLn('El precio promedio es: ',suma/cant:0:2);
end;

var
  v: vector;
  vrt: vectorRubroTres;
  dimL: integer;
begin
  randomize;
  inicializarVector(v);
  dimL := 0;
  cargarVector(v);
  imprimirVector(v);
  cargarVectorRubro(vrt,dimL,v[3]);
  insercion(vrt,dimL);
  WriteLn;
  WriteLn;
  imprimirVectorRubro(vrt,dimL);
  WriteLn;
  WriteLn;
  promedio(vrt,dimL);
end.
{4.- Una librería requiere el procesamiento de la información de sus productos. De cada 
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría. 
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d)}