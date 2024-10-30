.data
CONTROL: .word 0x10000
DATA: .word 0x10008
texto: .asciiz "Ingrese una clave de 4 caracteres:"
acierto: .asciiz "Clave correcta: acceso permitido"
error: .asciiz "Clave incorrecta."
clave: .asciiz "ABCD"
leido: .asciiz ""

.code
ld $s0, CONTROL ($zero)        
ld $s1, DATA ($zero)           

daddi $t9, $zero, texto         ; guardo la dir TEXTO
sd $t9, 0 ($s1)                 ; DATA recibe el puntero del comienzo del msj
daddi $t9, $zero, 4             ; numero para CONTROL (salida msj)
sd $t9, 0 ($s0)                 ; CONTROL recibe 4 y hace función

daddi $t1, $zero, 9 
daddi $t7, $zero, 4             ;contador (-1)
daddi $t4, $zero, 0             ;PUNTERO PARA CARGAR
carga: sd $t1, 0 ($s0)                 ;pido un char

ld $t3, 0 ($s1)                 
sb $t3, leido ($t4)             ;guardo el char

daddi $t4, $t4, 1
daddi $t7, $t7, -1
bnez $t7, carga

ld $t0, clave ($zero)
ld $t1, leido ($zero)

beq $t0, $t1, correcto          ;clave = leido CORRECTO

ld $t5, error ($zero)
sd $t5, 0 ($s1)
j fin

correcto: ld $t5, acierto ($zero)
sd $t5, 0 ($s1)

fin: sd $t9, 0 ($s0)

daddi $t1, $zero, 7
sd $t1, 0 ($s0)
halt