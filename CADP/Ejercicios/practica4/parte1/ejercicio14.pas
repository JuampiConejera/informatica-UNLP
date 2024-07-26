program ejercicio14;
const
  dimF = 1000;
type
  vectorPrecios = array[1..5] of real;
  rangoPrecio = 1..5;
  rangoCodigo = 1..dimF;
  participante = record
    pais: string;
    codigoProyecto: rangoCodigo;
    nombreProyecto: string;
    rolProyecto: rangoPrecio;
    cantidadHoras: integer;
  end;
  vector = array[1..dimF] of participante;
  contadorProyecto = record
    monto: real;
    cantArqui: integer;
  end;
  vectorTotal = array[1..dimF] of contadorProyecto;

procedure cargarVectorPrecios(var vp: vectorPrecios);
begin
  vp[1] := 35.2;
  vp[2] := 27.45;
  vp[3] := 31.03;
  vp[4] := 44.28;
  vp[5] := 39.87;
end;

procedure cargarVector(var v: vector;var dimL: integer);
var
  codigoProyecto: integer;
begin
  codigoProyecto := random(1001);
  while(codigoProyecto <> 0) and (dimL <= dimF)do begin
    v[dimL].pais := Chr(random(26)+65);
    v[dimL].codigoProyecto := codigoProyecto;
    v[dimL].nombreProyecto := Chr(random(26)+65);
    v[dimL].rolProyecto := random(5)+1;
    v[dimL].cantidadHoras := random(3000); 
    dimL := dimL + 1;
    codigoProyecto := random(1001);
  end;
end;

procedure inicializarVectorTotal(var vt: vectorTotal);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    vt[i].monto := 0;
    vt[i].cantArqui := 0;
  end;
end;

procedure procesarVector(v: vector;dimL: integer;vp: vectorPrecios;var vt: vectorTotal);
var
  cantHorasABBDD,codigoMin,i: integer;
  montoTotalArgentina,min: real;
begin
  montoTotalArgentina := 0; cantHorasABBDD := 0; min := 0; codigoMin := 0;
  for i := 1 to dimL do begin
    if(v[i].pais = 'a') then
      montoTotalArgentina := montoTotalArgentina + (vp[v[i].rolProyecto] * v[i].cantidadHoras);
    if(v[i].rolProyecto = 3) then
      cantHorasABBDD := cantHorasABBDD + v[i].cantidadHoras;
    vt[v[i].codigoProyecto].monto := vt[v[i].codigoProyecto].monto + (v[i].cantidadHoras * vp[v[i].rolProyecto]);
    if(v[i].rolProyecto = 4) then
      vt[v[i].codigoProyecto].cantArqui := vt[v[i].codigoProyecto].cantArqui + 1;
  end;
  for i := 1 to dimF do begin
    if(vt[i].monto < min) then begin
      min := vt[i].monto;
      codigoMin := i;
    end;
  end;
  for i := 1 to dimF do
    WriteLn('En el proyecto ',i,' hay ',vt[i].cantArqui);
  WriteLn('Monto total invertido en desarrolladores argentinos: ',montoTotalArgentina:2:0);
  WriteLn('Cantidad total de horas trabajadas por ABBDD: ',cantHorasABBDD);
  WriteLn('El codigo del proyecto con menor monto: ',codigoMin, ' con $',min:2:0);
end;
var
  v: vector;
  dimL: Integer;
  vp: vectorPrecios;
  vt: vectorTotal;
begin
  randomize;
  cargarVectorPrecios(vp);
  dimL := 1;
  cargarVector(v,dimL);
  inicializarVectorTotal(vt);
  procesarVector(v,dimL,vp,vt);
end. 
//ACLARACION= a veces tira error 216 pq con Random no se cargan todos los montos y en linea 73 se pregunta sin inicializar

{14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido
en los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)
1 |Analista Funcional                |35,20
2 |Programador                       |27,45
3 |Administrador de bases de datos   |31,03
4 |Arquitecto de software            |44,28
5 |Administrador de redes y seguridad|39,87
Nota: los valores/hora se incluyen a modo de ejemplo
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió
en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de
proyecto -1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a. El monto total invertido en desarrolladores con residencia en Argentina.
b. La cantidad total de horas trabajadas por Administradores de bases de datos.
c. El código del proyecto con menor monto invertido.
d. La cantidad de Arquitectos de software de cada proyecto.}