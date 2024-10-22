4. Registros del MIPS64 ⭐.
El procesador MIPS64 posee 32 registros, de 64 bits cada uno, llamados r0 a r31 (también conocidos como $0 a $31).
Sin embargo, al programar resulta más conveniente darles nombres más significativos a esos registros.
La siguiente tabla muestra la convención empleada para nombrar a los 32 registros mencionados:
Registros       |Nombres        |¿Para que se los utiliza?                  |¿Preservado?
r0              |$zero          |Siempre tiene el valor 0, no cambia        |
r1              |$at            |Assembler Temporary -Reservado ensamblador |
r2-r3           |$v0-$v1        |Valores retorno subrutina                  |
r4-r7           |$a0-$a3        |Argumentos pasados a la subrutina llamada  |
r8-r15          |$t0-$t7        |Registros temporarios                      |
r16-r23         |$s0-$s7        |Registros que deben ser salvados           |   X
r24-r25         |$t8-$t9        |Registros temporarios                      |
r26-r27         |$k0-$k1        |para uso del Kernel del sistema            |
r28             |$gp            |Global Pointer                             |   X
r29             |$sp            |Stack Pointer                              |   X
r30             |$fp            |Frame Pointer                              |   X
r31             |$ra            |Return Address. debe ser salvado           |   X
-------------------------------------------------------------------------------------------------------------
Complete la tabla anterior explicando el uso que normalmente se le da a cada uno de los registros nombrados.
Marque en la columna “¿Preservado?” si el valor de cada grupo de registros debe ser preservado luego de realizada
una llamada a una subrutina. Puede encontrar información útil en el apunte “Programando sobre MIPS64”