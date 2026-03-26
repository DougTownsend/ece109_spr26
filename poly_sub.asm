        .orig x3000
        ld r0, a
        ld r1, x
        jsr mult
        add r1, r2, #0
        ld r0, x
        jsr mult
        st r2, a_x_x
        ld r0, b
        ld r1, x
        jsr mult
        st r2, b_x
        ld r1, a_x_x
        add r1, r1, r2
        ld r0, c
        add r0, r0, r1
        st r0, f_x
        halt
        
mult    and r2, r2, #0
        add r0, r0, #0
        brzp loop
        add r2, r2, #1
        st r2, neg_out
        add r2, r2, #-1
        not r0, r0
        add r0, r0, #1 ;-a is in r0
loop    brz loop_end   
        add r2, r2, r1
        add r0, r0, #-1
        brnzp loop
loop_end
        ld r0, neg_out
        brz stop
        not r2, r2
        add r2, r2, #1
stop    ret
neg_out .fill #0
a       .fill #3
b       .fill #5
c       .fill #2
x       .fill #3
a_x_x   .fill #0
b_x     .fill #0
f_x     .fill #0
        .end