        .orig x3000
        ld r0, number
        and r1, r1, #0
        add r1, r1, #1
        and r2, r2, #0
loop    and r3, r0, r1
        brz shift
        add r2, r2, #1
shift   add r1, r1, r1
        brnp loop
        halt
number  .fill x330f
        .end
