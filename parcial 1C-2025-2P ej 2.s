.data
aportantes: 
    .byte 66, 43    # Aportante 1 (Edad > 65)
    .half 5000      #   -> SUMAR (5000)
    
    .byte 32, 4     # Aportante 2 (Edad < 65)
    .half -500      #   -> IGNORAR
    
    .byte 70, 40    # Aportante 3 (Edad > 65)
    .half -1000     #   -> SUMAR (-1000)
    
    .byte 25, 5     # Aportante 4 (Edad < 65)
    .half 200       #   -> IGNORAR
    
    .byte 65, 30    # Aportante 5 (Edad == 65)
    .half 3000      #   -> SUMAR (3000)
    
    .byte 81, 50    # Aportante 6 (Edad > 65)
    .half 0         #   -> SUMAR (0)
    
    .byte 40, 15    # Aportante 7 (Edad < 65)
    .half 9000      #   -> IGNORAR
    
largo: 
    .byte 7 # ¡Importante! El largo ahora es 7

.global main
.text

main:
    li t0, 65 # Cargo el 65 en t0
    li t1, 0 # Es mi contador de iteraciones
    la s0, aportantes # Cargo la direccion de la tabla en s0
    lb s1, largo # Le asigno a s1 el largo de la tabla
    li a0, 0 # Suma de los aportes
    li a1, 0 # Cantidad de aportantes
    j loop
    
loop:
    beq t1, s1, calcular # Si ya termine mis iteraciones, realizo el calculo final
    lb t2, 0(s0) # Cargo la edad de la persona actual
    blt t2, t0, skip # Si t1 >= 65 (t0)
    lh t3, 2(s0) # Cargo el aporte de esta persona
    add a0, a0, t3 # Sumo el aporte a los aportes totales
    addi a1, a1, 1 # Sumo 1 a la cantidad de aportantes
    addi s0, s0, 4 # Avanzo a la siguiente persona
    addi t1, t1, 1 # Le sumo 1 a mis iteraciones
    j loop
    
skip:
    addi s0, s0, 4 # Avanzo ya que no me sirve esta persona
    addi t1, t1, 1 # Le sumo 1 a mis iteraciones
    j loop

calcular:
    beq a1, zero, halt # Para evitar dividir por 0
    div a2, a0, a1 # Calculo el promedio de aportes
    j halt
    
halt:
    j halt
