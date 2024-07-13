(*
4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).
Solución:   *)
program practica1ejercicio4;
var
  original, final : Real;
begin
  WriteLn('Escriba el número real que desee:  ');
  ReadLn(original);
  WriteLn('Introduzca otro número:  ');
  ReadLn(final);
  while (original <> final) do
    begin
      WriteLn('Introduzca un número diferente:  ');
      ReadLn(final);
    end;
  WriteLn('Programa finalizado.', original:1:2, ' = ', final:1:2);
end.