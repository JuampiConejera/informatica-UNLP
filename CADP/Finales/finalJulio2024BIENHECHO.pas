program finalJulio2024BIENHECHO;
type
  rangoFilas = 1..20;
  rangoColumnas = 1..15;
  vectorColumnas = array[rangoColumnas] of Boolean;
  tabla = array[rangoFilas] of vectorColumnas;
  jugador = record
    tablero: tabla;
    puntaje: integer;
  end;

procedure inicializarJugador(var j: jugador);
var
  i,numeroFila, numeroColumna: integer;
begin
  for i:= 1 to 7 do begin
    numeroFila := random(20) +1;
    numeroColumna := random(15) +1;
    j.tablero[numeroFila][numeroColumna] := true;
  end;
  j.puntaje := 0;
end;

function dameNumeroFila() : rangoFilas;
begin
  dameNumeroFila := random(20)+1;
end;
function dameNumeroColumna() : rangoColumnas;
begin
  dameNumeroColumna := random(15)+1;
end;

procedure juego(var j: jugador;numeroFila,numeroColumna: integer);
begin
  if(j.tablero[numeroFila][numeroColumna]) then begin
    j.tablero[numeroFila][numeroColumna] := false;
    j.puntaje := j.puntaje+1;
  end;
end;

var
  jugador1,jugador2: jugador;
  i: integer;
begin
  randomize;
  inicializarJugador(jugador1);
  inicializarJugador(jugador2);
  for i:= 1 to 10 do begin
    juego(jugador1,dameNumeroFila(),dameNumeroColumna());
    juego(jugador2,dameNumeroFila(),dameNumeroColumna());
  end;
  WriteLn('El jugador 1 sacó ',jugador1.puntaje,' puntos.');
  WriteLn('El jugador 2 sacó ',jugador2.puntaje,' puntos.');
end.