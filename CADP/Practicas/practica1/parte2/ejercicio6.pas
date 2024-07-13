(*
6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.
Solución:		*)
program ejercicio6;
Type
	codigos = 1..200;
var
	parCaro, i, par : integer;
	precio, pbarato, sbarato : real;
	codigo : codigos;
begin
	pbarato := 99999998;
	sbarato := 99999999;
	parCaro := 0;
	for i := 1 to 200 do begin
		write('escribir codigo del producto (1 - 200): ');
		read(codigo);
		write('escribir precio del producto: ');
		read(precio);
		writeln('');
		par := codigo mod 2;
		if (par = 0) and (precio > 16) then
			parCaro := parCaro + 1;
		if (precio < sbarato) then begin
			if (precio < pbarato) then begin
				sbarato := pbarato;
				pbarato := precio;
			end
			else
				sbarato := precio;
		end;
	end;
	Write('Mas barato : '); 
	Write(pbarato:0:2);
	Write('. Segundo mas barato: ' ); 
	Write(sbarato:0:2);
	writeln('');
	writeln('Mayores de 16 y con codigo par: ', parCaro);
end.
