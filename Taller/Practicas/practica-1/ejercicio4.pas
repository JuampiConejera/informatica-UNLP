program ejercicio4;
type
  rangoRubro = 1..8;
  producto = record
    codigo : integer;
    rubro : rangoRubro;
    precio : real;
  end;
  lista = ^nodo;
  nodo = record
    dato : producto;
    sig : lista;
  end;
  vectorProducto = array[rangoRubro] of lista;
  vectorRubro = array[1..30] of producto;

procedure inicializarVector(var v: vectorProducto);
var
  i : Integer;
begin
  for i := 1 to 8 do
    v[i] := Nil;
end;

procedure leerProducto(var p: producto);
begin
  Write('Codigo: ');ReadLn(p.codigo);
  Write('Rubro: ');ReadLn(p.rubro);
  Write('Precio: ');ReadLn(p.precio);
end;

procedure insertarOrdenado(var l: lista;p: producto);
var
  actual, anterior, nuevo : lista;
begin
  New(nuevo);
  nuevo^.dato := p;
  actual := l;
  anterior := l;
  while(l <> Nil) and (p.codigo > actual^.dato.codigo) do begin
    anterior := actual;
    actual := actual^.sig;
  end;
  if(actual = anterior) then
    l := nuevo
  else
    anterior^.sig := actual;
  nuevo^.sig := actual;
end;

procedure cargarListas(var v: vectorProducto);
var
  p : producto;
begin
  leerProducto(p);
  while(p.precio <> 0) do begin
    insertarOrdenado(v[p.rubro],p);
    leerProducto(p);
  end;
end;

procedure imprimirVectorProducto(v: vectorProducto);
var
  i : integer;
begin
  for i := 1 to 8 do begin
    while(v[i] <> Nil) do begin
      WriteLn(v[i]^.dato.codigo);
      WriteLn(v[i]^.dato.rubro);
      WriteLn(v[i]^.dato.precio);
    end;
  end;
end;

procedure generarVector(l: lista; var vr: vectorRubro;var dimL: integer);
var
  i : integer;
begin
  i := 1;
  while((l <> Nil) and (i <= 30)) do begin
    vr[i] := l^.dato;
    dimL := dimL + 1;
    l := l^.sig;
  end;
end;

procedure insercion(var v: vectorRubro;dimL: integer);
var
  i,j : integer;
  actual : producto;
begin
  for i := 2 to dimL - 1 do begin
    actual := v[i];
    j := i-1;
    while((j > 0) and (v[j].precio > actual.precio)) do begin
      v[j+1] := actual;
      j := j - 1;
    end;
    v[j+1] := actual;
  end;
end;

procedure imprimirVectorRubro(v: vectorRubro;dimL: integer);
var
  i : integer;
begin
  for i := 1 to dimL do begin
    WriteLn(v[i].codigo);
    WriteLn(v[i].rubro);
    WriteLn(v[i].precio);
  end;
end;

procedure calcularPromedio(v: vectorRubro;dimL: integer);
var
  total : real;
  i : integer;
begin
  for i := 1 to dimL do begin
    total := total + v[i].precio;
  end;
  WriteLn(total/dimL);
end;

var
  vp : vectorProducto;
  vr : vectorRubro;
  dimL : integer;
begin
  inicializarVector(vp);
  cargarListas(vp); //A
  imprimirVectorProducto(vp); //B
  dimL := 0;
  generarVector(vp[3],vr,dimL); //C
  insercion(vr,dimL); //D
  imprimirVectorRubro(vr,dimL); //E
  calcularPromedio(vr,dimL); //F
end.
{4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}

