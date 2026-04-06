
        .orig x3000
        lea r1 a
        lea r2 b
        jsr max
        halt
a       .fill -10
b       .fill 5

max     
        st r1 saver1
        st r2 saver2
        ldr r1, r1, #0
        ldr r2, r2, #0
        not r2 r2
        add r2 r2 #1
        add r0 r1 r2
        brzp max_a
        not r2 r2
        add r0 r2 #1
        brnzp max_done
max_a   add r0 r1 #0
max_done
        ld r1 saver1
        ld r2 saver2
        ret
saver1  .blkw 1
saver2  .blkw 1
        .end