program ejercicio3;
type
  subrangoPeliculas = 1..8;
  pelicula = record
    codigoPelicula: integer;
    codigoGenero: subrangoPeliculas;
    puntajePromedio: real;
  end;
  lista = ^nodo;
  nodo = record
    dato: pelicula;
    sig: lista;
  end;
  vector = array[subrangoPeliculas] of lista;
  vectorMaximo = array[subrangoPeliculas] of integer;
procedure leerPelicula(var p: pelicula);
begin
  write('Codigo pelicula: ');{eadLn(p.codigoPelicula);}p.codigoPelicula := Random(100)-1;
  write('Codigo genero: ');{ReadLn(p.codigoGenero);}p.codigoGenero := random(8)+1;
  WriteLn('Puntaje promedio: ');{ReadLn(p.puntajePromedio);}p.puntajePromedio := random(10);
end;

procedure inicializarVectorListas(v: vector);
var
  i: integer;
begin
  for i := 1 to 8 do
    v[i] := Nil;
end;

procedure agregarAtras(var l: lista;p: pelicula);
var
  nuevo, aux: lista;
begin
  new(nuevo);
  nuevo^.dato := p;
  nuevo^.sig := Nil;
  if(l = Nil) then
    l := nuevo
  else begin
    aux := l;
    while(aux^.sig <> Nil) do
      aux := aux^.sig;
    aux^.sig := nuevo;
  end;
end;

procedure cargarVector(var v: vector);
var
  p: pelicula;
begin
  leerPelicula(p);
  while(p.codigoPelicula <> -1) do begin
    agregarAtras(v[p.codigoGenero],p);
    leerPelicula(p);
  end;
end;

procedure cargarvectorMaximo(var vm: vectorMaximo;vp: vector);
var
  i: integer;
  maximo: real;
begin
  for i := 1 to 8 do begin
    maximo := -1;
    while(vp[i] <> Nil) do begin
      if(maximo < vp[i]^.dato.puntajePromedio) then begin
        maximo := vp[i]^.dato.puntajePromedio;
        vm[i] := vp[i]^.dato.codigoPelicula;
      end;
      vp[i] := vp[i]^.sig;
    end;
    WriteLn(maximo:2:2,' ',vm[i]);
  end;
end;

procedure seleccion(var v: vectorMaximo);
var
  i,j,pos: integer;
  item: integer;
begin
  for i := 1 to 7 do begin
    pos := i;
    for j := i+1 to 8 do
      if(v[j] < v[pos]) then
        pos := j;
    item := v[pos];
    v[pos] := v[i];
    v[i] := item;
  end;
end;

var
  vm: vectorMaximo;
  v: vector;
begin
  randomize;
  cargarVector(v);
  WriteLn;
  WriteLn;
  WriteLn;
  cargarvectorMaximo(vm,v);
  seleccion(vm);
  WriteLn('Mayor puntaje:', vm[1]);
  WriteLn('menor puntaje:', vm[8]);
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