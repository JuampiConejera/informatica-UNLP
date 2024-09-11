program ejercicio3;
type
    rangoRubro = 1..10;
    producto = record
        codigo: integer;
        rubro: rangoRubro;
        stock: integer;
        precio: real;
    end;

    datoArbol = record
        codigo: integer;
        stock: integer;
        precio: real;
    end;

    arbol = ^nodo;
    nodo = record
        dato: datoArbol;
        HI: arbol;
        HD: arbol;
    end;
    vector = array[rangoRubro] of arbol;
    infoMaximo = record
        codigo: integer;
        stock: integer;
    end;
    vectorMaximo = array[rangoRubro] of infoMaximo;
    vectorContador = array[rangoRubro] of integer;

procedure inicializarVector(var v: vector);
var
    i: integer;
begin
    for i := 1 to 10 do
        v[i] := Nil;
end;

procedure leerProducto(var p: producto);
begin
    write('codigo ');p.codigo := random(100);//readln(p.codigo);
    write('rubro ');p.rubro := random(10)+1;//readln(p.rubro);
    write('stock ');p.stock := random(5);//readln(p.stock);
    write('precio ');p.precio := random(100);//readln(p.precio);
end;

procedure agregarNodo(var a: arbol;p: producto);
begin
    if(a = Nil) then begin
        new(a);
        a^.dato.codigo := p.codigo;
        a^.dato.stock := p.stock;
        a^.dato.precio := p.precio;
        a^.HI := nil;
        a^.HD := nil;
    end
    else begin
        if(p.codigo < a^.dato.codigo) then
            agregarNodo(a^.HI,p)
        else
            agregarNodo(a^.HD,p);
    end;
end;

procedure cargarVector(var v: vector);
var
    p: producto;
begin
    leerProducto(p);
    while(p.codigo <> 0) do begin
        agregarNodo(v[p.rubro],p);
        leerProducto(p);
    end;
end;

function moduloB(v: vector;rubro: rangoRubro; codigo: integer) : Boolean;
    procedure buscarProducto(a: arbol;codigo: integer;var ok: boolean);
    begin
        if(a <> Nil) then
            if(a^.dato.codigo = codigo) then
                ok := true
            else begin
                    if(codigo < a^.dato.codigo) then
                        buscarProducto(a^.HI,codigo,ok)
                    else
                        buscarProducto(a^.HD,codigo,ok);
            end;
    end;
var
    ok: Boolean;
begin
    ok := false;
    buscarProducto(v[rubro],codigo,ok);
    moduloB := ok;
end;


procedure moduloC(v: vector;var vm: vectorMaximo);
    procedure calcularMaximo(a: arbol; var maximo: infoMaximo);
    begin
        if(a <> Nil) then begin
            if(a^.HD <> Nil) then
                calcularMaximo(a^.HD,maximo)
            else begin
                maximo.codigo := a^.dato.codigo;
                maximo.stock := a^.dato.stock;
            end;
        end
        else
            WriteLn('El arbol esta vacio');
    end;
var
    maximo: infoMaximo;
    i: integer;
begin
    for i := 1 to 10 do begin
        calcularMaximo(v[i],maximo);
        vm[i] := maximo;
    end;
end;

procedure inicializarVectorContador(var v: vectorContador);
var i : integer;
begin
    for i := 1 to 10 do
        v[i] := 0;
end;

procedure moduloD(v: vector;minimo,maximo: integer;var vc: vectorContador);
    function contador(a: arbol;minimo,maximo: integer) : integer;
    begin
        if(a = Nil) then
            contador := 0
        else begin
            if(a^.dato.codigo < minimo) then begin
                if(a^.dato.codigo > maximo) then begin
                    contador := 1 + contador(a^.HI,minimo,maximo) + contador(a^.HD,minimo,maximo);
                end
                else
                    contador(a^.HD,minimo,maximo);
            end
            else
                contador(a^.HD,minimo,maximo);
        end;
    end;
var
    i: integer;
begin
    inicializarVectorContador(vc);
    for i := 1 to 10 do
        vc[i] := contador(v[i],minimo,maximo);
end;

var
    v: vector;
    rubro: rangoRubro;
    codigo,minimo,maximo: integer;
    vm: vectorMaximo;
    vc: vectorContador;
begin
    inicializarVector(v);
    cargarVector(v);
    writeln;
    WriteLn('rubro a buscar');ReadLn(rubro);
    WriteLn('codigo a buscar en el rubro ',rubro);ReadLn(codigo);
    WriteLn(moduloB(v,rubro,codigo));
    moduloC(v,vm);
    writeln('minimo: ');ReadLn(minimo);writeln('maximo: ');ReadLn(maximo);
    moduloD(v,minimo,maximo,vc);
end.
{3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
}