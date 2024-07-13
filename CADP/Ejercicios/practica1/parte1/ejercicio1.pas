(*
1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de losdos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos son iguales”.
Solución:       *)
program practica1ejercicio1;
var
  entero1, entero2 : LongInt;
begin
  WriteLn('Introduzca el primer entero:  ');
  ReadLn(entero1);
  WriteLn('Introduzca el segundo entero:  ');
  ReadLn(entero2);
  if (entero1 > entero2) then
    WriteLn(entero1, ' es mayor.')
  else
    WriteLn(entero2, ' es mayor.')
end.
