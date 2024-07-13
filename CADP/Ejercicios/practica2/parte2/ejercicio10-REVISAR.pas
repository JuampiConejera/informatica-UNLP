(*
10. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.*)
(**)
program ejercicio10;
//Devuelve true si letra es vocal, sino false.
function vocal(letra : char) : boolean;
begin
	vocal := (letra = 'a') or (letra = 'e') or (letra = 'i') or (letra = 'o') or (letra = 'u');
end;

//Devuelve false si no se escribe una vocal en el patrón A
function validarA() : boolean;
var
	letra : char;
begin
	validarA := true;
	write('Escriba la primer entrada (vocal):    ');
	readln(letra);
	if (not vocal(letra)) then
		validarA := false;
end;

//Devuelve true cuando si se ingresa el carácter '$', sino false.
function signoDolar(dolar : char) : boolean;
begin
	signoDolar := (dolar = '$');
end;

//Devuelve false si no escribe el carácter de signo dólar.
function validarDolar() : boolean;
var
	dolar : char;
begin
	validarDolar := true;
	write('Escriba "$":    ');
	readln(dolar);
	if (not signoDolar(dolar)) then
		validarDolar := false;
end;

function consonante(letra : char) : boolean;
begin
	//Devuelve true cuando se ingresa un caracter de "a" a "z", exceptuando "a", "e" , "i", "o", "u".
	consonante := (letra >= 'a') and (letra <= 'z') and not ((letra = 'a') or (letra = 'e') or (letra = 'i') or (letra = 'o') or (letra = 'u'));
end;

//Devuelve false si no se escribe una consonante.
function validarB() : boolean;
var
	letra : char;
begin
	validarB := true;
	writeln('Escriba la segunda entrada (consonante):    ');
	readln(letra);
	if (not consonante(letra)) then
		validarB := false;
end;

//Devuelve true cuando si se ingresa el carácter '#', sino false.
function signoAsterisco(asterisco : char) : boolean;
begin
	signoAsterisco := (asterisco = '#');
end;

//Devuelve false si no escribe el carácter de signo dólar.
function validarAsterisco() : boolean;
var
	asterisco : char;
begin
	validarAsterisco := true;
	write('Escriba "#":    ');
	readln(asterisco);
	if (not signoAsterisco(asterisco)) then
		validarAsterisco := false;
end;

//programa principal.
begin
	if (validarA()) and (validarDolar()) and (validarB()) and (validarAsterisco()) then
		writeln('El patron es correcto')
	else begin
		if (not validarA()) then
			writeln('La secuencia A no cumple con el patron')
		else if (not validarDolar()) then
			writeln('No se escribio "$" instantaneamente luego de la primer secuencia')
		else if (not validarB()) then
			writeln('La secuencia B no cumple con el patron')
		else if (not validarAsterisco()) then
			writeln('No se escribio "#" instantaneamente luego de la segunda secuencia')
		else
			writeln('error');
	end;
	
end.

//corregir
