program ejercicio13;
type
  vectorLugar = array[1..100] of real;
  vectorAnio = array[1974..2024] of vectorLugar;

procedure cargarVector(var v: vectorAnio);
var
  i,j: integer;
begin
  for i := 1974 to 2024 do
    for j := 1 to 100 do begin
      v[i][j] := random(75) - 20;
    end;
end;

procedure procesarVector(v: vectorAnio);
var
  i,j,anioTemp,maxAnio: integer;
  sumaAnio, maxTemp, maxAnioTotal: real;
begin
  maxTemp := -32600; anioTemp := 0; maxAnioTotal := 0;
  for i := 1974 to 2024 do begin
    sumaAnio := 0;
    for j := 1 to 100 do begin
      sumaAnio := sumaAnio + v[i][j];
      if(v[i][j] > maxTemp) then begin
        maxTemp := v[i][j];
        anioTemp := i;
      end;
    end;
    sumaAnio := sumaAnio/100;
    if(sumaAnio > maxAnioTotal) then begin
      maxAnioTotal := sumaAnio;
      maxAnio := i;
    end;
  end;
  WriteLn('El año con mayor temperatura promedio fue: ',maxAnio,' con ',maxAnioTotal:0:2);
  WriteLn('El año donde la temperatura en cualquier lugar fue mayor fue: ',anioTemp,' con: ',maxTemp:0:2);
end;
var
  v: vectorAnio;
begin
  randomize;
  cargarVector(v);
  procesarVector(v);
end.
{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos
lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con
todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos.
Realizar un programa que lea y almacene los datos correspondientes a las mediciones de los últimos
50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la información,
obtener:
a. El año con mayor temperatura promedio a nivel mundial.
b. El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}