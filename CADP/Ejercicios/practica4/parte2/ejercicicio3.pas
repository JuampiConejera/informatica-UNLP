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
    v[dimL].dineroTransportado := random(1000);
    v[dimL].distanciaRecorrida := distancia;
    distancia := random(500);
    dimL := dimL + 1;
  end;
end;

procedure procesarVector(v: vector;dimL: integer);
var
  montoTotal,promedio,min: real;
  diaMin,distanciaMin: integer;
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