clear all
set more off
use "~/Dropbox/Double Q Survey Replication/Data/Stata/panel_ind.dta", clear

eststo clear
xtset prim_key period

*************** FEMALE FE ***************************
* equity

xtreg pi_e_1m_e_new v_e if female==1, fe robust
eststo est1a

xtreg pi_e_3m_e_new v_e if female==1, fe robust
eststo est2a

xtreg pi_e_1y_e_new v_e if female==1, fe robust
eststo est3a

* gold

xtreg pi_e_1m_g_new v_g if female==1, fe robust
eststo est1b

xtreg pi_e_3m_g_new v_g if female==1, fe robust
eststo est2b

xtreg pi_e_1y_g_new v_g if female==1, fe robust
eststo est3b


* equity

xtreg pi_e_1m_h_new v_h if female==1, fe robust
eststo est1c

xtreg pi_e_3m_h_new v_h if female==1, fe robust
eststo est2c

xtreg pi_e_1y_h_new v_h if female==1, fe robust
eststo est3c

cd "/Users/manguito/Downloads/"

esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fe_female.csv , replace drop(_cons)


*************** MALE FE ***************************
eststo clear
* equity

xtreg pi_e_1m_e_new v_e if female==0, fe robust
eststo est1a

xtreg pi_e_3m_e_new v_e if female==0, fe robust
eststo est2a

xtreg pi_e_1y_e_new v_e if female==0, fe robust
eststo est3a

* gold

xtreg pi_e_1m_g_new v_g if female==0, fe robust
eststo est1b

xtreg pi_e_3m_g_new v_g if female==0, fe robust
eststo est2b

xtreg pi_e_1y_g_new v_g if female==0, fe robust
eststo est3b


* equity

xtreg pi_e_1m_h_new v_h if female==0, fe robust
eststo est1c

xtreg pi_e_3m_h_new v_h if female==0, fe robust
eststo est2c

xtreg pi_e_1y_h_new v_h if female==0, fe robust
eststo est3c


esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fe_male.csv , replace drop(_cons)


*********************** FE-TE ESTIMATES *****************
clear
set more off
use "/Users/manguito/Dropbox/Double Q Survey Replication/Data/Stata/panel_fetef.dta"
xtset id t

*************** FEMALE FE-TE ***************************
* equity

reg eq1mt vet if female==1, cluster(id)
eststo est1a

reg eq3mt vet if female==1, cluster(id)
eststo est2a

reg eq1yt vet if female==1, cluster(id)
eststo est3a

* gold

reg gd1mt vgt if female==1, cluster(id)
eststo est1b

reg gd3mt vgt if female==1, cluster(id)
eststo est2b

reg gd1yt vgt if female==1, cluster(id)
eststo est3b


* equity

reg hs1mt vht if female==1, cluster(id)
eststo est1c

reg hs3mt vht if female==1, cluster(id)
eststo est2c

reg hs1yt vht if female==1, cluster(id)
eststo est3c

cd "/Users/manguito/Downloads/"

esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fete_female.csv , replace drop(_cons)


*************** MALE FE-TE ***************************
eststo clear
* equity

reg eq1mt vet if female==0, cluster(id)
eststo est1a

reg eq3mt vet if female==0, cluster(id)
eststo est2a

reg eq1yt vet if female==0, cluster(id)
eststo est3a

* gold

reg gd1mt vgt if female==0, cluster(id)
eststo est1b

reg gd3mt vgt if female==0, cluster(id)
eststo est2b

reg gd1yt vgt if female==0, cluster(id)
eststo est3b


* equity

reg hs1mt vht if female==0, cluster(id)
eststo est1c

reg hs3mt vht if female==0, cluster(id)
eststo est2c

reg hs1yt vht if female==0, cluster(id)
eststo est3c


esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fete_male.csv , replace drop(_cons)
