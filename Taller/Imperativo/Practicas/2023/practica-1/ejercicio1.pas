program ejercicio1;
type
  rangoDias = 0..31;
  venta = record
    dia : rangoDias;
    codigoVenta : 1..15;
    cantidadVendida : 1..99;
  end;
  vectorVentas = array[1..50] of venta;

procedure leerVenta(var v: venta);
begin
  Write('Dia: ');ReadLn(v.dia);
  v.codigoVenta := Random(99);
  ReadLn(v.cantidadVendida);
end;

procedure leerVector(vv: vectorVentas;dimL: Integer); //B
var
  i : Integer;
begin
  for i := 1 to dimL do begin
    WriteLn(vv[i].dia);
    WriteLn(vv[i].codigoVenta);
    WriteLn(vv[i].cantidadVendida);
    WriteLn;
  end;
end;

procedure cargarVector(var vv: vectorVentas; var dimL: Integer); //A
begin
  dimL := dimL + 1;
  leerVenta(vv[dimL]);
  while((vv[dimL].dia <> 0) and (dimL < 50)) do begin
    dimL := dimL + 1;
    leerVenta(vv[dimL]);
  end;
end;

procedure seleccionVector(var vv: vectorVentas;dimL: Integer);
var
  i, j, p : integer;
  aux : venta;
begin
  for i := 1 to dimL-1 do begin
    p := i;
    for j := i+1 to dimL do
      if(vv[j].codigoVenta < vv[p].codigoVenta) then
        p := j;
    aux := vv[p];
    vv[p] := vv[i];
    vv[i] := aux;
  end;
end;

procedure eliminar(var vv:vectorVentas; var dimL: integer;codigo1, codigo2 : integer);
var
  i,eliminar,pos : integer;
begin
  eliminar := 0;
  pos := 1;
  while(pos < dimL) and (vv[pos].codigoVenta < codigo1) do
    pos := pos + 1;
  while(pos < dimL) and (vv[pos].codigoVenta <= codigo2) do begin
    pos := pos+1;
    eliminar := eliminar +1;
  end;
  for i := dimL downto pos do begin
    vv[i-eliminar] := vv[i];
    dimL := dimL - 1;
  end;
end;

procedure cargarVectorPares(vv:vectorVentas;dimL:integer; var dimLPares : integer; var vp : vectorVentas);
var
  i : Integer;
begin
  for i := 1 to dimL do begin
    if (vv[i].codigoVenta mod 2 = 0) then begin
      dimLPares := dimLPares + 1;
      vp[dimLPares] := vv[i];
    end;
  end;
end;
var
  dimL, dimLPares : integer;
  vv,vp : vectorVentas;
  codigo1, codigo2 : integer;
begin
  Randomize;
  dimL := 0;
  cargarVector(vv,dimL); //A
  leerVector(vv,dimL); //B
  seleccionVector(vv,dimL); //C
  leerVector(vv,dimL); //D
  Write('Codigo1: ');ReadLn(codigo1);
  Write('Codigo2: ');ReadLn(codigo2);
  eliminar(vv,dimL,codigo1,codigo2); //E
  leerVector(vv,dimL);//F
  dimLPares := 0;
  cargarVectorPares(vv,dimL,dimLPares,vp); //G
  leerVector(vp,dimLPares);

end.
{1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).}