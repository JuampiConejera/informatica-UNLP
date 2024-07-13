program uno;
Type
    vector = array[1..5] of integer;
    G = 1..5;
    persona = record
        dni : longint;
        NYA : string;
        edad : integer;
        genero : G;
    end;
    lista = ^nodo;
    nodo = record
        dato : persona;
        sig : lista;
    end;
procedure leerPersona(var p : persona);
begin
    with p do begin
      write('DNI:   ');readln(dni);
      write('nombre y apellido: ');readln(NYA);
      write('edad:  ');readln(edad);
      write('genero:    ');readln(genero);
    end;
end;
procedure agregarAdelante(var l : lista; p : persona);
var
    aux : lista;
begin
    new(aux);
    aux^.dato := p;
    aux^.sig := l;
    l := aux;
end;
procedure cargarLista(var l : lista);
var
    p : persona;
begin
    repeat
      leerPersona(p);
      agregarAdelante(l,p);
    until (p.dni = 33555444);
end;

function contDniPar(l : lista) : integer;
var
    par, impar, contador : integer;
    aux : longint;
begin
    contador := 0;
    while (l <> nil) do begin
        par := 0;
        impar := 0;
        aux := l^.dato.dni;
        while(aux <> 0) do begin
            if (aux mod 2 = 0) then
                par := par+1
            else
                impar := impar+1;
            aux := aux div 10;
        end;
        if (par > impar) then
            contador := contador + 1;
        l := l^.sig;
    end;
    contDniPar := contador;
end;

procedure dosMax(l : lista);
var
    max1,max2, i, j : integer;
    v : vector;
begin
    max1 := -9999;
    max2 := -9998;
    for i := 1 to 5 do
        v[i] := 0;
    while (l <> nil) do begin
        v[l^.dato.genero] := v[l^.dato.genero] + 1;
        l := l^.sig;
    end;
    for j := 1 to 5 do begin
        if(v[j] > max1) then begin
            max2 := max1;
            max1 := j;
        end;
        if(v[j] > max2) then 
            max2 := j;
    end;
    writeln('el maximo1 es el genero: ', max1, '. El maximo2 es el genero: ', max2);
end;
procedure eliminar(var l : lista; d : LongInt);
var
    actual, ant : lista;
begin
    actual := l;
    while((actual <> Nil) and (actual^.dato.dni <> d)) do begin
        ant := actual;
        actual := actual^.sig;
    end;
    if(actual <> Nil) then begin
        if(actual = l) then
            l := l^.sig
        else
            ant^.sig := actual^.sig;
    dispose(actual);
    end;
end;



var
l : lista;
dniEliminar : LongInt;
begin
    l := nil;
    cargarLista(l);
    Writeln('La cantidad de personas con mas digitos pares que impares en el dni es: ', contDniPar(l));
    dosMax(l);
    write('Ingrese DNI a eliminar');readln(dniEliminar);
    eliminar(l,dniEliminar);
end.

{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho
casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que
prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una
persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal.}