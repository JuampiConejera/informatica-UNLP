program ejercicio2;
type
  dia = 1..31;
  mes = 1..12;
  rangoFecha = record
    dia: rangoDias;
    mes: rangoMeses;
    anio: integer;
  end;
  venta = record
    codigo: integer;
    fecha: rangoFecha;
    cant: integer;
  end;  
  arbol = ^nodo;
  nodo = record
    dato: venta;
    HI: arbol;
    HD: arbol;
  end;

procedure leerVentas(var v: venta);
begin
  v.codigo := random(100);
  v.fecha.dia := random(31);
  v.fecha.dia := random(31);
  v.fecha.dia := random(31);
  v.cant := random(100);
end;



{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
}