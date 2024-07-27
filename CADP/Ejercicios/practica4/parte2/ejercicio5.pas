program ejercicio5;
const
  dimF = 500;
type
  rangoMonotributo = 'A'..'F';
  rangoDias = 1..31;
  rangoMes = 1..12;
  fecha = record
    dia: rangoDias;
    mes: rangoMes;
    anio: integer;
  end;
  cliente = record
    fecha: fecha;
    monotributo: rangoMonotributo;
    codigoCiudad: 1..2400;
    montoMensual: real;
  end;
  vector = array[1..dimF] of cliente;
  vectorMonotributo = array['A'..'F'] of integer;
procedure cargarVector(var v: vector);
var
  i,rando: integer;
begin
  ReadLn(rando);
  for i := 1 to dimF do begin
    v[i].fecha.dia := random(31)+1;
    v[i].fecha.mes := random(12)+1;
    v[i].fecha.anio := random(50)+1900;
    v[i].monotributo := Chr(random(6)+65);
    v[i].codigoCiudad := random(2400)+1;
    if(i mod 10 = 0) then begin
      Write('Monto Mensual: ');ReadLn(rando);
    end;
    v[i].montoMensual := rando;
  end;
end;

procedure inicializarVector(var v: vectorMonotributo);
var
  i: integer;
begin
  for i := 'A' TO 'F' do v[i] := 0;
end;

procedure procesarVector(v: vector);
var
  cantClientes,i: integer;
  montoTotal, promedio: real;
  vm: vectorMonotributo;
begin
  inicializarVector(vm);
  cantClientes := 0;
  montoTotal := 0;
  for i := 1 to dimF do begin
    vm[v[i].rangoMonotributo] := vm[v[i].rangoMonotributo] + 1;
    montoTotal := montoTotal + v[i].montoMensual;
  end;
  promedio := montoTotal / dimF;
  for i := 1 to dimF do begin
    if(v[i].montoMensual > promedio) then
      cantClientes := cantClientes + 1;
  end;
end;
var
  v: vector;
begin
  cargarVector(v);
  procesarVector(v);
end.
{5. La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el
monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato
(los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una
vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}