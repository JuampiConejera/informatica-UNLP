(*
5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60.

Solución:       *)
program practica0ejercicio5;
var
    repartija, sobrante, cantCaramelos, cantClientes : Integer;
    costo, unidad : Real;
begin
  unidad := 1.60;
  WriteLn('Ingrese la cantidad de caramelos:  ');
  ReadLn(cantCaramelos);
  WriteLn('Ingrese la cantidad de clientes:  ');
  ReadLn(cantClientes);
  repartija := cantCaramelos div cantClientes;
  sobrante := cantCaramelos mod cantClientes;
  WriteLn('Le corresponde a cada cliente: ', repartija);
  WriteLn('El kiosquero se queda con: ', sobrante);
  costo := repartija * unidad;
  WriteLn('El kisoquero debe cobrar a cada cliente: $', costo:1:2);

end.
