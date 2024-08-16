A equ 5
B equ 4
C equ 7

org 1000h
D db ?

org 3000h
calculo: mov al, A
         add al, B
         sub al, c
         mov D, al
         ret
org 2000h
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0
call calculo
hlt
end