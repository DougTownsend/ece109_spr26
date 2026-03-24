            .orig x3000
loop        getc
            putc
            and r1, r0, #1
            getc
            putc
            and r2, r0, #1
            not r1, r1
            not r2, r2
            and r3, r1, r2
            not r3, r3
            brnzp loop            
            .end