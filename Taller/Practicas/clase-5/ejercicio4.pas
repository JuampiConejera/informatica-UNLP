program ejercicio4;
type
	reclamo = record
		codigo: integer;
		dni: integer;
		anio: integer;
		tipoReclamo: string;
	end;
	
	reclamoLista = record
		codigo: integer;
		anio: integer;
		tipoReclamo: string;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: reclamoLista;
		sig: lista;
	end;
	
	infoArbol = record
		dni: integer;
		info: lista;
		cant: integer;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: infoArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	
	listaD = ^nodoListaD;
	nodoListaD = record
		dato: integer;
		sig: listaD;
	end;
	
procedure leerReclamo(var r: reclamo);
begin
	r.codigo := random(100);//readln(r.codigo);
	r.dni := random(100);//readln(r.dni);
	r.anio := random(100);//readln(r.anio);
	r.tipoReclamo := chr(random(26)+65);//readln(r.tipoReclamo);
end;

procedure agregarAdelante(var l: lista;r: reclamo);
var
	aux: lista;
begin
	new(aux);
	aux^.dato.codigo := r.codigo;
	aux^.dato.anio := r.anio;
	aux^.dato.tipoReclamo := r.tipoReclamo;
	aux^.sig := l;
	l := aux;
end;

procedure agregarNodo(var a: arbol; r: reclamo);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.dni := r.dni;
		a^.dato.cant := 1;
		a^.dato.info := nil;
		agregarAdelante(a^.dato.info,r);
	end
	else begin
		if(a^.dato.dni = r.dni) then begin
			a^.dato.cant := a^.dato.cant + 1;
			agregarAdelante(a^.dato.info,r);
		end
		else if(r.dni < a^.dato.dni) then
			agregarNodo(a^.HI,r)
		else
			agregarNodo(a^.HD,r);
	end;
end;

procedure cargarArbol(var a: arbol);
var
	r: reclamo;
begin
	leerReclamo(r);
	while(r.codigo <> 0) do begin
		agregarNodo(a,r);
		leerReclamo(r);
	end;
end;

function contarReclamos(l: lista) : integer;
	begin
		contarReclamos := 0;
		while(l <> nil) do begin
			contarReclamos := contarReclamos + 1;
		l := l^.sig;
		end;
	end;

function moduloB(a: arbol; dni: integer) : integer;
begin
	if(a = nil) then
		moduloB := 0
	else begin
		if(a^.dato.dni = dni) then 
			moduloB := contarReclamos(a^.dato.info)
		else if(dni < a^.dato.dni) then
			moduloB := moduloB(a^.HI,dni)
		else
			moduloB := moduloB(a^.HD,dni);
	end;
end;

function moduloC(a: arbol;minimo,maximo: integer) : integer;
begin
	if(a <> nil) then begin
		if(a^.dato.dni > minimo) then begin
			if(a^.dato.dni < maximo) then begin
				moduloC := contarReclamos(a^.dato.info) + moduloC(a^.HI,minimo,maximo) + moduloC(a^.HD,minimo,maximo);
			end
			else
				moduloC := moduloC(a^.HI,minimo,maximo);
		end
		else
			moduloC := moduloC(a^.HD,minimo,maximo);
	end;
end;

procedure agregarListaD(var l: listaD; c: integer);
var
	aux: listaD;
begin
	new(aux);
	aux^.dato := c;
	aux^.sig := l;
	l := aux;
end;

procedure moduloD(a: arbol;anio: integer;var ld: listaD);
	procedure buscarDato(l: lista;var ld: listaD;anio: integer);
	begin
		while (l <> nil) do begin
			if(l^.dato.anio = anio) then
				agregarListaD(ld,l^.dato.codigo);
			l := l^.sig;
		end;
	end;
begin
	if(a <> nil) then begin
		buscarDato(a^.dato.info,ld,anio);
		if(a^.HI <> nil) then
			moduloD(a^.HI,anio,ld);
		if(a^.HD <> nil) then
			moduloD(a^.HD,anio,ld);
	end
	else
		writeln('La lista esta vacia');
end;


var
	minimo,maximo,dni,anio: integer;
	a: arbol;
	l: listaD;
begin
	randomize;
	a := nil;
	cargarArbol(a);
	write('DNI: ');readln(dni);
	writeln(moduloB(a,dni));
	write('Minimo: ');readln(minimo);
	write('maximo: ');readln(maximo);
	moduloC(a,minimo,maximo);
	l := nil;
	write('Anio: ');readln(anio);
	moduloD(a,anio,l);
end.
{4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}
