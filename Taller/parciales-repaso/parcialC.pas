program parcialC;
type
	rangoDia = 1..30;
	envio = record
		codigoCliente: integer;
		dia: rangoDia;
		codigoPostal: integer;
		peso: real;
	end;
	
	datoLista = record
		codigoCliente: integer;
		dia: rangoDia;
		peso: real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: datoLista;
		sig: lista;
	end;
	
	datoArbol = record
		codigoPostal: integer;
		info: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: datoArbol;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerEnvio(var e: envio);
begin
	e.codigoCliente := random(1000);
	if(e.codigoCliente <> 0) then begin
		e.dia := random(30)+1;
		e.codigoPostal := random(1000);
		e.peso := random(20000) / (random(10) + 1);
	end;
end;	

procedure agregarAdelante(var l: lista;e: envio);
var
	aux: lista;
begin
	new(aux);
	aux^.dato.codigoCliente := e.codigoCliente;
	aux^.dato.dia := e.dia;
	aux^.dato.peso := e.peso;
	aux^.sig := l;
	l := aux;
end;

procedure agregarNodo(var a: arbol; e: envio);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codigoPostal := e.codigoPostal;
		a^.dato.info := nil;
		agregarAdelante(a^.dato.info,e);
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(a^.dato.codigoPostal = e.codigoPostal) then
			agregarAdelante(a^.dato.info,e)
		else if(e.codigoPostal < a^.dato.codigoPostal) then
			agregarNodo(a^.HI,e)
		else
			agregarNodo(a^.HD,e);
	end;
end;

procedure cargarArbol(var a: arbol);
var
	e: envio;
begin
	leerEnvio(e);
	while(e.codigoCliente <> 0) do begin
		agregarNodo(a,e);
		leerEnvio(e);
	end;
end;


procedure moduloB(a: arbol;cp: integer;var l: lista);
begin
	if(a <> nil) then begin
		if(a^.dato.codigoPostal = cp) then
			l := a^.dato.info
		else if(cp < a^.dato.codigoPostal) then
			moduloB(a^.HI,cp,l)
		else 
			moduloB(a^.HD,cp,l);
	end;
end;

procedure moduloC(l: lista;var codMin,codMax: integer);
	procedure calcularMaxYMin(l: lista;var codMin,codMax: integer;min,max: real);
	begin
		if(l <> nil) then begin
			if(l^.dato.peso < min) then begin
				codMin := l^.dato.codigoCliente;
				min := l^.dato.peso;
			end;
			if(l^.dato.peso > max) then begin
				codMax := l^.dato.codigoCliente;
				max := l^.dato.peso;
			end;
			calcularMaxYMin(l^.sig,codMin,codMax,max,min);
		end;
	end;
var
	max,min: real;
begin
	max := 0;
	min := 0;
	calcularMaxYMin(l,codMin,codMax,min,max);
end;

var
	a: arbol;
	codMin,codMax,cp: integer;
	l: lista;
begin
	a:= nil;
	cargarArbol(a);
	write('Codigo Postal a buscar: ');readln(cp);
	l := nil;
	moduloB(a,cp,l);
	moduloC(l,codMin,codMax);
end.
{El correo Argentino necesita procesar los envios entregados durante el mes de Julio de 2024. De cada envio se conoce el codigo del cliente, dia , codigo postal y peso del paquete.
* a) Implementar un modulo que lea envios, genere y retorne un arbol binario de busqueda ordenado por codigo postal, donde para cada codigo postal se alamcenen en una lista todos los envios (codigo de cliente, dia y peso del paquete) correspondientes. La lectura finaliza con codigo de cliente 0. Se sugiere utilziar el modulo leerEnvio().
* b) Implementar un modulo que reciba la estructura generada en a) y un codigo postal, y retorne todos los envios de dicho codigo postal.
* c) Realizar un modulo recursivo que reciba la estructura que retorna el inciso b) y retorne los dos codigos de cliente correspondientes al envío con mayor y menor peso.
NOTA: implementar el programa principal, que invoque a los inciso a,b y c.}

