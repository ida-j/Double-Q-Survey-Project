# The data is referred to as "data.x"

# create "state" variable --------------------------------------------
data.x$state[data.x$statereside==1]<-"AK"
data.x$state[data.x$statereside==2]<-"AL"
data.x$state[data.x$statereside==3]<-"AZ"
data.x$state[data.x$statereside==4]<-"AR"
data.x$state[data.x$statereside==5]<-"CA"
data.x$state[data.x$statereside==6]<-"CO"
data.x$state[data.x$statereside==7]<-"CT"
data.x$state[data.x$statereside==8]<-"DE"
data.x$state[data.x$statereside==9]<-"FL"
data.x$state[data.x$statereside==10]<-"GA"
data.x$state[data.x$statereside==11]<-"HI"
data.x$state[data.x$statereside==12]<-"ID"
data.x$state[data.x$statereside==13]<-"IL"
data.x$state[data.x$statereside==14]<-"IN"
data.x$state[data.x$statereside==15]<-"IA"
data.x$state[data.x$statereside==16]<-"KS"
data.x$state[data.x$statereside==17]<-"KY"
data.x$state[data.x$statereside==18]<-"LA"
data.x$state[data.x$statereside==19]<-"ME"
data.x$state[data.x$statereside==20]<-"MD"
data.x$state[data.x$statereside==21]<-"MA"
data.x$state[data.x$statereside==22]<-"MI"
data.x$state[data.x$statereside==23]<-"MN"
data.x$state[data.x$statereside==24]<-"MS"
data.x$state[data.x$statereside==25]<-"MO"
data.x$state[data.x$statereside==26]<-"MT"
data.x$state[data.x$statereside==27]<-"NE"
data.x$state[data.x$statereside==28]<-"NV"
data.x$state[data.x$statereside==29]<-"NH"
data.x$state[data.x$statereside==30]<-"NJ"
data.x$state[data.x$statereside==31]<-"NM"
data.x$state[data.x$statereside==32]<-"NY"
data.x$state[data.x$statereside==33]<-"NC"
data.x$state[data.x$statereside==34]<-"ND"
data.x$state[data.x$statereside==35]<-"OH"
data.x$state[data.x$statereside==36]<-"OK"
data.x$state[data.x$statereside==37]<-"OR"
data.x$state[data.x$statereside==38]<-"PA"
data.x$state[data.x$statereside==39]<-"RI"
data.x$state[data.x$statereside==40]<-"SC"
data.x$state[data.x$statereside==41]<-"SD"
data.x$state[data.x$statereside==42]<-"TN"
data.x$state[data.x$statereside==43]<-"TX"
data.x$state[data.x$statereside==44]<-"UT"
data.x$state[data.x$statereside==45]<-"VT"
data.x$state[data.x$statereside==46]<-"VA"
data.x$state[data.x$statereside==47]<-"WA"
data.x$state[data.x$statereside==48]<-"WV"
data.x$state[data.x$statereside==49]<-"WI"
data.x$state[data.x$statereside==50]<-"WY"
data.x$state[data.x$statereside==51]<-"WASHINGTON D.C."
data.x$state[data.x$statereside==52]<-"PUERTO RICO"

data.x$region4[data.x$state %in% c("CT", "ME","MA","NH","RI","VT","NJ","NY","PA")]<-"Northeast"
data.x$region4[data.x$state %in% c("IL","IN","MI","OH","WI","IA","KS","MN","MO","NE","ND","SD")]<-"Midwest"
data.x$region4[data.x$state %in% c("DE","FL","GA","MD","NC","SC","VA","WASHINGTON D.C.","WV","AL","KY","MS","TN","AR","LA","OK","TX")]<-"South"
data.x$region4[data.x$state %in% c("AZ","CO","ID","MT","NV","NM","UT","WY","AK","CA","HI","OR","WA")]<-"West"

#Region 1: Northeast
#Connecticut, Maine, Massachusetts, New Hampshire, Rhode Island, Vermont, New Jersey, New York, and Pennsylvania

#Region 2: Midwest 
# Illinois, Indiana, Michigan, Ohio, and Wisconsin
# Iowa, Kansas, Minnesota, Missouri, Nebraska, North Dakota, and South Dakota

# Region 3: South
# Delaware, Florida, Georgia, Maryland, North Carolina, South Carolina, Virginia, Washington D.C., and West Virginia
# Alabama, Kentucky, Mississippi, and Tennessee
# Arkansas, Louisiana, Oklahoma, and Texas

#Region 4: West
# Arizona, Colorado, Idaho, Montana, Nevada, New Mexico, Utah, and Wyoming
# Alaska, California, Hawaii, Oregon, and Washington

data.x$region8[data.x$state %in% c("CT", "ME","MA","NH","RI","VT")]<-"New England"
data.x$region8[data.x$state %in% c("DE","WASHINGTON D.C.","MD","NJ","NY","PA")]<-"Mid-East"
data.x$region8[data.x$state %in% c("AL","AR","FL","GA","KY","LA","MS","NC","SC","TN","VA","WV")]<-"South East"
data.x$region8[data.x$state %in% c("IL","IN","MI","OH","WI")]<-"Great Lakes"
data.x$region8[data.x$state %in% c("IA","KS","MN","MO","NE","ND","SD")]<-"Plains"
data.x$region8[data.x$state %in% c("AZ","NM","OK","TX")]<-"South West"
data.x$region8[data.x$state %in% c("CO","ID","MT","UT","WY")]<-"Rocky Mountains"
data.x$region8[data.x$state %in% c("AK","CA","HI","NV","OR","WA")]<-"Far West"
