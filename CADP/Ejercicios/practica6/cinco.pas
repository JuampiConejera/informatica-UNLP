program cinco;
type
    producto = record
        codigo : integer;
        descripcion : string[15];
        stockActual : integer;
        stockMinimo : integer;
        precio : real;
    end;
    lista = ^nodo;
    nodo = record
        dato : producto;
        sig : lista;
    end;
procedure armarLista(var l : lista; p : producto);
var
    aux : lista;
begin
    new(aux);
    aux^.dato := p;
    aux^.sig := l;
    l := aux;
end;
procedure leerProducto(var p : producto);
begin
    Write('codigo: ');ReadLn(p.codigo);
    if(p.codigo <> -1) then begin
        Write('codigo: ');ReadLn(p.codigo);
        Write('descripcion: ');ReadLn(p.descripcion);
        Write('stock Actual: ');ReadLn(p.stockActual);
        Write('stock Minimo: ');ReadLn(p.stockMinimo);
        Write('precio: ');ReadLn(p.precio);
    end;
end;
procedure cargarProducto(var l : lista);
var
    p : producto;
begin
    leerProducto(p);
    while(p.codigo <> -1) do begin
        armarLista(l,p);
        leerProducto(p);
    end;
end;
function calcularPorcentaje(a, b : integer) : real;
begin
    calcularPorcentaje := a / b * 100;
end;
function descomponerCodigo(cod : integer) : Boolean;
var
    contadorDigitos, aux : integer;
begin
    contadorDigitos := 0;
    aux := cod;
    while(cod <> 0) do begin
        if(aux mod 2 = 0) then
            contadorDigitos := contadorDigitos + 1;
        aux := aux div 10;
    end;
    descomponerCodigo := contadorDigitos >= 3;
end;
procedure procesarLista(l : lista; var porcentaje : real;var codUno : integer; var codDos : integer);
var
    contadorTotal, contadorDebajo : integer;
    precioUno, precioDos : real;
begin
    precioUno := 9999; precioDos := 9999;
    contadorTotal := 0;
    contadorDebajo := 0;
    while(l <> nil) do begin
        if(l^.dato.stockActual < l^.dato.stockMinimo) then
            contadorDebajo := contadorDebajo + 1;
        if(descomponerCodigo(l^.dato.codigo)) then
            writeln('el producto ', l^.dato.descripcion,' tiene al menos tres digitos pares en su codigo.');
        if(l^.dato.precio < precioUno) then begin
            precioDos := precioUno;
            codDos := codUno;
            precioUno := l^.dato.precio;
            codUno := l^.dato.codigo;
        end;
        if(l^.dato.precio < precioDos) then begin
            precioDos := l^.dato.precio;
            codDos := l^.dato.codigo;
        end;
        contadorTotal := contadorTotal + 1;
        l := l^.sig;
    end;
    porcentaje := calcularPorcentaje(contadorDebajo,contadorTotal);
end;
var
    l : lista;
    porcentaje : real;
    codUno , codDos : integer;
begin
    l := Nil;
    //InicializoParaInformar
    codUno := 0;
    codDos := 0;
    cargarProducto(l);
    procesarLista(l,porcentaje,codUno,codDos);
end.
{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informa
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}