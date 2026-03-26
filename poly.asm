        .orig x3000
        and r2, r2, #0
        ld r1, a
        ld r0, x
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
stop    
        add r1, r2, #0
        and r2, r2, #0
        ld r0, x

        brzp loop1
        add r2, r2, #1
        st r2, neg_out
        add r2, r2, #-1
        not r0, r0
        add r0, r0, #1 ;-a is in r0
loop1   brz loop_end1  
        add r2, r2, r1
        add r0, r0, #-1
        brnzp loop1
loop_end1
        ld r0, neg_out
        brz stop1
        not r2, r2
        add r2, r2, #1
stop1   st r2, a_x_x

        and r2, r2, #0
        ld r1, b
        ld r0, x

        brzp loop2
        add r2, r2, #1
        st r2, neg_out
        add r2, r2, #-1
        not r0, r0
        add r0, r0, #1 ;-a is in r0
loop2   brz loop_end2 
        add r2, r2, r1
        add r0, r0, #-1
        brnzp loop2
loop_end2
        ld r0, neg_out
        brz stop2
        not r2, r2
        add r2, r2, #1
stop2   st r2, b_x
        ld r1, a_x_x
        add r1, r1, r2 ;r2 = a*x*x + b*x
        ld r0, c
        add r0, r0, r1 ; r0 = f(x)
        st r0, f_x

        halt
neg_out .fill #0
a       .fill #3
b       .fill #5
c       .fill #2
x       .fill #3
a_x_x   .fill #0
b_x     .fill #0
f_x     .fill #0
        .end