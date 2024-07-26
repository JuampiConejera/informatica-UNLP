program ejercicio3;
const
  dimF = 200;
type
  rangoDias = 1..31;
  viaje = record
    dia: rangoDias;
    dineroTransportado: real;
    distanciaRecorrida: integer;
  end;
  vector = array[1..dimF] of viaje;
  vectorDias = array[rangoDias] of integer;

procedure inicializarVector(var vd: vectorDias);
var
  i : integer;
begin
  for i := 1 to 31 do
    vd[i] := 0;
end;

procedure cargarVector(var v: vector;var dimL: integer);
var
  distancia: integer;
begin
  distancia := random(500);
  while(distancia <> 0) and (dimL <= dimF) do begin
    v[dimL].dia := random(31)+1;
    v[dimL].dineroTransportado := random(1000)+1;
    v[dimL].distanciaRecorrida := distancia;
    distancia := random(500)+1;
    dimL := dimL + 1;
  end;
end;

procedure procesarVector(v: vector;dimL: integer);
var
  montoTotal,min: real;
  diaMin,distanciaMin,i: integer;
  vd: vectorDias;
begin
  inicializarVector(vd);
  montoTotal := 0; min := 32000;diaMin := 0; distanciaMin := 0;
  for i := 1 to dimL do begin
    montoTotal := montoTotal + v[i].dineroTransportado;
    if(v[i].dineroTransportado < min) then begin
      min := v[i].dineroTransportado;
      distanciaMin := v[i].distanciaRecorrida;
      diaMin := v[i].dia;
    end;
    vd[v[i].dia] := vd[v[i].dia] + 1;
  end;
  WriteLn('Monto promedio: ',montoTotal/dimL:0:2);
  WriteLn('El dia que se transportó menos dinero fue el dia: ',diaMin,' en ',distanciaMin,'km con $',min:2:2);
  for i := 1 to 31 do
    WriteLn('dia ',i,': ',vd[i]);
end;

procedure eliminar(var v: vector; var dimL: integer);
var
  i,j: integer;
begin
  for i := 1 to dimL do
    if(v[i].distanciaRecorrida = 100) then begin
      for j := i to dimL-1 do
        v[i] := v[i+1];
      dimL := dimL -1;  
    end;
end;

var
  v: vector;
  dimL: integer;
begin
  randomize;
  dimL := 1;
  cargarVector(v,dimL);
  procesarVector(v,dimL);
  eliminar(v,dimL);
end.
{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por
el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}