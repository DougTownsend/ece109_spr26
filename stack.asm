        .orig x3000
        lea r6, stack
        halt

push    add r6 r6 #-1
        str r0 r6 #0
        ret

pop     ldr r0 r6 #0
        add r6 r6 #1
        ret

stack   .blkw 1
        .end