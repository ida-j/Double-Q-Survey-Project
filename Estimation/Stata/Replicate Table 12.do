clear 
set more off

use "~/Dropbox/Double Q Survey Replication/Data/Stata/panel MSA.dta"

tsset id wave


xtabond2 pi l.pi l.pi_exp_1m if wave >=8, svmat noleveleq noconstant gmm(pi pi_exp_1m, lag(2 3)) twostep
eststo reg1




xtabond2 pi l.pi l.pi_exp_1m l.bubble_1m l.crash_1m l.bstar_1m l.cstar_1m if wave >=8, svmat noleveleq noconstant gmm(pi pi_exp_1m bubble_1m crash_1m bstar_1m cstar_1m, lag(2 3)) twostep
eststo reg2


xtabond2 pi l.pi  l.bubble_1m l.crash_1m l.bstar_1m l.cstar_1m if wave >=8, svmat noleveleq noconstant gmm(pi bubble_1m crash_1m bstar_1m cstar_1m, lag(2 3)) twostep
eststo reg3

******* 3m **************************

xtabond2 pi l.pi l.pi_exp_3m if wave >=8, svmat noleveleq noconstant gmm(pi pi_exp_3m, lag(2 3)) twostep
eststo reg4


xtabond2 pi l.pi l.pi_exp_3m l.bubble_3m l.crash_3m l.bstar_3m l.cstar_3m if wave >=8, svmat noleveleq noconstant gmm(pi pi_exp_3m bubble_3m crash_3m bstar_3m cstar_3m, lag(2 3)) twostep
eststo reg5



xtabond2 pi l.pi l.bubble_3m l.crash_3m l.bstar_3m l.cstar_3m if wave >=8, svmat noleveleq noconstant gmm(pi bubble_3m crash_3m bstar_3m cstar_3m, lag(2 3)) twostep
eststo reg6

******* 1y **************************

xtabond2 pi l.pi l.pi_exp_1y if wave >=8, svmat noleveleq noconstant gmm(pi pi_exp_1y, lag(2 3)) twostep
eststo reg7



xtabond2 pi l.pi l.pi_exp_1y l.bubble_1y l.crash_1y l.bstar_1y l.cstar_1y if wave >=8, svmat noleveleq noconstant gmm(pi pi_exp_1y bubble_1y crash_1y bstar_1y cstar_1y, lag(2 3)) twostep
eststo reg8

xtabond2 pi l.pi  l.bubble_1y l.crash_1y l.bstar_1y l.cstar_1y if wave >=8, svmat noleveleq noconstant gmm(pi  bubble_1y crash_1y bstar_1y cstar_1y, lag(2 3)) twostep
eststo reg9

cd "~/Dropbox/Double Q Survey Replication/tex/"


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 using MSA_est.tex,  se star(* 0.10 ** 0.05 *** 0.01)  booktabs  ///
scalars("N_g N" "g_avg T"  "j no.instruments" ) noconstant ///
coeflabels(j "N" L.pi "\$\pi_{st}$" L.pi_exp_3m "\$\pi^e_{s,t+3|t}$" L.bubble_3m "\$B_{s,t+3|t}$" L.crash_3m "\$C_{s,t+3|t}$" L.bstar_3m "\$B^*_{s,t+3|t}$" L.cstar_3m "\$C^*_{s,t+3|t}$"   L.pi_exp_1m "\$\pi^e_{s,t+1|t}$" L.bubble_1m "\$B_{s,t+1|t}$" L.crash_1m "\$C_{s,t+1|t}$" L.bstar_1m "\$B^*_{s,t+1|t}$" L.cstar_1m "\$C^*_{s,t+1|t}$"   L.pi_exp_1y "\$\pi^e_{s,t+12|t}$" L.bubble_1y "\$B_{s,t+12|t}$" L.crash_1y "\$C_{s,t+12|t}$" L.bstar_1y "\$B^*_{s,t+12|t}$" L.cstar_1y "\$C^*_{s,t+12|t}$"    ) ///
replace substitute(\_ _)  numbers  label starlevels( * 0.10 ** 0.05 *** 0.010) ///
title("Estimates for 48 MSAs \\ {\bf  Dependent variable: \$\pi_{s,t+1}$} (in percent per quarter)") 
 
 
