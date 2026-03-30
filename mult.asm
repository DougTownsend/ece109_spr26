        .orig x3000

mult
        ld r1, b
        and r2, r2, #0
        ld r0, a
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
        brz mult_done
        not r2, r2
        add r2, r2, #1
mult_done
        ret
a       .fill #-5
b       .fill #10
neg_out .fill #0
        .end