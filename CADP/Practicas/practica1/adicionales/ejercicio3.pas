(*
Actividad 3: Ventas de tanques de agua
Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la
lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos
Recordar: las fórmulas para el cálculo de volumen ( V ) del cilindro y del paralelepipedo rectangular son:
V = PI * R^2 * h } -> Cilindro
V = A * B * C } -> Rectángulo
Solución:		*)
program ejercicio3;
var
	tipoCilindro : char;
	anchoR, largoR, alto, radioC, volumen, primeroVolumenTotal, segundoVolumenTotal, volumenPromedioC, volumenPromedioR : real;
	vendidosC, vendidosR, menoresAlto, menoresVolumen : integer;
begin
	//Tanques menores a 800 metros cúbicos
	menoresVolumen := 0;
	//Tanques menores a 1.40 metros
	menoresAlto := 0;
	//tanques rectangulares vendidos
	vendidosR := 0;
	//tanques cilindricos vendidos
	vendidosC := 0;
	//Volumen promedio de los tanques rectangulares
	volumenpromedioR := 0;
	//Volumen promedio de los tanques cilindricos
	volumenPromedioC := 0;
	//Volumen de los dos mayores tanques vendidos
	primeroVolumenTotal := 0;
	segundoVolumenTotal := 0;
	writeln('Ingrese "R" para tanque Rectangular. Ingrese "C" para tanque cilindrico: ');
	readln(tipoCilindro);
	while(tipoCilindro <> 'Z') do begin
		volumen := 0;
		if(tipoCilindro = 'R') or (tipoCilindro = 'C') then begin
			if(tipoCilindro = 'R') then begin
				write('Ingrese el ancho (en metros): ');
				readln(anchoR);
				write('Ingrese el largo (en metros): ');
				readln(largoR);
				write('Ingrese el alto (en metros): ');
				readln(alto);
				volumen := anchoR * largoR * alto;
				volumenPromedioR := volumenPromedioR + volumen;
				vendidosR := vendidosR + 1;
			end
			else begin
				write('Ingrese el radio (en metros): ');
				readln(radioC);
				write('Ingrese el alto (en metros): ');
				readln(alto);
				volumen := PI * radioC * alto;
				volumenPromedioC := volumenPromedioC + volumen;
				vendidosC := vendidosC + 1;
			end;
			if(volumen > segundoVolumenTotal) then begin
				if(volumen > primeroVolumenTotal) then begin
					segundoVolumenTotal := primeroVolumenTotal;
					primeroVolumenTotal := volumen;
				end
				else
					segundoVolumenTotal := volumen;
			end;
		end;
		writeln('Ingrese "R" para tanque Rectangular. Ingrese "C" para tanque cilindrico: ');
		readln(tipoCilindro);
		if(alto < 1.40) then
			menoresAlto := menoresAlto + 1;
		if(volumen < 800) then
			menoresVolumen := menoresVolumen + 1;
	end;
	if(vendidosC = 0) then
		vendidosC := 1;
	if(vendidosR = 0) then
		vendidosR := 1;
	volumenPromedioC := volumenPromedioC / vendidosC;
	volumenPromedioR := volumenPromedioR / vendidosR;
	writeln('El tanque mas grande mide: ', primeroVolumenTotal:1:2, 'm3');
	writeln('El segundo tanque mas grande mide :', segundoVolumenTotal:1:2, 'm3');
	writeln('-------------------------------');
	writeln('El volumen promedio de tanques cilindricos vendidos es de: ',volumenPromedioC:1:2, 'm3');
	writeln('El volumen promedio de tanques rectangulares vendidos es de: ', volumenPromedioR:1:2, 'm3');
	writeln('-------------------------------');
	writeln(menoresAlto, ' tanques tienen una altura menor a 1.40m');
	writeln(menoresVolumen, ' tanques tienen un volumen menor a 800m3');
end.
	
	
	
	
