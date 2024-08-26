program ejercicio3;
const
	dimF = 20;
type
	vector = array[1..dimF] of integer;

procedure cargarVector(var v: vector;var dimL: integer);
begin
	dimL += 1;
	if(dimL <= dimF) then begin
		v[dimL] := random(1251)+300;
		cargarVector(v,dimL);
	end;
end;

procedure insercion(var v: vector);
var
	i, j, actual: integer;
begin
	for i := 2 to dimF do begin
		actual := v[i];
		j := i-1;
		while((j > 0) and (v[j] < actual)) do begin
			v[j+1] := v[j];
			j := j - 1;
		end;
		v[j+1] := actual;
	end;
end;

procedure imprimirVector(v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do
		WriteLn(v[i]);
end;

procedure busquedaDicotomica(v: vector; ini,fin: integer;dato: integer;var pos: integer);
var
	medio: integer;
begin
	pos := -1;
	medio := (ini + fin) div 2;
	while((ini <= fin) and (dato <> v[medio])) do begin
		if(dato < v[medio]) then
			fin := medio-1
		else
			ini := medio+1;
		medio := (ini + fin) div 2;
	end;
	if((ini <= fin) and (dato = v[medio])) then
		pos := medio;
end;

var
	v: vector;
	ini, fin, dato, pos, dimL: integer;
begin
	dimL := 0;
	cargarVector(v,dimL);
	imprimirVector(v);
	WriteLn;
	insercion(v);
	imprimirVector(v);
	ini := 1;
	fin := dimF;
	write('Valor a buscar: ');ReadLn(dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	WriteLn(pos);
end.
{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300 y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
}