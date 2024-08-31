program ejercicio3;
type
	rangoDias = 1..31;
	rangoMeses = 1..12;
	rangoFecha = record
		dia: rangoDias;
		mes: rangoMeses;
		anio: 1900..2024;
	end;
	informacion = record
		codigoMateria: integer;
		fecha: rangoFecha;
		nota: real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: informacion;
		sig: lista;
	end;
	
	alumno = record
		legajo: integer;
		info: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;

procedure agregarArbol(var a: arbol;i: alumno);
begin
	if(a = Nil) then begin
		new(a);
		a^.dato := i;
		a^.HI := Nil;
		a^.HD := Nil;
	end
	else if(a^.dato.legajo > i.legajo) then
		agregarArbol(a^.HI,i)
	else
		agregarArbol(a^.HD,i);
end;

procedure agregarAdelante(var l: lista;i: informacion);
var
	aux: lista;
begin
	new(aux);
	aux^.dato := i;
	aux^.sig := l;
	l := aux;
end;

procedure leerInfo(var i: informacion);
begin
	write('Codigo materia: ');{readln(i.codigoMateria);} i.codigomateria := random(500);
	write('Dia: ');{readln(i.fecha.dia);} i.fecha.dia := random(31)+1;
	write('Mes: '); {readln(i.fecha.mes);} i.fecha.mes := random(12)+1;
	write('Anio: ');{readln(i.fecha.anio);} i.fecha.anio := random(1025)+1900;
	write('Nota: ');{readln(i.nota);} i.nota := random * 10;
end;

procedure leerAlumno(var a: alumno);
var
	l: lista;
	i: informacion;
begin
	write('Numero legajo: '); {readLn(a.legajo)} a.legajo := random(3);
	if(a.legajo <> 0) then begin
		l := Nil;
		leerInfo(i);
		agregarAdelante(l,i);
	end;
end;


procedure cargarArbol(var a: arbol);
var
	infoAlumno: alumno;
begin
	leerAlumno(infoAlumno);
	while(infoAlumno.legajo <> 0) do begin
		agregarArbol(a,infoAlumno);
		leerAlumno(infoAlumno);
	end;
end;

function cantidadAlumnosImpar(a: arbol) : integer;
	procedure contarLegajosImpar(a: arbol; var cantidad: integer);
	begin
		if(a <> Nil) then begin
			if(a^.dato.legajo mod 2 = 1) then
				cantidad += 1;
			if(a^.HI <> Nil) then
				contarLegajosImpar(a^.HI,cantidad);
			if(a^.HD <> Nil) then
				contarLegajosImpar(a^.HD,cantidad);
 		end;
	end;
var
	cantidad: integer;
begin
	cantidad := 0;
	contarLegajosImpar(a,cantidad);
	cantidadAlumnosImpar := cantidad;
end;

procedure informarFinales(a: arbol);
	procedure contarAprobados(l: lista;var cantidad: integer);
	begin
		while(l <> Nil) do begin
			if(l^.dato.nota >= 4) then
				cantidad += 1;
			l := l^.sig;
		end;
	end;

var
	cantidad: integer;
begin
	if(a <> Nil) then begin
		cantidad := 0;
		contarAprobados(a^.dato.info,cantidad);
		writeln('La cantidad de finales aprobados por el alumno con legajo ', a^.dato.legajo, ' son: ', cantidad);
		if(a^.HI <> Nil) then
			informarFinales(a^.HI);
		if(a^.HD <> Nil) then
			informarFinales(a^.HD);
	end;
end;

var
	a: arbol;
begin
	randomize;
	a := Nil;
	cargarArbol(a);
	writeLn('La cantidad de alumnos con legajo impar es: ', cantidadAlumnosImpar(a));
	informarFinales(a);
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
