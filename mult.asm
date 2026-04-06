        .orig x3000
        ld r6 stack
        jsr mult
        halt
stack   .fill x4000

neg_r0  not r0, r0
        add r0, r0, #1
        ret

mult
        ;Push saved regs onto stack
        add r6 r6 #-1
        str r0 r6 #0
        add r6 r6 #-1
        str r1 r6 #0
        add r6 r6 #-1
        str r2 r6 #0
        add r6 r6 #-1
        str r7 r6 #0
        ;Start mult code
        ld r1, b
        and r2, r2, #0
        ld r0, a
        brzp loop
        not r1, r1
        add r1, r1 #1
        jsr neg_r0

loop    brz loop_end   
        add r2, r2, r1
        add r0, r0, #-1
        brnzp loop
loop_end
        st r2 prod
        ;Pop saved regs off stack
        ldr r7 r6 #0
        add r6 r6 #1
        ldr r2 r6 #0
        add r6 r6 #1
        ldr r1 r6 #0
        add r6 r6 #1
        ldr r0 r6 #0
        add r6 r6 #1
        ret

a       .fill #-5
b       .fill #10
prod    .blkw 1
        .end