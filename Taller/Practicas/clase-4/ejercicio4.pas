program ejercicio4;
type
	rangoDia = 1..31;
	rangoMes = 1..12;
	rangoFecha = record
		dia: rangoDia;
		mes: rangoMes;
	end;
	prestamo = record
		isbn: integer;
		numeroSocio: integer;
		fecha: rangoFecha;
		diasPrestados: integer;
	end;
	arbolA = ^nodoA;
	nodoA = record
		dato: prestamo;
		HI: arbolA;
		HD: arbolA;
	end;
	
	infoPrestamos = record
		numeroSocio: integer;
		fecha: rangoFecha;
		diasPrestados: integer;
	end;
	
	lista = ^nodoLista; 
	nodoLista = record
		dato: infoPrestamos;
		sig: lista;
	end;
	
	registroParaLista = record
		isbn: integer;
		info: lista;
	end;
	
	arbolB = ^nodoB;
	nodoB = record
		dato: registroParaLista;
		HI: arbolB;
		HD: arbolB;
	end;

procedure agregarArbolA(var a: arbolA;p: prestamo);
begin
	if(a = nil) then begin
		new(a);
		a^.dato := p;
		a^.HI := Nil;
		a^.HD := Nil;
	end
	else begin
		if(p.isbn < a^.dato.isbn) then
			agregarArbolA(a^.HI,p)
		else
			agregarArbolA(a^.HD,p);
	end;
end;

procedure agregarAdelante(var l: lista;p: prestamo);
var
	aux: lista;
begin
	new(aux);
	aux^.dato.numeroSocio := p.numeroSocio;
	aux^.dato.fecha := p.fecha;
	aux^.dato.diasPrestados := p.diasPrestados;
	aux^.sig := l;
	l := aux;
end;

procedure agregarArbolB(var a: arbolB;p: prestamo);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.isbn := p.isbn;
		a^.dato.info := nil;
		agregarAdelante(a^.dato.info,p);
		a^.HI := nil;
		a^.HD := Nil;
	end
	else begin
		if(a^.dato.isbn = p.isbn) then
			agregarAdelante(a^.dato.info,p)
		else if(p.isbn < a^.dato.isbn) then
			agregarArbolB(a^.HI,p)
		else
			agregarArbolB(a^.HD,p);
	end;
end;

procedure leerPrestamo(var p: prestamo);
begin
	write('ISBN: ');readln(p.isbn);
	write('Numero Socio: ');readln(p.numeroSocio);
	write('Dia: ');readln(p.fecha.dia);
	write('Mes: ');readln(p.fecha.mes);
	write('Dias prestados: ');readln(p.diasPrestados);
end;

procedure cargarArboles(var aa: arbolA; var ab: arbolB);
var
	p: prestamo;
begin
	leerPrestamo(p);
	while(p.isbn <> 0) do begin
		agregarArbolA(aa,p);
		agregarArbolB(ab,p);
		leerPrestamo(p);
	end;
end;

function moduloB(a: arbolA) : integer;
begin
	if(a <> nil) then begin
		if(a^.HD <> Nil) then begin
			moduloB(a^.HD);
		end
		else
			moduloB := a^.dato.isbn;
	end
	else
		moduloB := -1;
end;

var
	aa: arbolA;
	ab: arbolB;
begin
	cargarArboles(aa,ab);
end.
{4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.ff	f	f	f	f	f	f	f
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}
