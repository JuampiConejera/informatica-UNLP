org 1000h
A db 5
B db 4
C db 8
D db ?

org 2000h
mov ax, 0 
mov bx, 0 
mov cx, 0 
mov dx, 0
mov al, A
add al, B
sub al, c
mov D, al
hlt
end