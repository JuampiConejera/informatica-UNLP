program parcialF;
type
	rangoMaterial = 1..8;
	artesania = record
		id: integer;
		dni: integer;
		codigoMaterial: rangoMaterial;
	end;
	
	datoArbol = record
		dni: integer;
		cant: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: datoArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	datoVector = record
		cod: integer;
		cant: integer;
	end;
	
	vector = array[rangoMaterial] of datoVector;
	

	
procedure leerArtesania(var a: artesania);
begin
	a.dni := random(1000);
	if(a.dni <> 0) then begin
		a.id := random(1000);
		a.codigoMaterial := random(8)+1;
	end;
end;
	
procedure agregarNodo(var a: arbol; art: artesania);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.dni := art.dni;
		a^.dato.cant := 1;
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(a^.dato.dni = art.dni) then
			a^.dato.cant := a^.dato.cant + 1
		else if(art.dni < a^.dato.dni) then
			agregarNodo(a^.HI,art)
		else
			agregarNodo(a^.HD,art);
	end;
end;
	
procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i := 1 to 8 do begin
		v[i].cod := i;
		v[i].cant := 0;
	end;
end;	
	
procedure moduloA(var a: arbol; var v: vector);
var
	art: artesania;
begin
	leerArtesania(art);
	while(art.dni <> 0) do begin
		agregarNodo(a,art);
		leerArtesania(art);
		v[art.codigoMaterial].cant := v[art.codigoMaterial].cant + 1;
	end;
end;

function moduloB(a: arbol;dni: integer) : integer;
begin
	if(a = nil) then
		moduloB := 0
	else begin
		if(a^.dato.dni < dni) then
			moduloB := 1 + moduloB(a^.HI,dni) + moduloB(a^.HD,dni)
		else
			moduloB := moduloB(a^.HD,dni);
	end;
end;

procedure moduloC(var v: vector;var max: string);
var
	i,j: integer;
	actual: datoVector;
begin
	for i := 2 to 8 do begin
		actual := v[i];
		j := i - 1;
		if((j > 0) and (v[j].cant > actual.cant)) then begin
			v[j+1] := v[j];
			j := j - 1;
		end;
		v[j+1] := actual;
	end;
	if(v[8].cod = 1) then
		max := 'Madera'
	else if(v[8].cod = 2) then
		max := 'Yeso'
	else if(v[8].cod = 3) then
		max := 'Ceramica'
	else if(v[8].cod = 4) then
		max := 'Vidrio'
	else if(v[8].cod = 5) then
		max := 'Acero'
	else if(v[8].cod = 6) then
		max := 'Porcelana'
	else if(v[8].cod = 7) then
		max := 'Lana'
	else
		max := 'Carton';
end;

var
	v: vector;
	a: arbol;
	max: string;
	dni: integer;
begin
	a:= nil;
	inicializarVector(v);
	moduloA(a,v);
	readln(dni);
	moduloB(a,dni);
	moduloC(v,max);
end.
{La feria del Artesano necesita un sistema para obtener estadisticas sobre las artesanias presentadas.
* a) implementar un modulo que lea informacion de las artesanias. De cada artesania se conoce: numero de identificacion de la artesania, DNI del artesano y codigo del material base (1: madera, 2: yeso, 3: ceramica, 4: vidrio, 5: acero, 6: porcelana, 7: lana, 8: carton). La lectura finaliza con el valor 0 para el DNI. Se sugiere utilizar el modulo leerArtesania(). El modulo deber retornar dos estructuras:
* 	i) un arbol binario de busqueda ordenado por DNI del artesano. Para cada DNI del artesano debe almacenarse la cantidad de artesanias correspondiente al DNI.
* 	ii) Un vector que almacene para cada material base, el codigo del amterial base y la cantidad de artesanias del material base.
* b) implementar un modulo que reciba el arbol generado en a) y un DNI. El modulo debe retornar la cantidad de artesanos con DNI menor al DNI ingresado.
* c) Implementar un modulo que reciba el vector generado en a), lo ordene por cantidad de artesanias de menor a mayor y retorne el nombre de material base con mayor cantidad de artesanias.}
