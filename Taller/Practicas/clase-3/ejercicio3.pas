program ejercicio3;
type

	formatoFecha = record
		dia:1..31;
		mes:1..12;
		ano:1900..2024;
	end;

	datosFinal = record
		nota:real;
		fecha:formatoFecha;
		codigo:integer;
	end;

	lista = ^nodo;
	nodo = record
		dato:datosFinal;
		nodoSig:lista;
	end;
	
	registrodearbol = record
		legajo: integer;
		infoFinales: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:registrodearbol;
		hi:arbol;
		hd:arbol;
	end;
	
	Promedios = record
		legajo: integer;
		promedio: real;
	end;
	
	listaPromedios = ^nodoPromedios;
	nodoPromedios = record
		dato: Promedios;
		sig: listaPromedios;
	end;
	
procedure agregarAdelante(var l:lista; d:datosFinal);
var
	aux:lista;
begin
	new(aux);
	aux^.dato:=d;
	aux^.nodoSig:=l;
	l:=aux;
end;
	
procedure leerRegistros(var d: datosFinal; var legajo: integer);
begin
	legajo :=random(30);
	d.codigo:=random(50);
	d.fecha.dia:=random(31)+1;
	d.fecha.mes:=random(12)+1;
	d.fecha.ano:=random(5)+2020;
	d.nota:=random()*10;
end;

procedure agregar(var a:arbol; legajo: integer; datosLista: datosFinal);
begin
	if(a = nil) then begin
		new(a);
		a^.HI := Nil;
		a^.HD := Nil;
		a^.dato.legajo := legajo;
		a^.dato.infoFinales := Nil;
		agregarAdelante(a^.dato.infoFinales,datosLista);
	end
	else begin
		if(legajo = a^.dato.legajo) then
			agregarAdelante(a^.dato.infoFinales,datosLista)
		else if(legajo < a^.dato.legajo) then
			agregar(a^.HI,legajo,datosLista)
		else
			agregar(a^.hd, legajo, datosLista);
	end;
end;

procedure cargarArbol(var a:arbol);
var
	legajo:integer;
	d: datosFinal;
begin
	leerRegistros(d,legajo);
	while(legajo <> 0) do begin
	    agregar(a,legajo,d);
    	leerRegistros(d,legajo);
	end;
end;

procedure imprimirLista(l: lista);
begin
	while(l <> nil) do begin
		writeln('Codigo materia: ',l^.dato.codigo);
		writeln('fecha: ',l^.dato.fecha.dia, '/',l^.dato.fecha.mes,'/',l^.dato.fecha.ano);
		writeln('Nota: ',l^.dato.nota);
		WriteLn('									');
		l := l^.nodoSig;
	end;
end;

procedure imprimirArbol(a:arbol);
begin
	if (a <> nil) then
		begin
			writeln('Legajo: ', a^.dato.legajo);
			imprimirLista(a^.dato.infoFinales);
			WriteLn('==============================');
			if (a^.hi <> nil) then
				imprimirArbol(a^.hi);
			if(a^.hd <> Nil) then
				imprimirArbol(a^.hd);
		end;
end;

function cantidadLegajoImpar(a: arbol) : integer;
begin
    if(a = Nil) then
	    cantidadLegajoImpar := 0
	else begin
		if(a^.dato.legajo mod 2 = 1) then
			cantidadLegajoImpar := cantidadLegajoImpar(a^.HI) + cantidadLegajoImpar(a^.HD) + 1
		else
		    cantidadLegajoImpar := cantidadLegajoImpar(a^.HI) + cantidadLegajoImpar(a^.HD);
	end;
end;

procedure informarFinalesAprobados(a: arbol);
	procedure imprimirFinalesAprobados(l: lista);
	var
		cantidad: integer;
	begin
		cantidad := 0;
	    while(l <> Nil) do begin
		    if(l^.dato.nota > 4) then
				cantidad += 1;
			l := l^.nodoSig;
		end;
		WriteLn('La cantidad de finales aprobados es: ', cantidad);
	end;
begin
	if(a <> Nil) then begin
	    WriteLn('Legajo: ', a^.dato.legajo);
		imprimirFinalesAprobados(a^.dato.infoFinales);
		if(a^.HI <> Nil) then
			informarFinalesAprobados(a^.HI);
		if(a^.HD <> Nil) then
			informarFinalesAprobados(a^.HD);
	end;
end;


procedure cargarLista(a: arbol; p: real;lp: listaPromedios);
	
	procedure agregarAdelanteNotas(var lp: listaPromedios;p: promedios);
	var
		aux: listaPromedios;
	begin
		New(aux);
		aux^.dato := p;
		aux^.sig := lp;
		lp := aux;
	end;
	
	procedure calcularPromedios(var lp: listaPromedios;l: lista;prom: real;legajo: integer);
	var
		cantidad: integer;
		sumaNotas: real;
		p: promedios;
	begin
		cantidad := 0;
		sumaNotas := 0;
		while(l <> nil) do begin
			cantidad += 1;
			sumaNotas += l^.dato.nota;
			l := l^.nodoSig;
		end;
		p.promedio := sumaNotas/cantidad;
		p.legajo := legajo;
		if(p.promedio > prom) then
			agregarAdelanteNotas(lp,p);
	end;
	
begin
	if(a <> Nil) then begin
		calcularPromedios(lp,a^.dato.infoFinales,p,a^.dato.legajo);
		if(a^.HI <> Nil) then
			cargarLista(a^.HI,p,lp);
		if(a^.HD <> Nil) then
			cargarLista(a^.HD,p,lp);
	end;
end;


var
	a:arbol;
	lp: listaPromedios;
	promedio: real;
begin
	randomize;
	a:=nil;
	cargarArbol(a);
	imprimirArbol(a);
	WriteLn(cantidadLegajoImpar(a));
	informarFinalesAprobados(a);
	lp := Nil;
	write('Escribir promedio a superar: '); readln(promedio);
	cargarLista(a,promedio,lp);
end.
{3. Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}
