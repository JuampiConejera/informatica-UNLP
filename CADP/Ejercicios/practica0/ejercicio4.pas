(*
4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro).
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula (PI * R^2)
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula (D*PI) (o también PI*R*2).

Solución:        *)
program practica0ejercicio4;
var
    diametro, radio, area, perimetro: Real;
begin
  WriteLn('Escribí el diámetro del círculo:  ');
  ReadLn(diametro);
  radio := diametro/2;
  area := PI * (radio * radio);
  perimetro := PI*diametro;
  WriteLn('a.: ', radio:1:2);
  WriteLn('b.: ', area:1:2);
  WriteLn('c.: ', perimetro:1:2);


end.