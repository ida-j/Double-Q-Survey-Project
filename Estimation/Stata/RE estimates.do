clear
set more off
use "~/Dropbox/Double Q Survey Replication/Data/Stata/panel_fef_loc.dta"

run "~/Dropbox/Double Q Survey Replication/Estimation/Stata/extra/label variables.do"

cd "~/Dropbox/Double Q Survey Replication/tex/"
tsset id t
tabulate msa, gen(dmsa)

************************* RE with and without TE **********************

set more off

capture log close
log using "re without x", replace

******************************* EQUITY *******************************
eststo clear

* 1m
xtreg pi_e_1m_e  female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est1
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1m_e  female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est2
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1m_e  female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est3
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1m_e  female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est4
estadd local time "Yes"
estadd local MSA "Yes"

* 3m
xtreg pi_e_3m_e female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est5
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_3m_e  female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est6
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_3m_e  female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est7
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_3m_e  female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est8
estadd local time "Yes"
estadd local MSA "Yes"

* 1y
xtreg pi_e_1y_e  female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est9
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1y_e  female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est10
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1y_e  female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est11
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1y_e  female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est12
estadd local time "Yes"
estadd local MSA "Yes"

esttab est1 est2 est3 est4 est5  est6 est7 est8 est9 est10 est11 est12 using re_e_no_x.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("RE GLS estimates with standard errors clustered at individual level." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Equity Prices: Random Effect Estimates") stats(N time MSA, labels("Observations" "Time Dummies" "MSA Dummies")) drop(_cons _It* dmsa*) 

set more off

******************************* GOLD *******************************
eststo clear

* 1m
xtreg pi_e_1m_g   female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est1
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1m_g   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est2
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1m_g   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est3
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1m_g   female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est4
estadd local time "Yes"
estadd local MSA "Yes"

* 3m
xtreg pi_e_3m_g   female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est5
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_3m_g   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est6
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_3m_g   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est7
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_3m_g   female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est8
estadd local time "Yes"
estadd local MSA "Yes"

* 1y
xtreg pi_e_1y_g   female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est9
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1y_g   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est10
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1y_g   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est11
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1y_g   female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est12
estadd local time "Yes"
estadd local MSA "Yes"

esttab est1 est2 est3 est4 est5  est6 est7 est8 est9 est10 est11 est12 using re_g_no_x.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("RE GLS estimates with standard errors clustered at individual level." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Gold Prices: Random Effect Estimates") stats(N time MSA, labels("Observations" "Time Dummies" "MSA Dummies")) drop(_cons _It* dmsa*) 


set more off

******************************* HOUSING *******************************
eststo clear

* 1m
xtreg pi_e_1m_h    female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est1
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1m_h    female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est2
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1m_h    female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est3
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1m_h    female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est4
estadd local time "Yes"
estadd local MSA "Yes"

* 3m
xtreg pi_e_3m_h    female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est5
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_3m_h    female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est6
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_3m_h    female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est7
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_3m_h    female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est8
estadd local time "Yes"
estadd local MSA "Yes"

* 1y
xtreg pi_e_1y_h    female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est9
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1y_h    female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est10
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1y_h    female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est11
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1y_h    female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est12
estadd local time "Yes"
estadd local MSA "Yes"

esttab est1 est2 est3 est4 est5  est6 est7 est8 est9 est10 est11 est12 using re_h_no_x.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("RE GLS estimates with standard errors clustered at individual level." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("House Prices: Random Effect Estimates") stats(N time MSA, labels("Observations" "Time Dummies" "MSA Dummies")) drop(_cons _It* dmsa*) 


set more off

capture log close
log using "re with x", replace

******************************* EQUITY *******************************
eststo clear

* 1m
xtreg pi_e_1m_e v_e female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est1
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1m_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est2
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1m_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est3
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1m_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est4
estadd local time "Yes"
estadd local MSA "Yes"

* 3m
xtreg pi_e_3m_e  v_e female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est5
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_3m_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est6
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_3m_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est7
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_3m_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est8
estadd local time "Yes"
estadd local MSA "Yes"

* 1y
xtreg pi_e_1y_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est9
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1y_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est10
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1y_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est11
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1y_e  v_e  female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est12
estadd local time "Yes"
estadd local MSA "Yes"

esttab est1 est2 est3 est4 est5  est6 est7 est8 est9 est10 est11 est12 using re_e.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("RE GLS estimates with standard errors clustered at individual level." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Equity Prices: Random Effect Estimates") stats(N time MSA, labels("Observations" "Time Dummies" "MSA Dummies")) drop(_cons _It* dmsa*) 

set more off

******************************* GOLD *******************************
eststo clear

* 1m
xtreg pi_e_1m_g  v_g   female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est1
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1m_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est2
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1m_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est3
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1m_g  v_g    female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est4
estadd local time "Yes"
estadd local MSA "Yes"

* 3m
xtreg pi_e_3m_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est5
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_3m_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est6
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_3m_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est7
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_3m_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est8
estadd local time "Yes"
estadd local MSA "Yes"

* 1y
xtreg pi_e_1y_g  v_g    female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est9
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1y_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est10
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1y_g   v_g   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est11
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1y_g  v_g    female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est12
estadd local time "Yes"
estadd local MSA "Yes"

esttab est1 est2 est3 est4 est5  est6 est7 est8 est9 est10 est11 est12 using re_g.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("RE GLS estimates with standard errors clustered at individual level." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Gold Prices: Random Effect Estimates") stats(N time MSA, labels("Observations" "Time Dummies" "MSA Dummies")) drop(_cons _It* dmsa*) 


set more off

******************************* HOUSING *******************************
eststo clear

* 1m
xtreg pi_e_1m_h  v_h  female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est1
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1m_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est2
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1m_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est3
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1m_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est4
estadd local time "Yes"
estadd local MSA "Yes"

* 3m
xtreg pi_e_3m_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est5
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_3m_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est6
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_3m_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est7
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_3m_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est8
estadd local time "Yes"
estadd local MSA "Yes"

* 1y
xtreg pi_e_1y_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino, re cluster(id)
eststo est9
estadd local time "No"
estadd local MSA "No"

xi: xtreg pi_e_1y_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino   i.t, re cluster(id)
eststo est10
estadd local time "Yes"
estadd local MSA "No"

xtreg pi_e_1y_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino   dmsa*, re cluster(id)
eststo est11
estadd local time "No"
estadd local MSA "Yes"

xi: xtreg pi_e_1y_h   v_h   female av_age av_ed av_inc  asian black hispaniclatino    dmsa* i.t, re cluster(id)
eststo est12
estadd local time "Yes"
estadd local MSA "Yes"

esttab est1 est2 est3 est4 est5  est6 est7 est8 est9 est10 est11 est12 using re_h.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("RE GLS estimates with standard errors clustered at individual level." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("House Prices: Random Effect Estimates") stats(N time MSA, labels("Observations" "Time Dummies" "MSA Dummies")) drop(_cons _It* dmsa*) 
