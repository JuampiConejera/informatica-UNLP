(*
1.  implemente un programa que lea por teclado dos números enteros e imprima en pantalla los valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el mensaje: Se ingresaron los valores 8 y 4 *)
//Solución: 
program practica0ejercicio1;
var
    entero1, entero2: Integer;
begin
    writeln('Escribí el número 1 de 2:  ');
    ReadLn(entero1);
    writeln('Escribí el número 2 de 2:  ');
    ReadLn(entero2);
    writeln(entero2, ' ', entero1);
end.