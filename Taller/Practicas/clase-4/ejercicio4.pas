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

	registroISBN = record
		isbn: integer;
		vecesPrestado: integer;
	end;

	listaISBN = ^nodoISBN;
	nodoISBN = record
		dato: registroISBN;
		sig: listaISBN;
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
	write('ISBN: ');{readln(p.isbn);} p.isbn := random(100);
	write('Numero Socio: ');{readln(p.numeroSocio);} p.numeroSocio := random(10);
	write('Dia: ');{readln(p.fecha.dia);} p.fecha.dia := random(31)+1;
	write('Mes: ');{readln(p.fecha.mes);} p.fecha.mes := random(12)+1;
	write('Dias prestados: ');{readln(p.diasPrestados);} p.diasPrestados := random(10);
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
		if(a^.HD <> Nil) then
			moduloB := moduloB(a^.HD)
		else 
			moduloB := a^.dato.isbn;
	end
	else
		moduloB := -1;
end;

function moduloC(a: arbolB) : integer;
begin
	if(a <> nil) then begin
		if(a^.HI <> Nil) then
			moduloC := moduloC(a^.HI)
		else
			moduloC := a^.dato.isbn;
	end
	else
		moduloC := -1;
end;

function moduloD(a: arbolA; cod: integer) : integer;
begin
	if(a = nil) then
		moduloD := 0
	else begin
		if(a^.dato.numeroSocio = cod) then
			moduloD := moduloD(a^.HI,cod) + moduloD(a^.HD,cod) + 1
		else
			moduloD := moduloD(a^.HI, cod) + moduloD(a^.HD,cod);
	end;
end;

function moduloE(a: arbolB;cod: integer) : integer;
	procedure contarLista(l: lista; cod: integer; var cant: integer);
	begin
		cant := 0;
		while(l <> Nil) do begin
			if(l^.dato.numeroSocio = cod) then
				cant := cant + 1;
			l := l^.sig;
		end;
	end;
var
	cant: integer;
begin
	if(a <> nil) then begin
		contarLista(a^.dato.info,cod,cant);
		moduloE := cant + moduloE(a^.HD,cod) + moduloE(a^.HI,cod);
	end
	else begin
		moduloE := -1;
	end;
end;

procedure agregarAdelanteISBN(var l: listaISBN; r: registroISBN);
	var
		aux: listaISBN;
	begin
		new(aux);
		aux^.dato := r;
		aux^.sig := l;
		l := aux;
	end;

procedure moduloF(a: arbolA; var l: listaISBN);
	procedure agregarListaF(var l: listaISBN; r: registroISBN);
	begin
		if(l <> Nil) then begin
			if(l^.dato.isbn  = r.isbn) then
				l^.dato.vecesPrestado := l^.dato.vecesPrestado + 1;
		end
		else
			r.vecesPrestado := 1;
			agregarAdelanteISBN(l,r);
	end;
	
var
	r: registroISBN;
begin
	if(a <> Nil) then begin
		moduloF(a^.HD, l);
		r.isbn := a^.dato.isbn;
		agregarListaF(l,r);
		moduloF(a^.HI,l);
	end;
end;

procedure moduloG(a: arbolB;var lISBN: listaISBN);
var
	r: registroISBN;
	aux: lista;
begin
	if(a<>Nil) then begin
		moduloG(a^.HD,lISBN);
		r.isbn := a^.dato.isbn;
		r.vecesPrestado := 0;
		aux := a^.dato.info;
		while(aux <> Nil) do begin
			r.vecesPrestado := r.vecesPrestado + 1;
			aux := aux^.sig;
		end;
		agregarAdelanteISBN(lISBN,r);
		moduloG(a^.HI,lISBN);
	end;
end;

procedure imprimirListaISBN(l: listaISBN);
begin
	while(l <> Nil) do begin
		writeln('ISBN: ',l^.dato.isbn,'| Veces prestado: ',l^.dato.vecesPrestado);
		l := l^.sig;
	end;
end;

function ModuloI(a: arbolA; minimo, maximo: integer) : integer;
begin
	if(a = nil) then
		moduloI := 0
	else 
		if(a^.dato.isbn >= minimo) then 
			if(a^.dato.isbn <= maximo) then
				moduloI := 1 + moduloI(a^.HI,minimo,maximo) + moduloI(a^.HD,minimo,maximo)
			else
				moduloI := moduloI(a^.HI,minimo,maximo)
		else
			moduloI := ModuloI(a^.HD,minimo,maximo);
end;

function moduloJ(a: arbolB;minimo,maximo: integer) : integer;
	procedure contarPrestamos(l: lista;var cant: integer);
	begin
		cant := 0;
		while(l <> Nil) do begin
			cant := cant + 1;
			l := l^.sig;
		end;
	end;
var
	cant: integer;
begin
	if(a = nil) then
		moduloJ := 0
	else begin
		if(a^.dato.isbn >= minimo) then begin
			if(a^.dato.isbn <= maximo) then begin
				contarPrestamos(a^.dato.info,cant);
				moduloJ := cant + moduloJ(a^.HI,minimo,maximo) + moduloJ(a^.HD,minimo,maximo);
			end
			else
				moduloJ := moduloJ(a^.HI,minimo,maximo);
		end
		else
			moduloJ := moduloJ(a^.HD,minimo,maximo);
	end;
end;

var
	aa: arbolA;
	ab: arbolB;
	listaF, listaG : listaISBN;
	minimo, maximo, cod: integer;
begin
	randomize;
	cargarArboles(aa,ab);
	writeln();
	writeln('El ISBN mas grande es: ',moduloB(aa));
	writeln('El ISBN mas chico es: ',ModuloC(ab));
	writeln('Numero de socio a buscar en el arbolA: ');readln(cod);
	writeln;
	writeln;
	writeln;
	writeln('El numero de socio: ',cod,' pidio ',moduloD(aa,cod),' prestamos en el arbolA.');
	writeln('Numero de socio a buscar en el arbolA: ');readln(cod);
	writeln('El numero de socio: ',cod,' pidio ',moduloD(aa,cod),' prestamos en el arbolB.');
	listaF := Nil;
	moduloF(aa,listaF);
	listaG := Nil;
	moduloG(ab,listaG);
	writeln;
	writeln;
	writeln;
	//Punto H
	writeln('Lista G');
	imprimirListaISBN(listaG);
	write('Minimo ISBN:'); readln(minimo);
	write('Maximo ISBN:'); readln(maximo);
	writeln('La cantidad de prestamos en el arbol A entre ',minimo, ' y ', maximo, ' es: ',moduloI(aa,minimo,maximo));
	writeln('La cantidad de prestamos en el arbol B entre ',minimo, ' y ', maximo, ' es: ',moduloJ(ab,minimo,maximo));
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
que se prestó.
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
