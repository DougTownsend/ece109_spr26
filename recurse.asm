        .orig x3000
        ld r6 stack
        and r1 r1 #0
        add r1 r1 #4
        jsr infinite
        halt

infinite
        add r6 r6 #-1
        str r7 r6 #0
        add r1, r1, #-1
        brz done
        lea r0 message
        puts
        jsr infinite
        ldr r7 r6, #0
        add r6 r6 #1
done    ret

message .stringz "Hello\n"
stack   .fill x4000
        .end