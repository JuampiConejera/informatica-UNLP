program ejercicio3;
const
  dimF = 8;
type
  subrangoPeliculas = 1..dimF;
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
  VectorMaximo = array[subrangoPeliculas] of pelicula;
procedure leerPelicula(var p: pelicula);
begin
  write('Codigo pelicula: ');{eadLn(p.codigoPelicula);}p.codigoPelicula := Random(100)-1;
  write('Codigo genero: ');{ReadLn(p.codigoGenero);}p.codigoGenero := random(8)+1;
  WriteLn('Puntaje promedio: ');{ReadLn(p.puntajePromedio);}p.puntajePromedio := random(3000);
end;

procedure inicializarVectorListas(v: vector);
var
  i: integer;
begin
  for i := 1 to dimF do
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

procedure cargarVectorMaximo(var vm: vectorMaximo;vp: vector);
var
  i: integer;
  maximo: real;
begin
  for i := 1 to dimF do begin
    vm[i].puntajePromedio := -1;
    while(vp[i] <> Nil) do begin
      if(vm[i].puntajePromedio < vp[i]^.dato.puntajePromedio) then begin
        vm[i] := vp[i]^.dato;
      end;
      vp[i] := vp[i]^.sig;
    end;
    writeln;
    WriteLn(maximo:0:2, ' ',vm[i].codigoPelicula,' ',vm[i].codigoGenero);
  end;
end;

procedure seleccion(var v: vectorMaximo);
var
  i,j,pos: integer;
  item: pelicula;
begin
  for i := 1 to dimF-1 do begin
    pos := i;
    for j := i+1 to dimF do
      if(v[j].puntajePromedio > v[pos].puntajePromedio) then
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
  cargarVectorMaximo(vm,v);
  seleccion(vm);
  WriteLn('Mayor puntaje: ',vm[1].puntajePromedio:0:1,'. Codigo pelicula: ',vm[1].codigoPelicula);
  WriteLn('Menor puntaje: ',vm[8].puntajePromedio:0:1,'. Codigo pelicula: ',vm[8].codigoPelicula);
end.