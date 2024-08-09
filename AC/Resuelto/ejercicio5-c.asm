A equ 5
B equ 4
C equ 7

org 1000h
D dw ?

org 3000h
calculo: mov ax, A
         add ax, B
         sub ax, c
         mov D, ax
         ret
org 2000h
mov ax, 0
mov bx, 0
mov cx, 0
mov dx, 0
call calculo
hlt
end