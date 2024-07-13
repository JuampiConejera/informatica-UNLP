(*9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )
*)

program practica1ejercicio9;
var
	operacion : char;
	numero, resultado: integer;
begin
	writeln('Escriba la operación, (+) para sumar o (-) para restar:  ');
	readln(operacion);
	if (operacion <> '+') and (operacion <> '-') then
		begin
			writeln('Error. Saliendo del programa.');
			Exit;
		end;
	writeln('Escriba la secuencia de números enteros. Finaliza con 0');
	readln(numero);
	resultado := numero;
	while (numero <> 0) do
		begin
			readln(numero);
			if (operacion = '+') then
				resultado := resultado + numero
			else
				resultado := resultado - numero;
	end;
	writeln('El resultado es:', resultado);
end.