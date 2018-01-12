clear all
set more off
use "~/Dropbox/Double Q Survey Replication/Data/Stata/panel_ind.dta", clear
run "~/Dropbox/Double Q Survey Replication/Estimation/Stata/extra/generate intaraction variables and label variables.do"

cd "~/Dropbox/Double Survey Q Project (2)/paper_draft/estimates April2017/"

label define genderlabel 0 "Male" 1 "Female"
label values female genderlabel
  
 
gen ind1m_e="none"
replace ind1m_e="bubble" if b_1m_e==1
replace ind1m_e="crash" if c_1m_e==1

gen ind3m_e="none"
replace ind3m_e="bubble" if b_3m_e==1
replace ind3m_e="crash" if c_3m_e==1

gen ind1y_e="none"
replace ind1y_e="bubble" if b_1y_e==1
replace ind1y_e="crash" if c_1y_e==1

gen ind1m_g="none"
replace ind1m_g="bubble" if b_1m_g==1
replace ind1m_g="crash" if c_1m_g==1

gen ind3m_g="none"
replace ind3m_g="bubble" if b_3m_g==1
replace ind3m_g="crash" if c_3m_g==1

gen ind1y_g="none"
replace ind1y_g="bubble" if b_1y_g==1
replace ind1y_g="crash" if c_1y_g==1

gen ind1m_h="none"
replace ind1m_h="bubble" if b_1m_h==1
replace ind1m_h="crash" if c_1m_h==1

gen ind3m_h="none"
replace ind3m_h="bubble" if b_3m_h==1
replace ind3m_h="crash" if c_3m_h==1

gen ind1y_h="none"
replace ind1y_h="bubble" if b_1y_h==1
replace ind1y_h="crash" if c_1y_h==1


***** 

tab ind1m_e female, column
tab ind3m_e female, column
tab ind1y_e female, column

tab ind1m_g female, column
tab ind3m_g female, column
tab ind1y_g female, column

tab ind1m_h female, column
tab ind3m_h female, column
tab ind1y_h female, column





