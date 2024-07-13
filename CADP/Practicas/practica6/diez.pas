program diez;
type
    cliente = record
        dni : longint;
        numero : integer;
    end;
    lista = ^nodo;
    nodo = record
        dato : cliente;
        sig : lista;
    end;
procedure recibirCliente(var l:lista;var cli:cliente);
var
    nuevo,aux : lista;
begin
    cli.numero := cli.numero + 1;
    new(nuevo);
    nuevo^.dato.dni := cli.dni;
    nuevo^.dato.numero := cli.numero;
    nuevo^.sig := nil;
    if(l = nil) then
        l := nuevo
    else begin
        aux := l;
        while(aux^.sig <> nil) do
            aux := aux^.sig;
        aux^.sig := nuevo;
    end;
end;
procedure atenderCLiente(var l : lista);
var
    aux : lista;
begin
    aux := l;
    writeln('ATENDIENDO...');
    write('Numero de fila: ',l^.dato.numero,'  |   DNI del cliente: ',l^.dato.dni);writeln;
    l := l^.sig;
    dispose(aux);
end;
procedure imprimirLista(l : lista);
begin
  while(l <> Nil) do begin
    Write('Cliente: ',l^.dato.dni,'  |  ',l^.dato.numero);writeln;
  l := l^.sig;
  end;
end;
var
    l : lista;
    c : cliente;
begin
    c.numero := 0;
    l := nil;
    write('DNI: ');readln(c.dni);
    while(c.dni <> 0) do begin
        recibirCliente(l,c);
        write('DNI: ');readln(c.dni);
    end;
    imprimirLista(l);
    atenderCLiente(l);
    write('Quedan por atender:  ');
    imprimirLista(l);
    while(l <> nil)do begin
        writeln;
        writeln;
        atenderCLiente(l);
        write('Quedan por atender:  ');
        imprimirLista(l);
    end;
end.
{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
por su número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
debe procesarse.}