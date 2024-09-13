program parcialM;
const
	dimF = 6;
type
	rangoDia = 1..31;
	rangoDiagnostico = 1..dimF;
	atencion = record
		matriculaMedico: integer;
		dniPaciente: integer;
		dia: rangoDia;
		diagnostico: rangoDiagnostico;
	end;
	
	datoArbol = record
		matriculaMedico: integer;
		cant: integer;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: datoArbol;
		HI: arbol;
		HD: arbol;
	end;
		
	lista = ^nodoLista;
	nodoLista = record
		dato: integer;
		sig: lista;
	end;
	
	datoVector = record
		tipo: rangoDiagnostico;
		info: lista;
	end;
	
	vector = array[rangoDiagnostico] of datoVector;

procedure leerAtencion(var a: atencion);
begin
	a.dniPaciente := random(1000);
	if(a.dniPaciente <> 0) then begin
		a.matriculaMedico := random(1000);
		a.dia := random(31)+1;
		a.diagnostico := random(dimF)+1;
	end;
end;

procedure cargarArbol(var a: arbol; at: atencion);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.matriculaMedico := at.matriculaMedico;
		a^.dato.cant := 1;
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(a^.dato.matriculaMedico = at.matriculaMedico) then
			a^.dato.cant := a^.dato.cant + 1
		else if(at.matriculaMedico < a^.dato.matriculaMedico) then
			cargarArbol(a^.HI,at)
		else
			cargarArbol(a^.HD,at);
	end;
end;

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do begin
		v[i].tipo := i;
		v[i].info := nil;
	end;
end;

procedure agregarAdelante(var l: lista; n: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.dato := n;
	aux^.sig := l;
	l := aux;
end;

procedure moduloA(var a: arbol; var v: vector);
var
	at: atencion;
begin
	inicializarVector(v);
	leerAtencion(at);
	while(at.dniPaciente <> 0) do begin
		cargarArbol(a,at);
		agregarAdelante(v[at.diagnostico].info,at.dniPaciente);
		leerAtencion(at);
	end;
end;

function moduloB(a: arbol;matricula: integer) : integer;
begin
	if(a = nil) then
		moduloB := 0
	else begin
		if(a^.dato.matriculaMedico > matricula) then
			moduloB := a^.dato.cant + moduloB(a^.HI,matricula) + moduloB(a^.HD,matricula)
		else
			moduloB := moduloB(a^.HD,matricula);
	end;
end;

function contarLista(l: lista) : integer;
begin
	contarLista := 0;
	while(l <> nil) do begin
		contarLista := contarLista + 1;
		l := l^.sig;
	end;
end;

procedure moduloC(v: vector; aux: integer;max: integer; var stringMax: char);
var
	letras: array[1..dimF] of char = ('A','B','C','D','E','F');
	cant: integer;
begin
	if(aux <= dimF) then begin
		cant := contarLista(v[aux].info);
		if(cant > max) then begin
			max := cant;
			stringMax := letras[aux];
		end;
		moduloC(v,aux+1,max,stringMax);
	end;
end;

function moduloC2(v: vector) : char;
	procedure maximo(v: vector; aux: integer;max: integer;var stringMax: char);
	var
		letras: array[1..dimF] of char = ('A','B','C','D','E','F');
		cant: integer;
	begin
		if(aux <= dimF) then begin
			cant := contarLista(v[aux].info);
		if(cant > max) then begin
			max := cant;
			stringMax := letras[aux];
		end;
		maximo(v,aux+1,max,stringMax);
		end;
	end;
var
	max: integer;
	stringMax: char;
begin
	max := -1;
	maximo(v,1,max,stringMax);
	moduloC2 := stringMax;
end;

var
	a: arbol;
	v: vector;
	matricula,max: integer;
	stringMax: char;
begin
	randomize;
	a:= nil;
	moduloA(a,v);
	readln(matricula);
	moduloB(a,matricula);
	max := -1;
	moduloC(v,1,max,stringMax);
	writeln(stringMax);
	writeln(moduloC2(v));
end.
{Una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes en julio de 2024.
* a) Implmenetar un modulo que lea informacion de las atenciones. De cada atencion se lee: matricula del medico, dni del paciente, dia y diagnostico(valor entre A y F). La lectura finaliza con el dni 0. Se sugiere utilizar el modulo leerAtencion(). El modulo debe retornar dos estructuras:
* 	i) Un arbol bianrio de busqueda ordenado por matricula del medico. Para cada matricula de medico debe almacenarse la cantidad de atenciones realizadas.
* 	ii) Un vector que almacene en cada posicion el tipo del genero y la lista de los DNI de pacientes atendidos con ese diagnostico.
* b) implementar un modulo que reciba el arbol generado en a), una matricula y retorne la cantidad total de atenciones realizadas por los medios con matricula superior a la matricula ingresada.
* c) realizar un modulo recursivo que reciba el vector generado en a) y retorne el diagnostico con mayor cantidad de pacientes atendidos.

NOTA: implementar el programa principal, que invoque a los incisos a,b y c.}


procedure insercion(var v: vector;diml: integer);
var
	i,j: integer;
	actual: dato;
begin
	for i := 26 to diml do begin
		actual := v[i];
		j := i+1;
		while(j > 0) and (v[j] > actual) do begin
			v[j+1] := v[j];
			j := j - 1;
		end;
		v[j+1] := actual;
	end;
end;
