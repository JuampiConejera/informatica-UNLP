program ejercicio6;
procedure binario(num: integer);
begin
  if(num > 0) then begin
    binario(num);
    Write(num MOD 2);
  end;
end;

var
  num: integer;
begin
  WriteLn('Numero entero');
  while(num <> 0) do begin
    
  end;
end.
{6.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).}