(*
5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.
Solución:   *)
program practica1ejercicio5;
var
  original, final, doble, i : Real;
begin
  i := 0;
  WriteLn('Escriba el número real que desee:  ');
  ReadLn(original);
  doble := original * 2;
  WriteLn('Introduzca otro número:  ');
  ReadLn(final);
  while (doble <> final) and (i < 9) do
    begin
      WriteLn('Introduzca un número diferente:  ');
      ReadLn(final);
      i := i+1;
    end;
  if (i = 10) then
    ReadLn(final);
    if (doble <> final) then
      WriteLn('No se ha ingresado el doble de X');
  if (doble = final) then
    WriteLn('Programa finalizado.', original:1:2, ' = ', final:1:2);
end.