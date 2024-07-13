program trece;
const
    totalUsuarios = 3600;
type
    roles = 1..4;
    usuario = record
        nombreUsuario : string[15];
        email : string [30];
        rol : roles;
        revista : string[10];
        ultimoAcceso : integer;
    end;
    lista = ^nodo;
    nodo = record
        dato : usuario;
        sig : lista;
    end;
    vector = array[1..totalUsuarios] of usuario;
    vectorRol = array[1..4] of integer;
//procedure cargarVector(var v:vector);
procedure insertarOrdenado(var l : lista;  v : usuario);
var
    actual, anterior, nuevo : lista;
begin
    new(nuevo);
    nuevo^.dato := v;
    actual := l;
    anterior := l;
    while(actual <> nil) and (actual^.dato.ultimoAcceso < v.ultimoAcceso) do begin
        anterior := actual;
        actual := actual^.sig;
    end;
    if(actual = anterior) then
        l := nuevo
    else
        anterior^.sig := nuevo;
    nuevo^.sig := actual;
end;
procedure imprimirLista(l : lista);
begin
    while(l <> Nil) do begin
        WriteLn('el ultimo acceso del usuario: ',l^.dato.nombreUsuario, ' fue hace ', l^.dato.ultimoAcceso, ' días.');
        l := l^.sig;
    end;
end;
procedure inicializarVector(var v: vectorRol);
var
    i : integer;
begin
    for i := 1 to 4 do
        v[i] := 0;
end;
procedure procesarVector(var l : lista; v : vector);
var
    i, j, maxUno, maxDos : integer;
    emailUno, emailDos : string;
    vr : vectorRol;
begin
    emailUno := '';
    emailDos := '';
    maxUno := -1;
    maxDos := -1;
    inicializarVector(vr);
    for i := 1 to totalUsuarios do begin
        if(v[i].revista = 'economica') then
            insertarOrdenado(l,v[i]);
        vr[v[i].rol] := vr[v[i].rol] + 1;
        if(v[i].ultimoAcceso > maxDos) then begin
            maxDos := v[i].ultimoAcceso;
            emailDos := v[i].email;
        end;
        if(v[i].ultimoAcceso > maxUno) then begin
            maxDos := maxUno;
            emailDos := emailUno;
            maxUno := v[i].ultimoAcceso;
            emailUno := v[i].email;
        end;
    end;
    for j := 1 to 4 do //punto B.
        WriteLn('hay ',vr[j],' usuarios del rol: ', j);
    writeln('El email ', emailUno, ' hace ', maxUno, ' dias que no se conecta.'); //C
    writeln('El email ', emailDos, ' hace ', maxDos, ' dias que no se conecta.'); //C
end;
var
    l : lista;
    v : vector;
begin
    l := nil;
    //cargarVector(v);
    //cargar vectores para ver los resultados
    v[1].nombreUsuario := 'hola';
    v[1].email := '@gmail';
    v[1].rol := 1;
    v[1].revista := 'economica';
    v[1].ultimoAcceso := 100;

    v[2].nombreUsuario := 'chau';
    v[2].email := '@hotmail';
    v[2].rol := 4;
    v[2].revista := 'economica';
    v[2].ultimoAcceso := 200;
    procesarVector(l,v);
    imprimirLista(l); //punto A.
end.
{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte
de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De
cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que
participa y cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios
de la revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último
acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
}