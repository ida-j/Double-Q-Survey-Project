clear
set more off
use "/Users/manguito/Dropbox/Double Q Survey Replication/Data/Stata/panel_ind_h.dta"
run "~/Dropbox/Double Q Survey Replication/Estimation/Stata/extra/generate interaction variables and label variables homeowner.do"

cd "~/Dropbox/Double Survey Q Project (2)/paper_draft/estimates April2017/"

xtset prim_key period

eststo clear


xtreg pi_e_1m_e  x_homeowner_e x_nhomeowner_e, fe robust
eststo reg1

xtreg pi_e_3m_e  x_homeowner_e x_nhomeowner_e, fe robust
eststo reg2

xtreg pi_e_1y_e  x_homeowner_e x_nhomeowner_e, fe robust
eststo reg3


xtreg pi_e_1m_g  x_homeowner_g x_nhomeowner_g, fe robust
eststo reg4

xtreg pi_e_3m_g  x_homeowner_g x_nhomeowner_g, fe robust
eststo reg5

xtreg pi_e_1y_g  x_homeowner_g x_nhomeowner_g, fe robust
eststo reg6

xtreg pi_e_1m_h  x_homeowner_h x_nhomeowner_h, fe robust
eststo reg7

xtreg pi_e_3m_h  x_homeowner_h x_nhomeowner_h, fe robust
eststo reg8

xtreg pi_e_1y_h  x_homeowner_h x_nhomeowner_h, fe robust
eststo reg9


esttab reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 using fe_homeowner.tex, replace nonumber booktabs    se star(* 0.10 ** 0.05 *** 0.01)   label ///
substitute(\_ _)  ///
addnotes("FE estimates with standard errors robust to heteroskedasticity and serial correlation." " Unbalanced panel, \$T=11$, \$\min T_i=1$, \$\max T_i=11$." "\$\pi^e_{i,\ell,t+h|t}$ is expressed in percent per quarter for all \$h$." ) ///
title("Estimates with homeowner")  drop(_cons) 
