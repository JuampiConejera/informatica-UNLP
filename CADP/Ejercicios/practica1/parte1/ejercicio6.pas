(*
6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse. Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un promedio).
Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor al valor 2500 (en el ejemplo anterior se debería informar 0%).

*)
program practica1ejercicio6;
var
  promedio, porcentaje : Real;
  legajo, cantAlumnos, promedioMayor, alumnosDestacados : Integer;
begin
  cantAlumnos := 0;
  promedioMayor := 0;
  alumnosDestacados := 0;
  WriteLn('Escribir el número de legajo:  ');
  ReadLn(legajo);
  while (legajo <> -1) do
    begin
      WriteLn('Escribir el promedio del alumno:  ');
      ReadLn(promedio);
      if (promedio > 6.5) then    // B.
        promedioMayor := promedioMayor+1;
      if (promedio > 8.5) and (legajo < 2500) then    // C.
        alumnosDestacados := alumnosDestacados+1;
      cantAlumnos := cantAlumnos+1;     // A.
      WriteLn('Escribir el número de legajo:  ');
      ReadLn(legajo);
    end;
  porcentaje := alumnosDestacados / cantAlumnos * 100;
  WriteLn('a. Se leyeron ', cantAlumnos, ' alumnos.');
  writeln('b. Hay ', promedioMayor,' alumnos con mejor promedio a 6.5');
  writeln('c. El ', porcentaje:1:1, '% son alumnos destacados');

end.