program Seis;
type
    rangoEspectro = 1..7;
    sonda = record
        nombre : string[20];
        duracion : integer;
        Construccion : real;
        Mantenimiento : real;
        espectroElectromagnetico : rangoEspectro;
    end;
    lista = ^nodo;
    nodo = record
        dato : sonda;
        sig : lista;
    end;
    vectorRango = array[rangoEspectro] of integer;

procedure leerSonda(var s : sonda);
begin
    write('Nombre: ');readln(s.nombre);
    write('Duracion estimada: ');readln(s.duracion);
    write('Costo de construccion: ');readln(s.Construccion);
    write('Costo de mantenimiento: ');readln(s.Mantenimiento);
    write('Rango del espectro(1-7): ');readln(s.espectroElectromagnetico);
end;
procedure agregarAdelante(var l : lista; s : sonda);
var
    aux : lista;
begin
    new(aux);
    aux^.dato := s;
    aux^.sig := l;
    l := aux;
end;
procedure CargarLista(var l : lista);
var
    s : sonda;
begin
    leerSonda(s);
    while (s.nombre <> 'GAIA') do begin
        agregarAdelante(l,s);
        leerSonda(s);
    end;
end;

procedure procesarLista(l : lista; var nombreSondaCostosa : string; var v : vectorRango; var duracionPromedio : Real; var costoPromedio : real);
var
    maxSonda,auxCosto : real;
    contadorTotalSondas : integer;
begin
    maxSonda := 0;
    contadorTotalSondas := 0;
    while(l <> Nil) do begin
        contadorTotalSondas := contadorTotalSondas + 1;
        auxCosto := l^.dato.duracion * l^.dato.Mantenimiento + l^.dato.Construccion;
        if(auxCosto > maxSonda) then begin
            maxSonda := auxCosto;
            nombreSondaCostosa := l^.dato.nombre;
        end;
        v[l^.dato.espectroElectromagnetico] := v[l^.dato.espectroElectromagnetico] + 1;
        duracionPromedio := duracionPromedio + l^.dato.duracion;
        costoPromedio := costoPromedio + l^.dato.Construccion;
        l := l^.sig;
    end;
    duracionPromedio := duracionPromedio / contadorTotalSondas;
    costoPromedio := costoPromedio / contadorTotalSondas;
end;
procedure calcularCyD(l : lista; duracionPromedio : real; var cantSondasDuracion : integer; costoPromedio : Real);
begin
    while(l <> Nil) do begin
        if(l^.dato.duracion > duracionPromedio) then
            cantSondasDuracion := cantSondasDuracion + 1;
        if(l^.dato.Construccion > costoPromedio) then
            WriteLn('La sonda ', l^.dato.nombre, ' supera el costo de construccion promedio');
    l := l^.sig;
    end;
end;

procedure inicializarVector(var v : vectorRango);
var
    i : integer;
begin
    for i := 1 to 7 do
        v[i] := 0;
end;

var
    l : lista;
    nombreSondaCostosa : string;
    cantSondasDuracion, i : integer;
    CantSondasRango : vectorRango;
    duracionPromedio, costoPromedio : real;
begin
    costoPromedio := 0;;
    cantSondasDuracion := 0;
    l := Nil;
    CargarLista(l);
    inicializarVector(CantSondasRango);
    procesarLista(l,nombreSondaCostosa,CantSondasRango,duracionPromedio,costoPromedio);
    calcularCyD(l,duracionPromedio,cantSondasDuracion, costoPromedio);
    WriteLn('El nombre de la sonda mas costosa es: ', nombreSondaCostosa);
    for i := 1 to 7 do
        WriteLn('Se le realizaron ',CantSondasRango[i], ' al rango ', i, '.');
    WriteLn('hay ', cantSondasDuracion,' que superan la duracion promedio');
end.
{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
6. rayos X; 7. rayos gamma.
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}