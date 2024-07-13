program tres;
type
    viaje = record
        numeroViaje : integer;
        codigoAuto : integer;
        direccionOrigen : string;
        direccionDestino : string;
        kmRecorridos : integer;
    end;
    lista = ^nodo;
    nodo = record
        dato : viaje;
        sig : lista;
    end;
//procedure cargarLista(var L : lista); SE DISPONE
procedure insertarOrdenado(var l : lista; v : viaje);
var
    actual, anterior, nuevo : lista;
begin
    new(nuevo);
    nuevo^.dato := v;
    actual := l;
    anterior := l;
    while(l <> nil) and (v.numeroViaje < actual^.dato.numeroViaje) do begin
        anterior := actual;
        actual := actual^.sig;
    end;
    if(actual = anterior) then
        l := nuevo
    else
        anterior^.sig := nuevo;
    nuevo^.sig := actual;
end;
procedure procesarLista(listaDispone,listaCrear : lista);
var
    actual,cantidad, max1, max2, kmAuto : integer;
begin
    max1 := -1; max2 := -1;
    while(listaDispone <> Nil) do begin
        cantidad := 0;
        actual := listaDispone^.dato.codigoAuto;
        kmAuto := 0;
        while(listaDispone <> nil) and (actual = listaDispone^.dato.codigoAuto) do begin
            cantidad := cantidad + 1;
            kmAuto := kmAuto + listaDispone^.dato.kmRecorridos;
            if(listaDispone^.dato.kmRecorridos > 5) then
                insertarOrdenado(listaCrear,listaDispone^.dato);
            listaDispone := listaDispone^.sig;
        end;
        if(kmAuto > max1) then begin
            max2 := max1;
            max1 := kmAuto;
        end
        else if(kmAuto > max2) then
            max1 := kmAuto;
    end;
    WriteLn('Los autos que mas km recorrieron fueron: ', max1, ' y ', max2);
end;
var
    listaDispone, listaCrear : lista;
begin
    listaDispone := Nil;
    listaCrear := Nil;
    //cargarLista(listaDispone);
    procesarLista(listaDispone, listaCrear);
end.
{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. De
cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y para
un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de
viaje.}