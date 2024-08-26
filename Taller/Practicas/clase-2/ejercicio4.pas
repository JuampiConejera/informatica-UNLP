program ejercicio4;
procedure binario(num: integer);
begin
  if(num > 0) then begin
    binario(num div 2);
    Write(num mod 2);
  end;
end;

procedure imprimirBinarios();
var
  num: integer;
begin
  write('Numero a convertir: ');ReadLn(num);
  if(num <> 0) then begin
    binario(num);
    WriteLn;
    imprimirBinarios();
  end;
end;

begin
  imprimirBinarios();
end.
{4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}