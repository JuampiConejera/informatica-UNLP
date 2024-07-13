program siete;
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
    repeat
        leerSonda(s);
        agregarAdelante(l,s);
    until s.nombre = 'GAIA'
end;
function cumple(s : sonda) : Boolean
begin
    if(((s.duracion * s.Mantenimiento) < s.Construccion) and (s.espectroElectromagnetico > 1)) then
        cumple := true
    else
        cumple := false;

end;
procedure procesarLista(l : lista; var listaCumple : lista; var listaNoCumple : lista);
var
begin
    while(l <> Nil) do begin
        if(cumple(l^.dato)) then
            agregarAdelante(listaCumple)
        else
            agregarAdelante(listaNoCumple);
        l := l^.sig;
    end;
end;
procedure puntoC(l : lista);
var
    costoTotal : real;
    cantidad : integer;
begin
    cantidad := 0;
    costoTotal := 0;
    while(l <> Nil) do begin
        costoTotal := costoTotal + ((l^.dato.duracion*l^.dato.Mantenimiento) + l^.dato.Construccion);
        cantidad := cantidad + 1;
        l := l^.sig;
    end;
    WriteLn('hay ', cantidad, ' sondas.');
    WriteLn(costoTotal);
end;
var
    listaCumple, listaNoCumple, l : lista;
begin
    listaCumple := Nil;
    listaNoCumple := Nil;
    l := Nil;
    CargarLista(l);
    procesarLista(l, listaCumple, listaNoCumple);
end.
{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio
anterior, se han determinado los siguientes criterios:
- Sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- No se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse
desde la superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6),
implementar un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con
los nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de
la ESA y retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro
con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad
y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por
H2020. Para ello, utilice el módulo realizado en b.}