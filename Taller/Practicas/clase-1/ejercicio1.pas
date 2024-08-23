program ejercicio1;
const
  dimF = 50;
type
  dias = 0..31;
  rango1 = 0..15;
  rango2 = 1.99;
  rango3 = 0..dimF;
  venta = record
    dia: dias;
    codigoP: rango1;
    cantidad: rango2;
  end;
  vector = array[1..dimF] of venta;
  elemento = record
    codigoP: rango1;
    cantTotal: integer;
  end;
  lista = ^nodo;
  nodo = record
    dato: elemento;
    sig: lista;
  end;

procedure AlmacenarInformacion(var v: vector;var dimL: rango3);
  procedure leerVenta(var v: venta);
  begin
    Randomize;
    write('Dia: ');
    v.dia := random(32);
    WriteLn(v.dia);
    if(v.dia <> 0) then begin
      write('Codigo de producto: ');
      v.codigoP := random(16) + 1;
      WriteLn(v.codigoP);
      write('Ingrese cantidad (entre 1 y 99): ');
      ReadLn(v.cantidad);
    end;
  end;

var
  unaVenta: venta;
begin
  dimL := 0;
  leerVenta(unaVenta);
  while(unaVenta.dia <> 0) and (dimL < dimF) do begin
    dimL := dimL + 1;
    v[dimL] := unaVenta;
    leerVenta(unaVenta);
  end;
end;

procedure imprimirVector(v: vector; dimL: rango3);
var
  i: integer;
begin
  write('         -');
  for i := 1 to dimL do
    write('-----');
    WriteLn;
    write('  Codigo:| ');
    for i:= 1 to dimL do begin
      if(v[i].codigoP <= 9) then
        write('0');
      write(v[i].codigoP, ' | ');
    end;
    writeLn;
    writeLn;
end;

procedure ordenar(var v: vector;dimL: rango3);
var
  i, j, pos: rango3; item: venta;
begin
  for i := 1 to dimL - 1 do begin
    pos := i;
    for j := i+1 to dimL do
      if(v[j].codigoP < v[pos].codigoP) then
        pos := j;
    item := v[pos];
    v[pos] := v[i];
    v[i] := item;
  end;
end;

procedure Eliminar(var v: vector; var dimL: rango3; valorInferior, valorSuperior: rango1);
  function buscarPosicion(v: vector; dimL: rango3; elemABuscar: rango1): rango3;
  var
    pos: rango3;
  begin
    pos := 1;
    while(pos <= dimL) and (elemABuscar > v[pos].codigoP) do
      pos := pos + 1;
    if(pos > dimL) then
      buscarPosicion := 0
    else
      buscarPosicion := pos;
  end;

  function buscarPosicionDesde(v: vector; dimL, pos: integer; elemABuscar: rango1): rango3; 
  begin
    while(pos <= dimL) and (elemABuscar >= v[pos].codigoP) do
      pos := pos + 1;
    if(pos > dimL) then
      buscarPosicion := dimL
    else
      buscarPosicionDesde := pos - 1;
  end;

  var
    posInferior, posSuperior, salto, i: rango3;
  begin
    posInferior := buscarPosicion(v,dimL,valorInferior);
    if(posInferior <> 0) then begin
      posSuperior := buscarPosicionDesde(v,dimL,posInferior,valorSuperior);
        {escribir el codigo correspondiente para hacer el corrimiento y dismunir la dimension logica}
      end;
  end;

procedure generarLista(v: vector; dimL: rango3; var l: lista);
  procedure AgregarAtras(var l, ult: lista; elem: elemento);
  begin
    {completar}
  end;

var
  i: rango3; ult: lista; e: elemento;
begin
  l := Nil;
  ult := Nil;
  i := 1;
  while((i <= dimL) and (e.codigoP = v[i].codigoP)) do begin
    e.cantTotal := e.cantTotal + v[i].cantidad;
    i := i + 1;
    end;
    AgregarAtras(l,ult,e);
  end;

procedure imprimirLista(l: lista);
begin
  {completar}
end;

var
  v: vector;
  dimL: rango3;
  valorInferior, valorSuperior: rango1;
  l: lista;
begin
  AlmacenarInformacion(v,dimL);
  WriteLn;
  if(dimL = 0) then
    writeln('--- Vector sin elementos ---')
  else begin
    WriteLn;
    imprimirVector(v,dimL);
    WriteLn;
    WriteLn('--- Vector ordenado --->');
    WriteLn;
    ordenar(v,dimL);
    imprimirVector(v,dimL);
    {write ('Ingrese valor inferior: ');
    readln (valorInferior);
    write ('Ingrese valor superior: ');
    readln (valorSuperior);
    Eliminar (v, dimL, valorInferior, valorSuperior);
    if (dimL = 0) then writeln ('--- Vector sin elementos, luego de la eliminacion ---')
    else begin
    writeln;
    writeln ('--- Vector luego de la eliminacion --->');
    writeln;
    ImprimirVector (v, dimL);
    GenerarLista (v, dimL, L);
    if (L = nil) then writeln ('--- Lista sin elementos ---')
    else begin
    writeln;
    writeln ('--- Lista obtenida --->');
    writeln;
    ImprimirLista (L);
    end;
    end;}
  end; 
end.
{1.- Descargar el programa ImperativoEjercicioClase1.pas que contiene parte del código del 
siguiente enunciado a resolver. Implementar lo indicado en el código.
Se desea procesar la información de las ventas de productos de un comercio (como máximo 
50). 
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce 
el día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 
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
h. Un módulo que muestre la información obtenida en el punto g).
}