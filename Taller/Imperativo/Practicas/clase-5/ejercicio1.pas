program ejercicio1;
const
	dimF = 300;
type
	oficina = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vector = array[1..dimF] of oficina;
	
procedure leerOficina(var o: oficina);
begin
	o.codigo := random(30);//readln(o.codigo);
	o.dni := random(100);//readln(o.dni);
	o.valor := random(3);//readln(o.valor);
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
	o: oficina;
begin
	leerOficina(o);
	while(o.codigo <> 0) do begin
		dimL := dimL + 1;
		v[dimL] := o;
		leerOficina(o);
	end;
end;

procedure insercion(var v: vector; diml: integer);
var
	i,j: integer;
	actual: oficina;
begin
	for i := 2 to dimL do begin
		actual.codigo := v[i].codigo;
		j := i - 1;
		while((j > 0) and (v[j].codigo > actual.codigo)) do begin
			v[i+1] := v[j];
			j := j - 1;
		end;
		v[j+1] := actual;
	end;
end;

procedure seleccion(var v: vector;diml: integer);
var
	i,j,pos: integer;
	item: oficina;
begin
	for i := 1 to dimL-1 do begin
		pos := i;
		for j := i+1 to diml do
			if(v[j].codigo < v[pos].codigo) then
				pos := j;
		item := v[pos];
		v[pos] := v[i];
		v[i] := item;
	end;
end;

procedure busquedaDicotomica(v: vector; ini,fin,dato: integer; var pos: integer);
var
	medio: integer;
begin
	medio := (fin + ini) DIV 2;
	while((fin >= ini) and (v[medio].codigo <> dato)) do begin
		if (dato > v[medio].codigo) then
			ini := medio + 1
		else
			fin := medio - 1;
		medio := (fin + ini) DIV 2;
	end;
	if(fin >= ini) then
		pos := medio
	else
		pos := -1;
end;

procedure busquedaDicotomicaRecursiva(v: vector; ini,fin,dato: integer; var pos: integer);
var
	medio: integer;
begin
	if(ini > fin) then
		pos := -1
	else begin
		medio := (fin - ini) DIV 2;
		if(v[medio].codigo = dato) then
			pos := medio
		else if( v[medio].codigo > dato) then
			busquedaDicotomicaRecursiva(v,ini,medio-1,dato,pos)
		else
			busquedaDicotomicaRecursiva(v,medio+1,fin,dato,pos);
	end;
end;

function moduloD(v: vector; dimL,pos: integer) : real;
begin
	if(pos <= dimL) then begin
		moduloD := v[pos].valor + moduloD(v,dimL,pos+1);
	end;
end;

procedure imprimirVector(v: vector;diml: integer);
var
	i: integer;
begin
	for i := 1 to diml do
		writeln(v[i].codigo, '	 ', v[i].valor);
end;

var
	v: vector;
	cod,pos,diml: integer;
begin
	cargarVector(v,diml);
	imprimirVector(v,diml);
	writeln;
	writeln;
	writeln;
	insercion(v,diml);
	imprimirVector(v,diml);
	writeln;
	writeln;
	seleccion(v,diml);
	writeln;
	writeln;
	imprimirVector(v,diml);
	readln(cod);
	busquedaDicotomica(v,1,diml,cod,pos);
	writeln('CODIGO BUSQUEDA DICOTOMICA ITERATIVA: ',pos);
	busquedaDicotomicaRecursiva(v,1,diml,cod,pos);
	writeln('CODIGO BUSQUEDA DICOTOMICA RECURSIVA: ',pos);
	writeln('MODULO D: ',moduloD(v,diml,1));
	
end.
{1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}
