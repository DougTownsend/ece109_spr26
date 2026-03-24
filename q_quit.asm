            .orig x3000
            ld r3 char_q
            not r2 r3
            add r2, r2, #1
loop        lea r0 prompt
            puts
            getc
            add r4, r0, #0
            out
            lea r0 newline
            puts
            add r1, r2, r4
            brnp loop            
            halt
char_q      .stringz "q"
prompt      .stringz "Enter a character: "
newline     .stringz "\n"
            .end
