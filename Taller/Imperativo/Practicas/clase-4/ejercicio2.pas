{Escribir un programa que:
a. Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro para: 
    i. Informar los datos de los socios en orden creciente.
    ii. Informar los datos de los socios en orden decreciente.
    iii. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
    iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.
    vi. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
    vii. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
    viii. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que retorne el promedio de las edades de los socios.

}

Program ejercicio1;

type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure GenerarArbol (var a: arbol);
{ Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente. }

  Procedure CargarSocio (var s: socio);
  var vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
  
  begin
    s.numero:= random (51) * 100;
    If (s.numero <> 0)
    then begin
           s.nombre:= vNombres[random(10)];
           s.edad:= 12 + random (79);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

var unSocio: socio;  
Begin
 writeln;
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 writeln;
 a:= nil;
 CargarSocio (unSocio);
 while (unSocio.numero <> 0)do
  begin
   InsertarElemento (a, unSocio);
   CargarSocio (unSocio);
  end;
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

procedure InformarSociosOrdenCreciente (a: arbol);
{ Informar los datos de los socios en orden creciente. }
  
  procedure InformarDatosSociosOrdenCreciente (a: arbol);
  begin
    if ((a <> nil) and (a^.HI <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HI);
    writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
    if ((a <> nil) and (a^.HD <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HD);
  end;

Begin
 writeln;
 writeln ('----- Socios en orden creciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenCreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;


procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informar el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
      if(a^.dato.edad >= maxEdad) then begin
        maxEdad := a^.dato.edad;
        maxNum := a^.dato.numero;
      end;
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;

var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure AumentarEdadNumeroImpar (a: arbol);
{Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.}
  
  function AumentarEdad (a: arbol): integer;
  var resto: integer;
  begin
     if (a = nil) 
     then AumentarEdad:= 0
     else begin
            resto:= a^.dato.edad mod 2;
            if (resto = 1) then a^.dato.edad:= a^.dato.edad + 1;
            AumentarEdad:= resto + AumentarEdad (a^.HI) + AumentarEdad (a^.HD);
          end;  
  end;

begin
  writeln;
  writeln ('----- Cantidad de socios con edad aumentada ----->');
  writeln;
  writeln ('Cantidad: ', AumentarEdad (a));
  writeln;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure informarSociosDecreciente(a: arbol);
    procedure informarDatosSociosOrdenDecreciente(a: arbol);
    begin
        if(a <> Nil) then begin
            if(a^.HD <> Nil) then
                informarDatosSociosOrdenDecreciente(a^.HD);
            WriteLn('Numero: ', a^.dato.numero, ' Nombre: ',a^.dato.    nombre, ' Edad: ', a^.dato.edad);
            if(a^.HI <> Nil) then
                informarDatosSociosOrdenDecreciente(a^.HI);
        end;
    end;
Begin
 writeln;
 writeln ('----- Socios en orden decreciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenDecreciente(a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

function informarExistenciaNombreSocio(a:arbol;nombre: String) : Boolean;
begin
    if(a <> Nil) then begin
    informarExistenciaNombreSocio := False;
    if(a^.dato.nombre = nombre) then
        informarExistenciaNombreSocio := True
    else if(a^.HI <> Nil) then
        informarExistenciaNombreSocio := informarExistenciaNombreSocio(a^.HI,nombre)
    else if(a^.HD <> Nil) then
        informarExistenciaNombreSocio := informarExistenciaNombreSocio(a^.HD,nombre);
    end;
end;

procedure informarCantidadSocios(a:arbol;var cantidadSocios: integer);
begin
    if(a <> Nil) then begin
        cantidadSocios += 1;
        if(a^.HI <> Nil) then
            informarCantidadSocios(a^.HI,cantidadSocios);
        if(a^.HD <> Nil) then
            informarCantidadSocios(a^.HD,cantidadSocios);
    end;
end;

function InformarPromedioDeEdad(a: arbol;cantidadSocios: integer) : real;
  procedure calcularEdades(a: arbol;var totalEdad: integer);
  begin
    if(a <> Nil) then begin
      totalEdad += a^.dato.edad;
      if(a^.HI <> Nil) then
        informarCantidadSocios(a^.HI,totalEdad);
      if(a^.HD <> Nil) then
        informarCantidadSocios(a^.HD,totalEdad);
    end;
  end;
var
  totalEdad: integer;
begin
  totalEdad := 0;
  calcularEdades(a,totalEdad);
  InformarPromedioDeEdad := totalEdad / cantidadSocios;
end;


var a: arbol; nombre: string; cantidadSocios: integer;
Begin
  randomize;
  GenerarArbol (a);
  InformarSociosOrdenCreciente (a);
  informarSociosDecreciente (a); {COMPLETAR}
  InformarNumeroSocioConMasEdad (a);
  AumentarEdadNumeroImpar (a);
  write('Nombre a buscar en el arbol: ');ReadLn(Nombre);
  WriteLn(InformarExistenciaNombreSocio (a,nombre)); {COMPLETAR}
  cantidadSocios := 0;
  InformarCantidadSocios (a,cantidadSocios); {COMPLETAR}
  writeLn('Hay ', cantidadSocios, ' socios.');
  writeLn('El promedio de edad es: ',InformarPromedioDeEdad (a,cantidadSocios):0:2); {COMPLETAR}
End.
{2. Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
necesario para:
i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
leídos y retorne la cantidad solicitada.
}