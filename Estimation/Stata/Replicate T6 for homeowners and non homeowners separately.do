clear all
set more off
use "/Users/manguito/Dropbox/Double Q Survey Replication/Data/Stata/panel_fete_h.dta", clear

eststo clear
xtset id t

*************** homeowner FE ***************************
* equity

xtreg eq1m ve if homeowner==1, fe robust
eststo est1a

xtreg eq3m ve if homeowner==1, fe robust
eststo est2a

xtreg eq1y ve if homeowner==1, fe robust
eststo est3a

* gold

xtreg gd1m vg if homeowner==1, fe robust
eststo est1b

xtreg gd3m vg if homeowner==1, fe robust
eststo est2b

xtreg gd1y vg if homeowner==1, fe robust
eststo est3b


* equity

xtreg hs1m vh if homeowner==1, fe robust
eststo est1c

xtreg hs3m vh if homeowner==1, fe robust
eststo est2c

xtreg hs1y vh if homeowner==1, fe robust
eststo est3c

cd "/Users/manguito/Downloads/"

esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fe_homeowner.csv , replace drop(_cons)


*************** nonhomeowner FE ***************************
eststo clear
* equity

xtreg eq1m ve if homeowner==0, fe robust
eststo est1a

xtreg eq3m ve if homeowner==0, fe robust
eststo est2a

xtreg eq1y ve if homeowner==0, fe robust
eststo est3a

* gold

xtreg gd1m vg if homeowner==0, fe robust
eststo est1b

xtreg gd3m vg if homeowner==0, fe robust
eststo est2b

xtreg gd1y vg if homeowner==0, fe robust
eststo est3b


* equity

xtreg hs1m vh if homeowner==0, fe robust
eststo est1c

xtreg hs3m vh if homeowner==0, fe robust
eststo est2c

xtreg hs1y vh if homeowner==0, fe robust
eststo est3c


esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fe_nonhomeowner.csv , replace drop(_cons)

eststo clear
*************** homeowner FE-TE ***************************
* equity

reg eq1mt vet if homeowner==1, cluster(id)
eststo est1a

reg eq3mt vet if homeowner==1,cluster(id)
eststo est2a

reg eq1yt vet if homeowner==1, cluster(id)
eststo est3a

* gold

reg gd1mt vgt if homeowner==1, cluster(id)
eststo est1b

reg gd3mt vgt if homeowner==1, cluster(id)
eststo est2b

reg gd1yt vgt if homeowner==1, cluster(id)
eststo est3b


* equity

reg hs1mt vht if homeowner==1, cluster(id)
eststo est1c

reg hs3mt vht if homeowner==1, cluster(id)
eststo est2c

reg hs1yt vht if homeowner==1, cluster(id)
eststo est3c

cd "/Users/manguito/Downloads/"

esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fete_homeowner.csv , replace drop(_cons)


*************** nonhomeowner FE-TE ***************************
eststo clear
* equity

reg eq1mt vet if homeowner==0, cluster(id)
eststo est1a

reg eq3mt vet if homeowner==0, cluster(id)
eststo est2a

reg eq1yt vet if homeowner==0, cluster(id)
eststo est3a

* gold

reg gd1mt vgt if homeowner==0, cluster(id)
eststo est1b

reg gd3mt vgt if homeowner==0, cluster(id)
eststo est2b

reg gd1yt vgt if homeowner==0, cluster(id)
eststo est3b


* equity

reg hs1mt vht if homeowner==0, cluster(id)
eststo est1c

reg hs3mt vht if homeowner==0, cluster(id)
eststo est2c

reg hs1yt vht if homeowner==0, cluster(id)
eststo est3c


esttab est1a est2a est3a est1b est2b est3b est1c est2c est3c using fete_nonhomeowner.csv , replace drop(_cons)
