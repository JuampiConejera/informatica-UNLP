(*
2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero
Solución:   *)
program practica1ejercicicio2;
var
  numero : Real;
begin
  WriteLn('Escriba cualquier número');
  ReadLn(numero);
  if (numero < 0) then
    begin
      numero := -numero;
      WriteLn('|',numero:1:0,'|')
    end
  else
    WriteLn('|',numero:1:0,'|')
end.
