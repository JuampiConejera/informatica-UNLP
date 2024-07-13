(*
2.Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional 
Solución a.:       *)

program practica0ejercicio2a;
var
    entero1, entero2, suma: Integer;
begin
    suma := 0;
    writeln('Escribí el número 1 de 2:  ');
    ReadLn(entero1);
    writeln('Escribí el número 2 de 2:  ');
    ReadLn(entero2);
    suma := entero1 + entero2;
    WriteLn(suma)
end.

//Solución b.:

program practica0ejercicio2b;
var
    entero1, entero2: Integer;
begin
    writeln('Escribí el número 1 de 2:  ');
    ReadLn(entero1);
    writeln('Escribí el número 2 de 2:  ');
    ReadLn(entero2);
    writeln(entero2 + entero1);
end.
