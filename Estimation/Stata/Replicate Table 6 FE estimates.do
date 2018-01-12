clear all
set more off
use "~/Dropbox/Double Q Survey Replication/Data/Stata/panel_ind.dta", clear

eststo clear
xtset prim_key period

capture log close
log using "Table 6 FE.log", replace
** FE

* equity

xtreg pi_e_1m_e_new v_e, fe robust
eststo est1a

xtreg pi_e_3m_e_new v_e, fe robust
eststo est2a

xtreg pi_e_1y_e_new v_e, fe robust
eststo est3a

* gold

xtreg pi_e_1m_g_new v_g, fe robust
eststo est1b

xtreg pi_e_3m_g_new v_g, fe robust
eststo est2b

xtreg pi_e_1y_g_new v_g, fe robust
eststo est3b


* equity

xtreg pi_e_1m_h_new v_h, fe robust
eststo est1c

xtreg pi_e_3m_h_new v_h, fe robust
eststo est2c

xtreg pi_e_1y_h_new v_h, fe robust
eststo est3c




