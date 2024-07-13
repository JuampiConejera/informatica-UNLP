{Escriba un programa que lea y almacene informacion de jugadores bassquet. De cada jugador se lee: dni, apellido y nombre, y altura en cm. 
La lectura finaliza cuando se lee el jugador con dni 0, el cual no debe procesarse.}
program vidpractica;
type
    jugador = record
        dni : integer;
        nya : string[30];
        altura : integer;
    end;
    
    lista = ^nodo;
    nodo = record
        dato : jugador;
        sig : lista;
    end;

procedure leerJugador(var j : jugador);
begin
  with j do begin
    Write('DNI:  ');ReadLn(dni);
    if dni <> 0 then begin
        Write('Nombre y apellido:   '); ReadLn(nya);
        Write('Altura:  '); ReadLn(altura);
    end;
  end;
end;
procedure agregarAdelante(var l : lista; j : jugador);
    var
        aux : lista;
begin
  new(aux);
  aux^.dato := j;
  aux^.sig := l;
  l := aux;
end;
procedure cargarLista(var l : lista);
var
    j : jugador;
begin
  leerJugador(j);
  while j.dni <> 0 do begin
    agregarAdelante(l,j);
    leerJugador(j);
  end;
end;

function esPar(n : integer) : boolean; //A partir de la lista generada en el Ejercicio 1, informar la cantidad de jugadores con dni par.
begin
  esPar := (n mod 2) = 0;
end;
function cantDniPar(l : lista) : integer;
var
    cant : integer;
begin
    cant := 0;
    while(l <> Nil) do begin
      if(esPar(l^.dato.dni)) then
        cant := cant + 1;
      l := l^.sig;
    end;
    cantDniPar := cant;
end; // fin

var
    l : lista;
begin
    l := Nil;
    cargarLista(l);
    Write('La cantidad de jugadores con DNI par son: ', cantDniPar(l));
end.