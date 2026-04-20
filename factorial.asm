        .orig x3000
        ld r6 stack
        and r0 r0 #0
        add r0 r0 #2
        jsr fact
        halt

fact    add r6, r6 #-1
        str r7 r6 #0
        add r1 r0 #0
        add r0 r0 #-1
        brz fact_done
        jsr fact
fact_done
        jsr mult
        add r0 r2 #0
        ldr r7 r6 #0
        add r6 r6 #0
        ret

mult
        ;Push saved regs onto stack
        add r6 r6 #-1
        str r0 r6 #0
        add r6 r6 #-1
        str r1 r6 #0
        add r6 r6 #-1
        str r7 r6 #0
        ;Start mult code
        and r2, r2, #0
        brzp loop
        not r1, r1
        add r1, r1 #1
        not r0, r0
        add r0, r0, #1

loop    brz loop_end   
        add r2, r2, r1
        add r0, r0, #-1
        brnzp loop
loop_end
        ;Pop saved regs off stack
        ldr r7 r6 #0
        add r6 r6 #1
        ldr r1 r6 #0
        add r6 r6 #1
        ldr r0 r6 #0
        add r6 r6 #1
        ret

a       .fill #-5
b       .fill #10
prod    .blkw 1
stack   .fill x4000
        .end