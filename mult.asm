        .orig x3000
        ld r1, b
        and r2, r2, #0
        ld r0, a
loop    brz stop    
        add r2, r2, r1
        add r0, r0, #-1
        brnzp loop
stop    halt
a       .fill #0
b       .fill #30
        .end