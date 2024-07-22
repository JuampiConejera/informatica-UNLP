{1.Dada la siguiente declaración y los siguientes módulos, indique qué opción o qué opciones agrega un elemento al final de la lista recibida. Explique su decisión}
//ESTRUCTURA
type
  lista = ^nodo;
  nodo = record
    dato : integer;
    sig : lista;
  end;
//Punto a)
procedure agregar(var l: lista; var ult: lista; elem : integer);
var
  nue: lista;
begin
  nue^.dato := elem;
  nue^.sig := Nil;
  if(l = nil) then l := nue
  else ult^.sig := nue;
  ult := nue;
end;

//Punto b)
procedure agregar(var l: lista; var ult: lista; elem: integer);
var
  nue: lista;
begin
  new(nue); nue^.dato := elem; nue^.sig := Nil;
  if(l = Nil) then l := nue
  else ult^.sig := nue;
  ult := nue;
end;

//Punto c)
procedure agregar(var l: lista; var ult: lista; elem: integer);
var
  nue: lista; ult: lista;
begin
  New(nue); nue^.dato := elem; nue^.sig := Nil;
  ult := l;
  while(ult <> Nil) do
    ult := ult^.sig;
  ult^.sig := nue;
end;


{RTA:

El único procedimiento que agrega un elemento al final de la lista es el punto B.; ya que en el punto A. no hay New() y es necesario si se quiere actualizar una lista. En el punto C, el while() queda en un bucle infinito ya que ult nunca puede ser NIL.

}

{2. Qu+e valores se imprimen en las sentencias writeln si se lee en la variable "DNI" su número de documento.}
program ejercicio2;
procedure calcular(var total: integer; var dig3: integer; var dig1: integer; dig2: integer);
begin{calcular}
  total := dig1 + (dig2 MOD 3);
  dig3 := dig3 + (total DIV 2);
end;
var
  dni, dig1, dig2, dig3, total: integer;
begin
  ReadLn(dni);
  dig1 := dni MOD 10;
  dig2 := dni MOD 100;
  dig3 := dni MOD 1000;
  total := 0;
  calcular(total, dig1,dig2,dig3);
  WriteLn('total = ', total);
  WriteLn('dig1 = ', dig1);
  WriteLn('dig2 = ', dig2);
  WriteLn('dig3 = ', dig3);
end. //fin del programa

{RTA:
DNI = 45425027
dig1 = 7
dig2 = 27
dig3 = 27
total = 0

Procedimiento
total = 7 + 0
dig3 = 27+3

writeln
total = 7
dig1 = 7
dig2 = 27
dig 3 = 30
}

{3. Indicar para cada proposición si es verdadera o falsa y justificar.
a. Todas las operaciones permitidas para variables de tipo entero, también sos permitidas para variables de tipo real.
b. Siempre es posible reemplazar un for por un while y viceversa.
c. En la técnica de correción de debugging es necesario analizar los casos límites del problema.

RTA:
a. Verdadera. Ya que todos los enteros están dentro de los reales
b. Falso. Siempre es posible reemplazar un for por un while con una variable contador (que sume (to) o reste (downto) ) pero no siempre es posible reemplazar un while por un for ya que hay ocasiones donde la condición no es númerica.
c. NO SÉ

}



{4. Dado un vector de valores enteros (con dimensión física de 100), implementar un módulo que reciba dicho vector y devuelva otro vector que contenga solamente aquellos valores que se encuentren en posiciones impares del vector recibido.
Declare todos los tipos de datos necesarios.

RTA:}
type
  vectorDado = array[1..100] of integer;
  vectorCrear = array[0..49] of integer;
procedure imparesVector(vd: vectorDado; dimLvd: integer; var vc: vectorCrear;var dimLvc);
var
  i : integer;
begin
  for i := 1 to dimL do begin
    if(i mod 2 = 1) then begin
      vc[i-1] := vd[i];
      dimLvc := dimLvc + 1;
    end;
  end;
end;

{5. Teniendo en cuenta la siguiente tabla, calcule e indique la cantidad de memoria estática y dinámica que utiliza el siguiente programa y su tiempo de ejecución.}

{REFERENCIAS
Char = 1byte;
Integer = 6bytes;
Real = 8bytes;
Boolean = 1byte;
String = longitud + 1byte;
Puntero = 4bytes
}

program ejercicio5;
type
  cadena25 = string[25];
  empleado = record
    dirCorreo: cadena25; edad: integer; sueldo: real;
  end;
  vector = array[1..100] of empleado;
  datos = ^vector;
var
  v: vector; d: datos; e: empleado; i: integer; suma: real;
begin
  New(d);
  for i := 1 to 100 do begin
    read(e.dirCorreo,e.edad,e.sueldo);
    d^.[i] := e;
  end;
  d^.[4].sueldo := d^.[4].sueldo + 1000;
end;
{RTA
memoria estatica:
v = 100 * (26+6+8) bytes
d = 4 bytes
e = 40 bytes
i = 6 bytes
suma = 8 bytes
total = 100 * (26+6+8) + 4 + 40 + 6 + 8 = 4058 bytes

memoria dinamica:
new(d) = +4000bytes
total = 4000bytes
}