program ejercicio3;
const
	dimF = 20;
type
	indice = -1..20;
	vector = array[1..dimF] of integer;

procedure cargarVector(var v: vector;pos: integer);
begin
	if(pos > 0) then begin
		v[pos] := random(1251)+300;
		cargarVector(v,pos-1);
	end;
end;

procedure insercion(var v: vector);
var
	i, j, actual: integer;
begin
	for i := 2 to dimF do begin
		actual := v[i];
		j := i-1;
		while((j > 0) and (v[j] > actual)) do begin
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

{Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var
	medio: indice;
begin
	medio:= (fin + ini) DIV 2;
	while ((fin >= ini) AND (v[medio] <> dato)) do begin
		if (dato > v[medio]) then
			ini:= medio + 1
		else
			fin:= medio - 1;
		medio:= (fin + ini) DIV 2;
	end;
	if (fin >= ini) then
		pos:= medio
	else
		pos:= -1;
end;}


procedure busquedaDicotomica(v: vector; ini,fin: indice;dato: integer;var pos: indice);
var
	medio: indice;
begin
		if(ini > fin) then
			pos := -1
		else begin
			medio := (ini + fin) div 2;
			if(v[medio] = dato) then begin
				pos := medio;
				WriteLn('entra1');
			end
			else if(v[medio] > dato) then begin
				WriteLn('entra2');
				busquedaDicotomica(v,ini,medio-1,dato,pos)
			end
			else begin
				WriteLn('entra3');
				busquedaDicotomica(v,medio+1,fin,dato,pos);
				end;
		end;
end;

var
	v: vector;
	dato: integer;
	pos: indice;
begin
	cargarVector(v,dimF);
	imprimirVector(v);
	WriteLn;
	insercion(v);
	imprimirVector(v);
	write('Valor a buscar: ');ReadLn(dato);
	busquedaDicotomica(v,1,dimF,dato,pos);
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