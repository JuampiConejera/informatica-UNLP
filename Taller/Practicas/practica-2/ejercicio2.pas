program ejercicio2;

procedure descomponer(num:integer);
begin
  if(num < 10) then
    WriteLn(num)
  else begin
    descomponer(num div 10);
    WriteLn(num mod 10);
  end;
end;

procedure leerNumero();
var
  num : integer;
begin
  Write('Numero: ');ReadLn(num);
  while(num <> 0) do begin
    descomponer(num);
    Write('Numero: ');ReadLn(num);
  end;
end;
begin
  leerNumero();
end.
{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6}