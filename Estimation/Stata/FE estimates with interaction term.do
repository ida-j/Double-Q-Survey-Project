clear all
set more off
use "~/Dropbox/Double Q Survey Replication/Data/Stata/panel_ind.dta", clear
run "~/Dropbox/Double Q Survey Replication/Estimation/Stata/extra/generate intaraction variables and label variables.do"

cd "~/Dropbox/Double Survey Q Project (2)/paper_draft/estimates April2017/"

xtset prim_key period

******** EQUITY

eststo clear

xtreg pi_e_1m_e  x_female_e x_male_e, fe robust 
eststo reg1

xtreg pi_e_1m_e  x_asian_e x_nasian_e, fe robust
eststo reg2

xtreg pi_e_1m_e  x_black_e x_nblack_e, fe robust
eststo reg3

xtreg pi_e_1m_e  x_hisp_e x_nhisp_e, fe robust
eststo reg4

xtreg pi_e_3m_e  x_female_e x_male_e, fe robust 
eststo reg5

xtreg pi_e_3m_e  x_asian_e x_nasian_e, fe robust
eststo reg6

xtreg pi_e_3m_e  x_black_e x_nblack_e, fe robust
eststo reg7

xtreg pi_e_3m_e  x_hisp_e x_nhisp_e, fe robust
eststo reg8

xtreg pi_e_1y_e  x_female_e x_male_e, fe robust 
eststo reg9

xtreg pi_e_1y_e  x_asian_e x_nasian_e, fe robust
eststo reg10

xtreg pi_e_1y_e  x_black_e x_nblack_e, fe robust
eststo reg11

xtreg pi_e_1y_e  x_hisp_e x_nhisp_e, fe robust
eststo reg12


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 using fe_int_e.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("FE estimates with standard errors robust to heteroskedasticity and serial correlation." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Equity Prices")  drop(_cons) 

eststo clear

xtreg pi_e_1m_g  x_female_g x_male_g, fe robust 
eststo reg1

xtreg pi_e_1m_g  x_asian_g x_nasian_g, fe robust
eststo reg2

xtreg pi_e_1m_g  x_black_g x_nblack_g, fe robust
eststo reg3

xtreg pi_e_1m_g  x_hisp_g x_nhisp_g, fe robust
eststo reg4

xtreg pi_e_3m_g  x_female_g x_male_g, fe robust 
eststo reg5

xtreg pi_e_3m_g  x_asian_g x_nasian_g, fe robust
eststo reg6

xtreg pi_e_3m_g  x_black_g x_nblack_g, fe robust
eststo reg7

xtreg pi_e_3m_g  x_hisp_g x_nhisp_g, fe robust
eststo reg8

xtreg pi_e_1y_g  x_female_g x_male_g, fe robust 
eststo reg9

xtreg pi_e_1y_g  x_asian_g x_nasian_g, fe robust
eststo reg10

xtreg pi_e_1y_g  x_black_g x_nblack_g, fe robust
eststo reg11

xtreg pi_e_1y_g  x_hisp_g x_nhisp_g, fe robust
eststo reg12


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 using fe_int_g.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("FE estimates with standard errors robust to heteroskedasticity and serial correlation." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Gold Prices")  drop(_cons) 

eststo clear

xtreg pi_e_1m_h  x_female_h x_male_h, fe robust 
eststo reg1

xtreg pi_e_1m_h  x_asian_h x_nasian_h, fe robust
eststo reg2

xtreg pi_e_1m_h  x_black_h x_nblack_h, fe robust
eststo reg3

xtreg pi_e_1m_h  x_hisp_h x_nhisp_h, fe robust
eststo reg4

xtreg pi_e_3m_h  x_female_h x_male_h, fe robust 
eststo reg5

xtreg pi_e_3m_h  x_asian_h x_nasian_h, fe robust
eststo reg6

xtreg pi_e_3m_h  x_black_h x_nblack_h, fe robust
eststo reg7

xtreg pi_e_3m_h  x_hisp_h x_nhisp_h, fe robust
eststo reg8

xtreg pi_e_1y_h  x_female_h x_male_h, fe robust 
eststo reg9

xtreg pi_e_1y_h  x_asian_h x_nasian_h, fe robust
eststo reg10

xtreg pi_e_1y_h  x_black_h x_nblack_h, fe robust
eststo reg11

xtreg pi_e_1y_h  x_hisp_h x_nhisp_h, fe robust
eststo reg12


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 using fe_int_h.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("FE estimates with standard errors robust to heteroskedasticity and serial correlation." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("House Prices")  drop(_cons) 
