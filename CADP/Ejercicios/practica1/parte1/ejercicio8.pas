(*8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.
*)
program practica1ejercicio8;
var
	caract1, caract2, caract3 : char;
begin
	writeln('Escribir el primer caracter');
	readln(caract1);
	writeln('Escribir el segundo caracter');
	readln(caract2);
	writeln('Escribir el tercer caracter');
	readln(caract3);
	if (caract1 = 'a') or (caract1 = 'e') or (caract1 = 'i') or (caract1 = 'o') or (caract1 = 'u') then
	begin
		if (caract2 = 'a') or (caract2 = 'e') or (caract2 = 'i') or (caract2 = 'o') or (caract2 = 'u') then
		begin
			if (caract3 = 'a') or (caract3 = 'e') or (caract3 = 'i') or (caract3 = 'o') or (caract3 = 'u') then
				writeln('Los tres son vocales')
			else
				writeln('Los primeros dos son vocales, excepto el tercero')
		end
		else
			writeln('El primero es vocal, el segundo ya no')
	end
	else
		writeln('El primero ni siquiera es vocal')
end.