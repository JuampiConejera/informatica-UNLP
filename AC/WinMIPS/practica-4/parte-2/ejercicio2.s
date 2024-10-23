.data
CONTROL: .word 0x10000
DATA: .word 0x10008
texto: .asciiz "Ingrese una clave de 4 caracteres:"
acierto: .asciiz "Clave correcta: acceso permitido"
error: .asciiz "Clave incorrecta."
clave: .ascii "1234"

.code
lwu $s0, CONTROL ($zero)        
lwu $s1, DATA ($zero)           
daddi $t0, $zero, 0             ; puntero para recorrer 

daddi $t9, $zero, texto         ; guardo la dir TEXTO
sd $t9, 0 ($s1)                 ; DATA recibe el puntero del comienzo del msj
daddi $t9, $zero, 4             ; numero para CONTROL (salida msj)
sd $t9, 0 ($s0)                 ; CONTROL recibe 4 y hace función

loop:
    daddi $t3, $zero, 9         ; guardo 9 para enviar a CONTROL
    sd $t3, 0 ($s0)             ; envio 9 a CONTROL
    lbu $t3, 0 ($s1)            ; cargo el caracter desde DATA

halt