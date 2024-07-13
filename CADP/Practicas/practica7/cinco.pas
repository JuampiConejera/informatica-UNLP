program cinco;
type
    dimF = 1..100;
    camion = record
        patente : string[10];
        fabricacion : integer;
        capacidad : real;
    end;
    vector = array[dimF] of camion;
    viaje = record
        codigoViaje : integer;
        codigoCamion : dimF;
        distancia : integer;
        ciudad : string[20];
        anoViaje : integer;
        dni : integer;
    end;
    lista = ^nodo;
    nodo = record
        dato : viaje;
        sig : lista;
    end;
//procedure cargarVector(var v : vector); SE DISPONE
procedure leerViaje(var v : viaje);
begin
    Write('CodigoViaje: ');ReadLn(v.codigoViaje);
    Write('CodigoCamion: ');ReadLn(v.codigoCamion);
    Write('distancia: ');ReadLn(v.distancia);
    Write('ciudad: ');ReadLn(v.ciudad);
    Write('anoViaje: ');ReadLn(v.anoViaje);
    Write('dni: ');ReadLn(v.dni);
end;
procedure agregarAdelante(var l : lista; v : viaje);
var
    aux : lista;
begin
    new(aux);
    aux^.dato := v;
    aux^.sig := l;
    aux := l;
end;
procedure cargarLista(var l : lista);
var
    v : viaje;
begin
    leerViaje(v);
    while (v.codigoViaje <> -1) do begin
        agregarAdelante(l,v);
        leerViaje(v);
    end;
end;
function descomponerDni(dni : integer) : Boolean;
var
    aux : dni;
    impares : boolean;
begin
    impares := true;
    aux := dni;
    while(dni <> 0) do begin
        if(aux mod 2 = 0) then
            impares := false;
        dni := dni div 10;
        aux := dni;
    end;
    descomponerDni := impares
end;
procedure procesarVector(l : lista; v : vector;var mayorKm, menorKm : string;var cantViajes : integer;);
var
    maxKm,minKm : integer;
begin
    maxKm := -1; minKm := 9999;
    while (l <> Nil) do begin
        if(l^.dato.distancia > maxKm) then begin
            maxKm := l^.dato.distancia;
            mayorKm := v[l^.dato.codigoCamion].patente;
        end;
        if(l^.dato.codigoCamion < minKm) then begin
            minKm := l^.dato.distancia;
            menorKm := v[l^.dato.codigoCamion].patente;
        end;
        if( (v[l^.dato.codigoCamion].capacidad > 30.5) and ((l^.dato.anoViaje - v[l^.dato.codigoCamion].fabricacion) > 5)) then
            cantViajes := cantViajes + 1;
        if(descomponerDni(l^.dato.dni)) then
            WriteLn('El codigo del viaje donde el chofer tiene dni impar es: ', l^.dato.codigoViaje);
        l := l^.sig;
    end;
end;
var
    l : lista;
    v : vector;
    mayorKm, menorKm : string;
    cantViajes : integer;
begin
    cantViajes : integer;
    l := nil;
    cargarLista(l);
    //cargarVector(v); SE DISPONE
    procesarVector(l,v,mayorKm, menorKm);
    WriteLn('La patente ', mayorKm,' fue la que mayor recorrido hizo.');
    WriteLn('La patente ', menorKm,' fue la que menor recorrido hizo.');
end.
{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones.
De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede
transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De cada
viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros recorrida,
ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando se lee el código
de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas
y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el
viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}