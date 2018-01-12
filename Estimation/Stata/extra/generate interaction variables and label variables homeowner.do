drop pi_e_1m_e pi_e_3m_e pi_e_1y_e pi_e_1m_g pi_e_3m_g pi_e_1y_g pi_e_1m_h pi_e_3m_h pi_e_1y_h

rename pi_e_1m_e_new pi_e_1m_e
rename pi_e_3m_e_new pi_e_3m_e
rename pi_e_1y_e_new pi_e_1y_e

rename pi_e_1m_g_new pi_e_1m_g
rename pi_e_3m_g_new pi_e_3m_g
rename pi_e_1y_g_new pi_e_1y_g

rename pi_e_1m_h_new pi_e_1m_h
rename pi_e_3m_h_new pi_e_3m_h
rename pi_e_1y_h_new pi_e_1y_h


label variable pi_e_1m_e "\$\pi^e_{i,t+1|t}$"
label variable pi_e_3m_e "\$\pi^e_{i,t+3|t}$"
label variable pi_e_1y_e "\$\pi^e_{i,t+12|t}$"


label variable pi_e_1m_g "\$\pi^e_{i,t+1|t}$"
label variable pi_e_3m_g "\$\pi^e_{i,t+3|t}$"
label variable pi_e_1y_g "\$\pi^e_{i,t+12|t}$"


label variable pi_e_1m_h "\$\pi^e_{i,t+1|t}$"
label variable pi_e_3m_h "\$\pi^e_{i,t+3|t}$"
label variable pi_e_1y_h "\$\pi^e_{i,t+12|t}$"

label variable v_e "\$x_{it}$"
label variable v_g "\$x_{it}$"
label variable v_h "\$x_{it}$"


gen x_female_e = v_e*female
label variable x_female_e "\$x_{it}\cdot Female$"

gen x_male_e = v_e*(1-female)
label variable x_male_e "\$x_{it}\cdot (1-Female)$"

gen x_asian_e = v_e*asian
label variable x_asian_e "\$x_{it}\cdot Asian$"

gen x_nasian_e = v_e*(1-asian)
label variable x_nasian_e "\$x_{it}\cdot (1-Asian)$"

gen x_black_e = v_e*black
label variable x_black_e "\$x_{it}\cdot Black$"

gen x_nblack_e = v_e*(1-black)
label variable x_nblack_e "\$x_{it}\cdot (1-Black)$"

gen x_hisp_e = v_e*hispaniclatino
label variable x_hisp_e "\$x_{it}\cdot Hispanic/Latino$"

gen x_nhisp_e = v_e*(1-hispaniclatino)
label variable x_nhisp_e "\$x_{it}\cdot (1-Hispanic/Latino)$"


gen x_female_g = v_g*female
label variable x_female_g "\$x_{it}\cdot Female$"

gen x_male_g = v_g*(1-female)
label variable x_male_g "\$x_{it}\cdot (1-Female)$"

gen x_asian_g = v_g*asian
label variable x_asian_g "\$x_{it}\cdot Asian$"

gen x_nasian_g = v_g*(1-asian)
label variable x_nasian_g "\$x_{it}\cdot (1-Asian)$"

gen x_black_g = v_g*black
label variable x_black_g "\$x_{it}\cdot Black$"

gen x_nblack_g = v_g*(1-black)
label variable x_nblack_g "\$x_{it}\cdot (1-Black)$"

gen x_hisp_g = v_g*hispaniclatino
label variable x_hisp_g "\$x_{it}\cdot Hispanic/Latino$"

gen x_nhisp_g = v_g*(1-hispaniclatino)
label variable x_nhisp_g "\$x_{it}\cdot (1-Hispanic/Latino)$"

gen x_female_h = v_h*female
label variable x_female_h "\$x_{it}\cdot Female$"

gen x_male_h = v_h*(1-female)
label variable x_male_h "\$x_{it}\cdot (1-Female)$"

gen x_asian_h = v_h*asian
label variable x_asian_h "\$x_{it}\cdot Asian$"

gen x_nasian_h = v_h*(1-asian)
label variable x_nasian_h "\$x_{it}\cdot (1-Asian)$"

gen x_black_h = v_h*black
label variable x_black_h "\$x_{it}\cdot Black$"

gen x_nblack_h = v_h*(1-black)
label variable x_nblack_h "\$x_{it}\cdot (1-Black)$"

gen x_hisp_h = v_h*hispaniclatino
label variable x_hisp_h "\$x_{it}\cdot Hispanic/Latino$"

gen x_nhisp_h = v_h*(1-hispaniclatino)
label variable x_nhisp_h "\$x_{it}\cdot (1-Hispanic/Latino)$"

gen x_homeowner_e = v_e*homeowner
label variable x_homeowner_e "\$x_{it}\cdot homeowner$"

gen x_nhomeowner_e = v_e*(1-homeowner)
label variable x_nhomeowner_e "\$x_{it}\cdot (1-homeowner)$"

gen x_homeowner_g = v_g*homeowner
label variable x_homeowner_g "\$x_{it}\cdot homeowner$"

gen x_nhomeowner_g = v_g*(1-homeowner)
label variable x_nhomeowner_g "\$x_{it}\cdot (1-homeowner)$"

gen x_homeowner_h = v_h*homeowner
label variable x_homeowner_h "\$x_{it}\cdot homeowner$"

gen x_nhomeowner_h = v_h*(1-homeowner)
label variable x_nhomeowner_h "\$x_{it}\cdot (1-homeowner)$"


label variable av_age "\$\ln age$"
label variable av_inc "\$\ln income$"
label variable female "Female"
label variable asian "Asian"
label variable black  "Black"
label variable hispaniclatino "Hispanic/Latino" 
label variable av_ed "Education"
