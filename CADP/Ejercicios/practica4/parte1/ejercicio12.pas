program ejercicio12;
const
  dimF = 53;
type
  rangoTipo = 1..4;
  galaxia = record
    nombre: string;
    tipo: rangoTipo;
    masa: integer;
    distancia: integer;
  end;
  vector = array[1..dimF] of galaxia;
  vectorGalaxia = array[1..4] of integer;

procedure cargarVector(var v: vector);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    v[i].nombre := Chr(random(26)+65);
    v[i].tipo := random(4)+1;
    v[i].masa := random(32000);
    v[i].distancia := random(10000);
  end;
end;

procedure inicializarVector(var v: vectorGalaxia);
var
  i: integer;
begin
  for i := 1 to 4 do
    v[i] := 0;
end;

procedure procesarVector(v: vector);
var
  vg: vectorGalaxia;
  i, masaTotal, cantRegulares, max1, max2, min1, min2: integer;
  nombreMax1, nombreMax2, nombreMin1, nombreMin2: string;
begin
  inicializarVector(vg);
  masaTotal := 0; cantRegulares := 0;
  max1 := -1; max2 := -1; min1 := 32000; min2 := 32000;
  nombreMax1 := ''; nombreMax2 := ''; nombreMin1 := ''; nombreMin2 := '';
  for i := 1 to dimF do begin
    vg[v[i].tipo] := vg[v[i].tipo] + 1;
    if((v[i].nombre = 'v') or (v[i].nombre = 'a') or (v[i].nombre = 't')) then 
      masaTotal := masaTotal + v[i].masa;
    if((v[i].tipo <= 3) and (v[i].distancia < 1000)) then
      cantRegulares := cantRegulares + 1;
    if(v[i].masa > max1) then begin
      max2 := max1;
      nombreMax2 := nombreMax1;
      max1 := v[i].masa;
      nombreMax1 := v[i].nombre;
    end
    else if(v[i].masa > max2) then begin
      max2 := v[i].masa;
      nombreMax2 := v[i].nombre
    end;
    if(v[i].masa < min1) then begin
      min2 := min1;
      nombreMin2 := nombreMin1;
      min1 := v[i].masa;
      nombreMin1 := v[i].nombre
      end
    else if(v[i].masa < min2) then begin
      min2 := v[i].masa;
      nombreMin2 := v[i].nombre;
    end;
  end;
  for i := 1 to 4 do
    WriteLn(vg[i]);
  WriteLn(masaTotal,'   ',masaTotal/dimF:0:2);
  WriteLn(cantRegulares);
  WriteLn(min2,nombreMin2);
  WriteLn(min1,nombreMin1);
  WriteLn(max2,nombreMax2);
  WriteLn(max1,nombreMax1);
end;

var
  v: vector;
begin
  randomize;
  cargarVector(v);
  procesarVector(v);
end.
{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el
Grupo Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga,
informe:
a. La cantidad de galaxias de cada tipo.
b. La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c. La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d. El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}