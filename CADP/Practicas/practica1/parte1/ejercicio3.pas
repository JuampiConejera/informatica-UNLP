(*
3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10
Solución:   *)
program practica1ejercicio3;
var
	num1, num2, num3 : integer;
begin
	WriteLn('Escriba los tres enteros, uno por cada línea.');
	ReadLn(num1);
	ReadLn(num2);
	ReadLn(num3);
  if (num1 > num2) and (num1 > num3) then begin
    if (num2 > num3) then
      WriteLn('Primero: ', num1, ', segundo: ', num2, ', tercero: ',num3)
    else
      WriteLn('Primero: ', num1, ', segundo: ', num3, ', tercero: ',num2);
    end
  else if (num2 > num1) and (num2 > num3) then begin
    if (num1 > num3) then
      WriteLn('Primero: ', num2, ', segundo: ', num1, ', tercero: ',num3)
    else
      WriteLn('Primero: ', num2, ', segundo: ', num3, ', tercero: ',num1)
    end
  else if (num3 > num1) and (num3 > num2) then begin
    if (num1 > num2) then
      WriteLn('Primero: ', num3, ', segundo: ', num1, ', tercero: ',num2)
    else
      WriteLn('Primero: ', num3, ', segundo: ', num2, ', tercero: ',num1)
    end
end.