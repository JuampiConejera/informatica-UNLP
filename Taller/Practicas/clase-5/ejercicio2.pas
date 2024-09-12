program ejercicio2;
type
	rangoAnio = 2010..2018;
	auto = record
		patente: string;
		anio: rangoAnio;
		marca: string;
		modelo: string;
	end;
	arbol1 = ^nodo1;
	nodo1 = record
		dato: auto;
		HI: arbol1;
		HD: arbol1;
	end;
	
	infoAuto = record
		patente: string;
		anio: rangoAnio;
		modelo: string;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: infoAuto;
		sig: lista;
	end;
	
	datoArbol2 = record
		info: lista;
		marca: string;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: datoArbol2;
		HI: arbol2;
		HD: arbol2;
	end;
	
	datoListaD = record
		patente: string;
		marca: string;
		modelo: string;
	end;
	
	listaD = ^nodoD;
	nodoD = record
		dato: datoListaD;
		sig: listaD;
	end;
	
	vector = array[rangoAnio] of listaD;
	
procedure leerAuto(var a: auto);
begin
	readln(a.marca);
	if(a.marca <> 'MMM') then begin
		readln(a.anio);
		readln(a.patente);
		readln(a.modelo);
	end;
end;	


procedure agregarArbol1(var a: arbol1; auto: auto);
begin
	if( a = nil) then begin
		new(a);
		a^.dato := auto;
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(auto.patente < a^.dato.patente) then
			agregarArbol1(a^.HI,auto)
		else
			agregarArbol1(a^.HD,auto);
	end;
end;	

procedure agregarAdelante(var l: lista;a: auto);
var
	aux: lista;
begin
	new(aux);
	aux^.dato.patente := a.patente;
	aux^.dato.anio := a.anio;
	aux^.dato.modelo := a.modelo;
	aux^.sig := l;
	aux := l;
end;

procedure agregarArbol2(var a: arbol2; auto: auto);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.marca := auto.marca;
		a^.dato.info := Nil;
		agregarAdelante(a^.dato.info,auto);
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(a^.dato.marca = auto.marca) then
			agregarAdelante(a^.dato.info,auto)
		else if(auto.marca < a^.dato.marca) then
			agregarArbol2(a^.HI,auto)
		else	
			agregarArbol2(a^.HD,auto);
	end;
end;

procedure cargarArboles(var a1: arbol1;var a2: arbol2);
var
	a: auto;
begin
	leerAuto(a);
	while(a.marca <> 'MMM') do begin
		agregarArbol1(a1,a);
		agregarArbol2(a2,a);
		leerAuto(a);
	end;
end;

function moduloB(a:arbol1;m: string) : integer;
begin
	if(a = nil) then
		moduloB := 0
	else begin
		if(a^.dato.marca = m) then
			moduloB := 1 + moduloB(a^.HI,m) + moduloB(a^.HD,m)
		else
			moduloB := moduloB(a^.HI,m) + moduloB(a^.HD,m);
	end;
end;

function moduloC(a: arbol2;m: string) : integer;
	procedure contarLista(l: lista;var cant: integer);
	begin
		cant := 0;
		while(l <> nil) do begin
			cant := cant + 1;
			l := l^.sig;
		end;
	end;
var
	cant: integer;
begin
	if(a <> nil) then begin
		if(a^.dato.marca = m) then begin
			contarLista(a^.dato.info,cant);
			moduloC := cant;
		end
		else begin
			if(m < a^.dato.marca) then
				moduloC := moduloC(a^.HI,m)
			else
				moduloC := moduloC(a^.HD,m);
		end;
	end
	else
		moduloC := 0;
end;

procedure moduloD(a: arbol1; var v: vector);
	procedure inicializarVector(var v: vector);
	var
		i

begin
end.
{2. Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}
