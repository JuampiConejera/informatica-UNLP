program ejercicio3;
type
  rangoGenero = 1..8;
  rangoPuntaje =   0..10;
  pelicula = record
    codigo : integer;
    genero : rangoGenero;
    puntaje : rangoPuntaje;
  end;
  lista = ^nodo;
  nodo = record
    dato : pelicula;
    sig : lista;
  end;
  vectorGeneros = array[rangoGenero] of lista;
  vectorPromedios = array[rangoGenero] of Integer;

procedure leerPelicula(var p: pelicula);
begin
  Write('codigo: ');ReadLn(p.codigo);
  p.genero := Random(8);
  p.puntaje := Random(10);
end;

procedure agregarAtras(var l: lista; p: pelicula);
var
  nuevo,act : lista;
begin
  New(nuevo);
  nuevo^.dato := p;
  nuevo^.sig := Nil;
  if(l <> Nil) then begin
    act := l;
    while (act^.sig <> Nil) do
      act := act^.sig;
    act^.sig := act;
  end
  else
    l := act;
end;

procedure cargarLista(var v: vectorGeneros);
var
  p : pelicula;
begin
  leerPelicula(p);
  while(p.codigo <> -1) do begin
    agregarAtras(v[p.genero],p);
    leerPelicula(p);
  end;
end;

procedure inicializarVector(var v : vectorGeneros);
var
  i : integeR;
begin
  for i := 1 to 8 do
    v[i] := nil;
end;

procedure maximo(l : lista;var codigo : integer);
var
  max : integer;
begin
  max := -9999;
  while(l <> Nil) do begin
    if(l^.dato.puntaje > max) then begin
      max := l^.dato.puntaje;
      codigo := l^.dato.codigo;
    end;
    l := l^.sig;
  end;
end;

procedure maximoVector(vg : vectorGeneros;var vp : vectorPromedios;var dimLPromedios : Integer);
var
  i : integer;
begin
  for i := 1 to 8 do begin
    if(vg[i] <> Nil) then begin
      maximo(vg[i],vp[i]);
      dimLPromedios := dimLPromedios + 1;
    end;
  end;
end;

procedure seleccion(var v:vectorPromedios; dimLPromedios : integer);
var
  i,j,p,item : integer;
begin
  for i := 1 to dimLPromedios-1 do begin
    p := i;
    for j := i+1 to dimLPromedios do
      if(v[j] < v[p]) then
        p := j;
      item := v[p];
      v[p] := v[i];
      v[i] := item;
  end;
end;

procedure imprimir(vp : vectorPromedios; dimLPromedios : Integer);
var
  i : integer;
begin
  for i := 1 to dimLPromedios do
    writeln(vp[i]);
end;

var
  vg : vectorGeneros;
  vp : vectorPromedios;
  dimLPromedios : integer;
begin
  Randomize;
  inicializarVector(vg);
  cargarLista(vg);
  dimLPromedios := 0;
  maximoVector(vg,vp,dimLPromedios);
  seleccion(vp,dimLPromedios);
  imprimir(vp,dimLPromedios);
  WriteLn('hola');
end.

{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}