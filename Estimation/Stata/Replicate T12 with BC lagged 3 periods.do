clear 
set more off

use "~/Dropbox/Double Q Survey Replication/Data/Stata/panel MSA ALT BC 3 lags.dta"

tsset id wave

eststo clear
set more off

xtabond2 pi l.pi l3.piexp if wave >=10, svmat noleveleq noconstant gmm(pi l2.piexp, lag(2 3)) twostep
eststo reg1



xtabond2 pi l.pi l3.piexp l3.bubble l3.crash l3.bstar l3.cstar if wave >=10, svmat noleveleq noconstant gmm(pi l2.piexp l2.bubble l2.crash l2.bstar l2.cstar, lag(2 3)) twostep
eststo reg2


xtabond2 pi l.pi  l3.bubble l3.crash l3.bstar l3.cstar if wave >=10, svmat noleveleq noconstant gmm(pi l2.bubble l2.crash l2.bstar l2.cstar, lag(2 3)) twostep
eststo reg3




xtabond2 pi l.pi l3.piexp l3.bc l3.bcstar if wave >=10, svmat noleveleq noconstant gmm(pi l2.piexp l2.bc l2.bcstar, lag(2 3)) twostep
eststo reg4


xtabond2 pi l.pi  l3.bc l3.bcstar if wave >=10, svmat noleveleq noconstant gmm(pi  l2.bc l2.bcstar, lag(2 3)) twostep
eststo reg5


esttab reg1 reg2 reg3 reg4 reg5



cd "/Users/manguito/Downloads/"


esttab reg1 reg2 reg3 reg4 reg5 using MSA_est_ALT.tex,  se star(* 0.10 ** 0.05 *** 0.01)  booktabs  ///
replace substitute(\_ _)  numbers  label starlevels( * 0.10 ** 0.05 *** 0.010)
 
 
 eststo clear
set more off

xtabond2 pi l.pi l.piexp if wave >=10 & wave<=16, svmat noleveleq noconstant gmm(pi piexp, lag(2 3)) twostep
eststo reg1



xtabond2 pi l.pi l.piexp l3.bubble l3.crash l3.bstar l3.cstar if wave >=10 & wave<=16, svmat noleveleq noconstant gmm(pi piexp l2.bubble l2.crash l2.bstar l2.cstar, lag(2 3)) twostep
eststo reg2


xtabond2 pi l.pi  l3.bubble l3.crash l3.bstar l3.cstar if wave >=10 & wave<=16, svmat noleveleq noconstant gmm(pi l2.bubble l2.crash l2.bstar l2.cstar, lag(2 3)) twostep
eststo reg3




xtabond2 pi l.pi l.piexp l3.bc l3.bcstar if wave >=10 & wave<=16, svmat noleveleq noconstant gmm(pi piexp l2.bc l2.bcstar, lag(2 3)) twostep
eststo reg4


xtabond2 pi l.pi  l3.bc l3.bcstar if wave >=10 & wave<=16, svmat noleveleq noconstant gmm(pi  l2.bc l2.bcstar, lag(2 3)) twostep
eststo reg5


esttab reg1 reg2 reg3 reg4 reg5



cd "/Users/manguito/Downloads/"


esttab reg1 reg2 reg3 reg4 reg5 using MSA_est_ALT.tex,  se star(* 0.10 ** 0.05 *** 0.01)  booktabs  ///
replace substitute(\_ _)  numbers  label starlevels( * 0.10 ** 0.05 *** 0.010)
 
 
