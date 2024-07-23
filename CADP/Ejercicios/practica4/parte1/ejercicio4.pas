program ejercicio4;
const
  dimF = 100;
type
  rangoDimF = 1..dimF;
  vector = array[rangoDimF] of integer;

procedure inicializarVector(var v: vector); //se dispone
begin
  
end;
function posicion(v: vector;num: integer) : integer;
var
  i: integer;
begin
  posicion := -1;
  for i := 1 to dimF do begin
    if(v[i] = num) then
      posicion := i;
  end;
end;

procedure intercambio(var v: vector; numX,numY: rangoDimF);
var
  aux: integer;
begin
  aux := v[numX];
  v[numX] := v[numY];
  v[numY] := v[numX];
end;

function sumaVector(v: vector) : integer;
var
  i : integer;
begin
  sumaVector := 0;
  for i := 1 to dimF do begin
    sumaVector := sumaVector + v[i];
  end;
end;

function promedio(v: vector) : real;
begin
  promedio := sumaVector(v) / dimF;
end;

procedure maximo(v: vector;var max: integer);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    if(v[i] > max) then
      max := v[i];
  end;
end;  

procedure minimo(v: vector;var min: integer);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    if(v[i] < min) then
      min := v[i];
  end;
end;

var
  v: vector;
  min,max,numX,numY,num: integer;
begin
  inicializarVector(v);
  ReadLn(num);
  posicion(v,num);
  ReadLn(numX);
  ReadLn(numY);
  intercambio(v,numX,numY);
  sumaVector(v);
  promedio(v);
  max := -1;
  maximo(v,max);
  min := 99999;
  minimo(v,min);
end.
{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho
vector, o el valor -1 en caso de no encontrarse.
b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo
vector donde se intercambiaron los valores de las posiciones x e y.
c. sumaVector: retorna la suma de todos los elementos del vector.
d. promedio: devuelve el valor promedio de los elementos del vector.
e. elementoMaximo: retorna la posición del mayor elemento del vector
f. elementoMinimo: retorna la posicion del menor elemento del vector}