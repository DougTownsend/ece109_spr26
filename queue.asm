        .orig x3000
        and r0 r0 #0
        add r0 r0 #4
        jsr q_ins
        add r0 r0 #4
        jsr q_ins
        add r0 r0 #4
        jsr q_ins
        add r0 r0 #4
        jsr q_ins
        add r0 r0 #4
        jsr q_ins
        halt

q_ins   st r0 qi_r0
        st r1 qi_r1
        st r7 qi_r7
        add r1 r0 #0
        jsr q_full
        add r0 r0 #0
        brp qi_done
        ld r0 q_rear
        jsr q_wrap
        st r0 q_rear
        str r1 r0 #0
qi_done ld r0 qi_r0
        ld r1 qi_r1
        ld r7 qi_r7
        ret
qi_r0 .blkw #1
qi_r1 .blkw #1
qi_r7 .blkw #1


;R0 = 0 if non-full, R0 = 1 if full
q_full  st r1 qf_r1
        st r7 qf_r7
        ld r0 q_rear
        jsr q_wrap
        ld r1 q_frnt
        not r1 r1
        add r1 r1 #1
        add r1 r1 R0
        brz q_is_fl
        and r0 r0 #0
        brnzp qf_done
q_is_fl and r0 r0 #0
        add r0 r0 #1
qf_done ld r7 qf_r7
        ld r1 qf_r1
        ret
qf_r1   .blkw #1
qf_r7   .blkw #1

;R0 = 0 if non-empty, R0 = 1 if empty
q_empty st r1 qe_r1
        ld r0 q_frnt
        ld r1 q_rear
        not r1 r1
        add r1 r1 #1
        add r0 r0 r1
        brz q_is_mt
        and r0 r0 #0
        brnzp qe_done
q_is_mt and r0 r0 #0
        add r0 r0 #1
qe_done ld r1 qe_r1
        ret
qe_r1   .blkw #1

;Pointer arg is R0. Ret in R0
q_wrap  st r1 qw_r1
        st r2 qw_r2
        add r0 r0 #1
        lea r1 queue
        ld r2 q_size
        add r1 r1 r2 ;r1 points to one after the end of q
        not r1 r1
        add r1 r1 #1
        add r1 r1 r0
        brnp qw_done
        lea r0 queue
qw_done ld r1 qw_r1
        ld r2 qw_r2
        ret
qw_r1   .blkw #1
qw_r2   .blkw #1


test    .fill #98
q_frnt  .fill queue
q_rear  .fill queue
q_size  .fill #5
queue   .blkw #5
        .end