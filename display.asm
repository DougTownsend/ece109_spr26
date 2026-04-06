        .Orig x3000
        ld r0 origin
        ld r2 red
        ld r1 pix_count
loop    brnz done
        str r2 r0 #0
        add r0 r0 #1
        add r1 r1 #-1
        brnzp loop
done    halt


origin .fill xc000
pix_count .fill #15872
red .fill x7c00
; 0 rrr rr gg ggg b bbbb
.end
