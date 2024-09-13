Program parcialE;
type
	rangoGenero = 1..7;
	libro = record
		isbn: integer;
		codigoAutor: integer;
		genero: rangoGenero;
	end;
	
	datoArbol = record
		codigoAutor: integer;
		cant: integer;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: datoArbol;
		HI: arbol;
		HD: arbol;
	end;
	datoVector = record
		genero: rangoGenero;
		cant: integer;
	end;
	vector = array[rangoGenero] of datoVector;
	
	
	
procedure leerLibro(var l: libro);
begin
	l.isbn := random(100);
	if(l.isbn <> 0) then begin
		l.codigoAutor := random(1000);
		l.genero := random(7) + 1;
	end;
end;
	
procedure cargarArbol(var a: arbol;l: libro);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codigoAutor := l.codigoAutor;
		a^.dato.cant := 1;
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(a^.dato.codigoAutor = l.codigoAutor) then
			a^.dato.cant := a^.dato.cant + 1
		else if(l.codigoAutor < a^.dato.codigoAutor) then
			cargarArbol(a^.HI,l)
		else
			cargarArbol(a^.HD,l);
	end;
end;
	
	
procedure moduloA(var a: arbol;var v: vector);
var
	l: libro;
begin
	leerLibro(l);
	while(l.isbn <> 0) do begin
		cargarArbol(a,l);
		v[l.genero].cant := v[l.genero].cant + 1;
		leerLibro(l);
	end;
end;

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i := 1 to 7 do begin
		v[i].genero := i;
		v[i].cant := 0;
	end;
end;

procedure moduloB(var v: vector;var stringMax: string);
var
	i,j: integer;
	actual: datoVector;
	vectorNombre: array[rangoGenero] of string = ('literario','filosofia','biologia','arte', 'computacion', 'medicina', 'ingenieria');
begin
	for i := 2 to 7 do begin
		actual := v[i];
		j := i + 1;
		while(j > 0) and (v[j].cant < actual.cant) do begin
			v[j+1] := v[j];
			j := j-1;
		end;
		v[j+1] := actual;
	end;
	stringMax := vectorNombre[v[1].genero];
end;

function moduloC(a: arbol;minimo,maximo: integer) : integer;
begin
	if(a = nil) then
		moduloC := 0
	else begin
		if(a^.dato.codigoAutor > minimo) then begin
			if(a^.dato.codigoAutor < maximo) then begin
				moduloC := a^.dato.cant + moduloC(a^.HI,minimo,maximo) + moduloC(a^.HD,minimo,maximo);
			end
			else
				moduloC := moduloC(a^.HI,minimo,maximo);
		end
		else
			moduloC := moduloC(a^.HD,minimo,maximo);
	end;
end;
begin
end.
{La feria del libro necesita un sistema para obtener estadistircas sobre los libros presentados.
*a) implementar un modulo que lea informacion de los libros. De cada libro se conoce: isbn,codigo del autor y codigo del genero(1: literario,2: filosofia, 3: biologia,4: arte, 5: computacion, 6: medicina, 7: ingenieria). La lectura finaliza con el valor 0 para el isbn. Se sugiere utilizar el modulo leerLibro(). El modulo debe retornar dos estructuras:
* 	i) un arobl binario de busqueda ordenado por codigo de autor. Para cada codigo de autor debe almacenarse la cantidad de libros correspondientes al codigo.
*   ii) un venctor que alamecene para cada genero, el codigo del genero y la cantidad de libros del genero.
* b) implementar un modulo que reciba el vector generado en a), lo ordene por cantidad de libros de mayor a menor y retorne el nombre de genero con mayor cantidad de libros.
* c) implementar un modulo que reciba el arbol generado en a) y dos codigos. el modulo debe retornar la cantidad total de libros correspondientes a los codigos de autores entre los dosc codigos ingresados (incluidos ambos).}
