program ejercicio11;
const
  dimF = 200;
type
  foto = record
    titulo: string[20];
    autor: string[20];
    meGusta: integer;
    clicks: integer;
    comentarios: integer;
  end;

procedure cargarVector(var v: vector);
var
  i: integer;
begin
  for i := 1 to dimF do begin
    v[i].titulo := Chr(random(26)+65);
    v[i].autor := Chr(random(26)+65);
    v[i].meGusta := random(1000);
    v[i].clicks := random(1000);
    v[i].comentarios := random(1000);
  end;
  v[3].autor := 'Art Vandelay';
  v[54].autor := 'Art Vandelay';
  v[34].autor := 'Art Vandelay';
  v[39].autor := 'Art Vandelay';
end;

procedure procesarVector(v: vector);
var
  i,max,cantidadMG,cantidadComentarios: integer;
  tituloMax: string;
begin
  max := -1;
  cantidadMG := 0; cantidadComentarios := 0; tituloMax := '';
  for i := 1 to dimF do begin
    if(v[i].clicks > max) then begin //A
      max := v[i].clicks;
      tituloMax := v[i].titulo;
    end;
    if(v[i].titulo = 'Art Vandelay') then begin
      cantidadMG := cantidadMG + v[i].meGusta; //B
      WriteLn(v[i].comentarios);//C
    end;
  end;
  WriteLn(max, tituloMax);
  WriteLn(cantidadMG);
end;
var
  v: vector;
begin
  cargarVector(v);
  procesarVector(v);
end.
{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales.
Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez
finalizada la lectura, el programa debe procesar los datos e informar:
a. Título de la foto más vista (la que posee mayor cantidad de clics).
b. Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c. Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}