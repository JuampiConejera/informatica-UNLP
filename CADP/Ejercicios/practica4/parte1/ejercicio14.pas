program ejercicio14;
const
  dimF = 1000;
type
  rangoCodigo = 1..dimF;
  rangoRol = 1.5;
  participante = record
    pais: string;
    codigoProyecto: rangoCodigo;
    nombreProyecto: string;
    rolProyecto: rangoRol;
    cantidadHoras: integer;
  end;
  vector = array[1..dimF] of participante;
procedure cargarVector(var v: vector;var dimL: integer);
var
  codigoProyecto: integer;
begin
  codigoProyecto := random(1001);
  while(codigoProyecto <> 0) and (dimL <= dimF)do begin
    v[i].pais := Chr(random(26)+65);
    v[i].codigoProyecto := random(1000)+1;
    v[i].nombreProyecto := Chr(random(26)+65);
    v[i].rolProyecto := random(5)+1;
    v[i].cantidadHoras := random(3000); 
  end;
end;
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