.data
tabla:
    .half 1233
    .byte 6
    .half 1493
    .byte 3
    .half 1498
    .byte 7
    .half 0

.global main
.text
main:
    la s2, tabla # Cargo la tabla
    li a0, 0 # Inicio el valor donde voy a guardar la suma
    
loop:
    lh t0, 0(s2) # Cargo los primeros 2 bytes de s2 en t0
    beqz t0, halt # Halt si el half cargado es == 0
    andi t1, t0, 1 # Me fijo si es impar
    beqz t1, skip # Si es par lo salteo
    lbu t2, 2(s2) # Cargo el byte a la derecha (la nota)
    add a0, a0, t2 # Le sumo a a0 (mi acumulador) el byte cargado
    addi s2, s2, 3 # Avanzo
    j loop # Repito el bucle
    
skip:
    addi s2, s2, 3 # Avanzo
    j loop
    
halt:
    j halt
