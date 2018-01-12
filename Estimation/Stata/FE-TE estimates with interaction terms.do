clear all
set more off
use "/Users/manguito/Dropbox/Double Q Survey Replication/Data/Stata/panel_wk_int_no_z.dta"
run "~/Dropbox/Double Q Survey Replication/Estimation/Stata/extra/label variables for FETE interaction regressions.do"

cd "~/Dropbox/Double Survey Q Project (2)/paper_draft/estimates April2017/"

xtset id t

******** EQUITY

eststo clear

xtreg pi1met  x_female_e x_male_e, fe robust 
eststo reg1

xtreg pi1met  x_asian_e x_nasian_e, fe robust
eststo reg2

xtreg pi1met  x_black_e x_nblack_e, fe robust
eststo reg3

xtreg pi1met  x_hisp_e x_nhisp_e, fe robust
eststo reg4

xtreg pi3met  x_female_e x_male_e, fe robust 
eststo reg5

xtreg pi3met  x_asian_e x_nasian_e, fe robust
eststo reg6

xtreg pi3met  x_black_e x_nblack_e, fe robust
eststo reg7

xtreg pi3met  x_hisp_e x_nhisp_e, fe robust
eststo reg8

xtreg pi1yet  x_female_e x_male_e, fe robust 
eststo reg9

xtreg pi1yet  x_asian_e x_nasian_e, fe robust
eststo reg10

xtreg pi1yet  x_black_e x_nblack_e, fe robust
eststo reg11

xtreg pi1yet  x_hisp_e x_nhisp_e, fe robust
eststo reg12


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 using fete_int_e.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _) starlevels( * 0.10 ** 0.05 *** 0.010) ///
addnotes("FE estimates with standard errors robust to heteroskedasticity and serial correlation." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Equity Prices")  drop(_cons) 

eststo clear

xtreg pi1mgt  x_female_g x_male_g, fe robust 
eststo reg1

xtreg pi1mgt  x_asian_g x_nasian_g, fe robust
eststo reg2

xtreg pi1mgt  x_black_g x_nblack_g, fe robust
eststo reg3

xtreg pi1mgt  x_hisp_g x_nhisp_g, fe robust
eststo reg4

xtreg pi3mgt  x_female_g x_male_g, fe robust 
eststo reg5

xtreg pi3mgt  x_asian_g x_nasian_g, fe robust
eststo reg6

xtreg pi3mgt  x_black_g x_nblack_g, fe robust
eststo reg7

xtreg pi3mgt  x_hisp_g x_nhisp_g, fe robust
eststo reg8

xtreg pi1ygt  x_female_g x_male_g, fe robust 
eststo reg9

xtreg pi1ygt  x_asian_g x_nasian_g, fe robust
eststo reg10

xtreg pi1ygt  x_black_g x_nblack_g, fe robust
eststo reg11

xtreg pi1ygt  x_hisp_g x_nhisp_g, fe robust
eststo reg12


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 using fete_int_g.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  starlevels( * 0.10 ** 0.05 *** 0.010) ///
addnotes("FE estimates with standard errors robust to heteroskedasticity and serial correlation." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Gold Prices")  drop(_cons) 

eststo clear

xtreg pi1mht  x_female_h x_male_h, fe robust 
eststo reg1

xtreg pi1mht  x_asian_h x_nasian_h, fe robust
eststo reg2

xtreg pi1mht  x_black_h x_nblack_h, fe robust
eststo reg3

xtreg pi1mht  x_hisp_h x_nhisp_h, fe robust
eststo reg4

xtreg pi3mht  x_female_h x_male_h, fe robust 
eststo reg5

xtreg pi3mht  x_asian_h x_nasian_h, fe robust
eststo reg6

xtreg pi3mht  x_black_h x_nblack_h, fe robust
eststo reg7

xtreg pi3mht  x_hisp_h x_nhisp_h, fe robust
eststo reg8

xtreg pi1yht  x_female_h x_male_h, fe robust 
eststo reg9

xtreg pi1yht  x_asian_h x_nasian_h, fe robust
eststo reg10

xtreg pi1yht  x_black_h x_nblack_h, fe robust
eststo reg11

xtreg pi1yht  x_hisp_h x_nhisp_h, fe robust
eststo reg12


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 using fete_int_h.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _) starlevels( * 0.10 ** 0.05 *** 0.010) ///
addnotes("FE estimates with standard errors robust to heteroskedasticity and serial correlation." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("House Prices")  drop(_cons) 
