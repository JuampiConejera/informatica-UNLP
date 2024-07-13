(*
6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.*)
program ejercicio6;
type
	tipoProducto = (pantalon, remera, camisa, medias, campera, otro);
procedure leerProducto (var tipo : tipoProducto;var codigo : integer; var precio : real);
begin
	write('Escriba el tipo de producto.(pantalon, remera, camisa, medias, campera, otro): ');
	readln(tipo);
	write('Escriba el codigo del producto: ');
	readln(codigo);
	write('Escriba el precio del producto: ');
	readln(precio);
end;
var
	codigo, pantalonCaro, baratoA, baratoB, i : integer;
	precio, precioPantalonCaro, promedio: real;
	tipo: tipoProducto;
begin
	//inicializo
	promedio := 0;
	precioPantalonCaro := 0;
	pantalonCaro := 0;
	baratoA := 9999;
	baratoB := 9998;
	for i := 1 to 5 do begin
		leerProducto(tipo, codigo, precio);
		if(codigo < baratoB) then begin
			if (codigo < baratoA) then begin
				baratoB := baratoA;
				baratoA := codigo;
			end
			else
				baratoB := codigo;
		end;
		if (tipo = pantalon) then begin
			if (precio > precioPantalonCaro) then begin
				precioPantalonCaro := precio;
				pantalonCaro := codigo;
			end;
		end;
		promedio := promedio + precio;
	end;
	promedio := promedio / i;
	writeln('Codigos de los dos productos mas baratos: ', baratoB, ', ', baratoA);
	writeln('Codigo del pantalon mas caro: ', pantalonCaro);
	writeln('Precio promedio: ', promedio:1:2);
end.
