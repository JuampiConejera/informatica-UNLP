program doce;
type
    movil = record
        version : integer;
        pantalla : real;
        ram : integer;
    end;
    lista = ^nodo;
    nodo = record
        dato : movil;
        sig : lista;
    end;
//se dispone | procedure cargarLista(var l : lista);
function promedio(a : real; b : integer) : real;
begin
    promedio := a / b;
end;
procedure procesarLista(l : lista);
var
    versionActual, cantidadRam, cantidadVersion, totalMovil : integer;
    promedioPantalla : real;
begin
    cantidadRam := 0; totalMovil := 0; promedioPantalla := 0;
    while(l <> Nil) do begin
        cantidadVersion := 0;
        versionActual := l^.dato.version;
        while(l <> Nil) and (l^.dato.version = versionActual) do begin
            cantidadVersion := cantidadVersion + 1;
            if(l^.dato.ram > 3) and (l^.dato.pantalla <= 5) then
                cantidadRam := cantidadRam + 1;
            promedioPantalla := promedioPantalla + l^.dato.pantalla;
            l := l^.sig;
        end;
        totalMovil := totalMovil + cantidadVersion;
        WriteLn('La cantidad de dispositivos con la version ',versionActual, ' de Android es: ', cantidadVersion);
    end;
    WriteLn('La cantidad de dispositivos con más de 3gb de memoria y pantallas de a lo sumo 5 pulgadas es: ', cantidadRam);
    WriteLn('El promedio de pantalla es: ', promedio(promedioPantalla, totalMovil));
end;
var
    cantRam,cantAndroid : integer;
    PromPantalla : real;
    l : lista;
begin
    l := nil;
    //Se dispone | cargarLista(l);
    procesarLista(l);
end.
{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de
Android instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee
(medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un
programa que procese la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}