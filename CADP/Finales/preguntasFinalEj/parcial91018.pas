program parcial91018;
const
    dimF = 100;
type
    vectorDispone = array[1..dimF] of char;
    vectorNuevo = array['a'..'z'] of integer;
procedure inicializarVector(var v: vectorNuevo);
var
    i: char;
begin
  for i:= 'a' to 'z' do
    v[i] := 0;
end;
procedure cargarVectorDispone(var v: vectorDispone; var dimL: integer); //se dispone

procedure  procesarVector(vd: vectorDispone;var vn: vectorNuevo);
var
    i: integer;
begin
  for i:= 1 to dimF do begin
    vn[vd[i]] := vn[vd[i]] + 1;
  end;
end;

procedure imprimirVector(vn: vectorNuevo);
var
    i: Char;
begin
  for i := 'a' to 'z' do
    WriteLn(vn[i]);
end;

var
    dimL: integer;
    vn: vectorNuevo;
    vd: vectorDispone;
begin
    dimL := 0;
  inicializarVector(vn);
  cargarVectorDispone(vd,dimL); //se dispone
    WriteLn('pasa');
  procesarVector(vd,vn);
  imprimirVector(vn);
end.