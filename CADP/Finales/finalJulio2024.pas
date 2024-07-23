program final2;
type
  rangoFilas = 1..20;
  rangoColumnas = 1..15;
  rangoBarcos = 1..7;
  rangoRondas = 1..10;
  vectorFila = array[rangoFilas] of boolean;
  vectorColumna = array[rangoColumnas] of boolean;
  posicionBarco = record
    fila: vectorFila;
    columna: vectorColumna;
  end;
  jugador = record
    barcos: posicionBarco;
    puntaje: integer;
  end;

procedure inicializarPartida(var j: jugador);
var
  i,filaRandom,columnaRandom: integer;
begin
  for i:= 1 to 7 do begin
    WriteLn('Posicion barco ',i);
    filaRandom := Random(20)+1;
    Write('Fila: ');j.barcos.fila[filaRandom] := true; WriteLn('   ',filaRandom); 
    columnaRandom := Random(15)+1;
    Write('Columna: ');j.barcos.columna[columnaRandom] := true; WriteLn('   ',columnaRandom);
    WriteLn;
    WriteLn;
  end;
  j.puntaje := 0;
  end;

procedure juego(var j: jugador;numeroFila,numeroColumna: integer);
begin
  if( j.barcos.fila[numeroFila] and j.barcos.fila[numeroColumna] ) then begin
    j.puntaje := j.puntaje + 1;
    j.barcos.fila[numeroFila] := false;
    j.barcos.columna[numeroColumna] := false;
  end;
end;

function dameNumeroFila() : integer;
begin
  dameNumeroFila := Random(20)+1;
end;
function dameNumeroColumna() : integer;
begin
  dameNumeroColumna := Random(15)+1;
end;
var
  jugador1, jugador2: jugador;
  i: integer;
begin
  randomize;
  inicializarPartida(jugador1);
  inicializarPartida(jugador2);
  for i:= 1 to 10 do begin
    juego(jugador1,dameNumeroFila(),DameNumeroColumna());
    juego(jugador2,dameNumeroFila(),DameNumeroColumna());
  end;
  WriteLn(jugador1.puntaje);
  WriteLn(jugador2.puntaje);
end.
{1-Realice un programa que resuelva lo siguiente: dos amigos juegan a la batalla naval (simplificada). 
Para esto cada amigo dispone de su tablero de 20 filas x 15 columnas donde en alguna posición del tablero tiene ubicados cada uno de sus 7 barcos (cada barco se encuentra en una únicaposición).
El juego consiste en lo siguiente:
.Se juegan 10 rondas, en cada ronda, cada jugador invoca a la función dameNumeroFila y a la función DameNumeroColumna y a partir de esos valores se debe invocar al procedimiento juego, quedado un tablero, una fila y una columna, retorna verdadero si había un barco en esa posición o falso en caso contrario. Primero juega el jugador 1 y luego el 2 hasta que ocurran las 10 rondas.
.Luego de las 10 rondas se debe informar el puntaje de cada jugador, es decir, a cuantos barcos del otro jugador ha logrado hundir.
NOTAS: Las funciones dameNumeroFila y dameNumeroColumna no deben implementarse, solo invocarse. 
El resto de los módulos utilizados deben implementarse. Además declarar todas las estructuras utilizadas.
Tenga en cuenta que el mismo barco no debe contabilizarse dos veces, es decir, si por azar se consulta la fila 1 columna 2 y ahí se encontraba un barco, si en alguna otra ronda al mismo jugador le tocan esos mismos valores ya no se contará como que allí hay un barco porque ya fue hundido.}