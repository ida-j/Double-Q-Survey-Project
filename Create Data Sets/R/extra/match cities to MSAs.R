msas<-msa.p$MSA
msas<-sort(msas)
l1<-list(wave5,wave6,wave7,wave8,wave9,wave10,wave11,wave12,wave13,wave14,wave15)
vec<-vector()
for(i in 1:length(l1)){
  data<-l1[[i]]
  data$msa<-data$city
  for(j in levels(data$msa)){
    if(j != ""){
      num<-agrep(j,msas)
      if(length(num)==1){
        levels(data$msa)[levels(data$msa)==j]<-levels(msas)[num]}
      else{
        vec<-rbind(vec,j)}
    }}
  
  # match by hand ---------------
  j<- "Anaheim-Santa Ana-Irvine"
  levels(data$msa)[levels(data$msa)==j]<-"Los Angeles-Long Beach-Anaheim, CA"
  
  j<- "Atlanta-Sandy Springs-Mariett"           	
  levels(data$msa)[levels(data$msa)==j]<-"Atlanta-Sandy Springs-Roswell, GA"
  
  j<- "Baltimore-Towson"                        	
  levels(data$msa)[levels(data$msa)==j]<-"Baltimore-Columbia-Towson, MD"
  
  j<- "Boise City-Nampa"                        	
  levels(data$msa)[levels(data$msa)==j]<-"Boise City, ID"
  
  j<- "Boston-Cambridge-Quincy"                 	
  levels(data$msa)[levels(data$msa)==j]<-"Boston-Cambridge-Newton, MA-NH"
  
  j<- "Buffalo-Niagara Falls"                   	
  levels(data$msa)[levels(data$msa)==j]<-"Buffalo-Cheektowaga-Niagara Falls, NY"
  
  
  j<- "Chicago-Naperville-Joliet"               	
  levels(data$msa)[levels(data$msa)==j ]<-"Chicago-Naperville-Elgin, IL-IN-WI"
  
  j<- "Cincinnati-Middletown"                   	
  levels(data$msa)[levels(data$msa)==j ]<-"Cincinnati, OH-KY-IN"
  
  j<- "Cleveland-Elyria-Mentor"                 	
  levels(data$msa)[levels(data$msa)==j ]<-"Cleveland-Elyria, OH"
  
  
  
  j<- "Dayton"                                  	
  levels(data$msa)[levels(data$msa)==j ]<-"Dayton, OH"
  
  
  
  
  j<- "Detroit-Warren-Livonia"                  	
  levels(data$msa)[levels(data$msa)==j ]<-"Detroit-Warren-Dearborn, MI"
  
  j<- "Dover"                                   	
  levels(data$msa)[levels(data$msa)==j ]<-"Dover, DE"
  
  j<- "Erie"                                    	
  levels(data$msa)[levels(data$msa)==j ]<-"Erie, PA"
  
  j<- "Florence"                                	
  levels(data$msa)[levels(data$msa)==j ]<-"Florence, SC"
  
  #Florence-Muscle Shoals, AL
  
  j<- "Ft. Wayne"                               	
  levels(data$msa)[levels(data$msa)==j ]<-"Fort Wayne, IN"
  
  
  j<- "Gary-Hammond"                            	
  levels(data$msa)[levels(data$msa)==j ]<-"Chicago-Naperville-Elgin, IL-IN-WI"
  
  j<- "Greenville"                              	
  levels(data$msa)[levels(data$msa)==j ]<-"Greenville, NC"
  
  j<- "Houston-Baytown-Sugar Land"              	
  levels(data$msa)[levels(data$msa)==j ]<-"Houston-The Woodlands-Sugar Land, TX"
  
  
  
  j<- "Kankakee-Bradley"                        	
  levels(data$msa)[levels(data$msa)==j ]<-"Kankakee, IL"
  
  j<- "Kennewick-Richland-Pasco"                	
  levels(data$msa)[levels(data$msa)==j ]<-"Kennewick-Richland, WA"
  
  j<- "Lansing-E.Lansing"                       	
  levels(data$msa)[levels(data$msa)==j ]<-"Lansing-East Lansing, MI"
  
  j<- "Las Vegas-Paradise"                      	
  levels(data$msa)[levels(data$msa)==j ]<-"Las Vegas-Henderson-Paradise, NV"
  
  j<- "Little Rock-N. Little Rock"              	
  levels(data$msa)[levels(data$msa)==j ]<-"Little Rock-North Little Rock-Conway, AR"
  
  j<- "Los Angeles-Long Beach-Santa Ana"        	
  levels(data$msa)[levels(data$msa)==j ]<-"Los Angeles-Long Beach-Anaheim, CA"
  
  j<- "Miami-Fort Lauderdale-Miami Beach"       	
  levels(data$msa)[levels(data$msa)==j ]<-"Miami-Fort Lauderdale-West Palm Beach, FL"
  
  j<- "Nassau-Suffolk"                          	
  levels(data$msa)[levels(data$msa)==j ]<-"New York-Newark-Jersey City, NY-NJ-PA"
  
  j<- "Newark-Union"                            	
  levels(data$msa)[levels(data$msa)==j ]<-"New York-Newark-Jersey City, NY-NJ-PA"
  
  
  
  j<- "New Orleans-Metairie-Kenner"             	
  levels(data$msa)[levels(data$msa)==j ]<-"New Orleans-Metairie, LA"
  
  j<- "New York-Northern New Jersey-Long Island"	
  levels(data$msa)[levels(data$msa)==j ]<-"New York-Newark-Jersey City, NY-NJ-PA"
  
  j<- "New York-Wayne-White Plains"             	
  levels(data$msa)[levels(data$msa)==j ]<-"New York-Newark-Jersey City, NY-NJ-PA"
  
  j<- "Ocala"                                   	
  levels(data$msa)[levels(data$msa)==j ]<-"Ocala, FL"
  
  j<-  "Portland-South Portland-Biddeford"       	
  levels(data$msa)[levels(data$msa)==j ]<-"Portland-South Portland, ME"
  
  j <- "Portland-Vancouver-Beaverton"            	
  levels(data$msa)[levels(data$msa)==j ]<-"Portland-Vancouver-Hillsboro, OR-WA"
  
  j <- "Providence-New Bedford-Fall River"       	
  levels(data$msa)[levels(data$msa)==j ]<-"Providence-Warwick, RI-MA"
  
  j <- "Raleigh-Cary"                            	
  levels(data$msa)[levels(data$msa)==j ]<-"Raleigh, NC"
  
  j <- "Reading"                                 	
  levels(data$msa)[levels(data$msa)==j ]<-"Reading, PA"
  
  
  
  j<-  "Sacramento-Arden-Arcade--Roseville"      	
  levels(data$msa)[levels(data$msa)==j ]<-"Sacramento--Roseville--Arden-Arcade, CA"
  j <- "Saint Louis"                             	
  levels(data$msa)[levels(data$msa)==j ]<-"St. Louis, MO-IL"
  
  j <- "Salem"                                   	
  levels(data$msa)[levels(data$msa)==j ]<-"Salem, OR"
  
  j <- "San Diego-Carlsbad-San Marcos"           	
  levels(data$msa)[levels(data$msa)==j ]<-"San Diego-Carlsbad, CA"
  
  j <- "San Francisco-Oakland-Fremont"           	
  levels(data$msa)[levels(data$msa)==j ]<-"San Francisco-Oakland-Hayward, CA"
  
  j <- "Sarasota-Bradenton-Venice"               	
  levels(data$msa)[levels(data$msa)==j ]<-"North Port-Sarasota-Bradenton, FL"
  
  
  # not matched: Springfield, KS, CT
  
  j<-  "Trenton-Ewing"                           	
  levels(data$msa)[levels(data$msa)==j ]<-"Trenton, NJ"
  
  j <- "Wichita"  	
  levels(data$msa)[levels(data$msa)==j ]<-"Wichita, KS"
  
  data$msa<-as.character(data$msa)
  data$state<-as.character(data$state)
  
  data$msa[data$state=="WASHINGTON D.C." & data$city!=NA]<-"Washington-Arlington-Alexandria, DC-VA-MD-WV"
  
  j<- "Charleston"                              	
  data$msa[data$msa==j & data$state=="SC"]<-"Charleston-North Charleston, SC"
  data$msa[data$msa==j & data$state=="WV"]<-"Charleston, WV"
  data$msa[data$msa=="Charleston, WV" & data$state!="WV"]<-NA
  data$msa[data$msa==j]<-NA
  
  j<- "Columbia"                                	
  data$msa[data$msa==j & data$state=="MO"]<-"Columbia, MO"
  data$msa[data$msa==j & data$state=="SC"]<-"Columbia, SC"
  data$msa[data$msa==j & data$state=="GA"]<-"Columbia, SC"
  data$msa[data$msa==j]<-NA
  
  j<- "Columbus"                                	
  data$msa[data$msa==j & data$state=="GA"]<-"Columbus, GA-AL"
  data$msa[data$msa==j & data$state=="AL"]<-"Columbus, GA-AL"
  data$msa[data$msa==j & data$state=="IN"]<-"Columbus, IN"
  data$msa[data$msa==j & data$state=="OH"]<-"Columbus, OH"
  data$msa[data$msa==j]<-NA
  
  j<- "Decatur"                                 	
  data$msa[data$msa==j & data$state=="AL"]<-"Decatur, AL"
  data$msa[data$msa==j& data$state== "IL"]<-"Decatur, IL"
  data$msa[data$msa==j]<-NA
  
  j<- "Edison"                            	
  data$msa[data$city==j]<-"New York-Newark-Jersey City, NY-NJ-PA"
  
  j<- "Gainesville"                             	
  data$msa[data$msa==j &data$state=="FL"]<-"Gainesville, FL"
  
  
  data$msa[data$msa==j &data$state=="GA"]<-"Gainesville, GA"
  
  j<- "Jackson"                                 	
  data$msa[data$msa==j & data$state=="MS"]<-"Jackson, MI"
  data$msa[data$msa==j & data$state=="MS"]<-"Jackson, MS"
  data$msa[data$msa==j & data$state=="TN"]<-"Jackson, TN"
  data$msa[data$msa==j]<-NA
  
  j<- "Jacksonville"                            	
  data$msa[data$msa==j & data$state=="FL" ]<-"Jacksonville, FL"
  data$msa[data$msa==j & data$state=="NC" ]<-"Jacksonville, NC"
  data$msa[data$msa==j]<-NA
  
  j <- "Rochester"                               	
  data$msa[data$msa==j & data$state=="MN"]<-"Rochester, MN"
  data$msa[data$msa==j & data$state=="NY"]<-"Rochester, NY"
  data$msa[data$msa==j]<-NA
  
  j<-"Salt Lake City"
  data$msa[data$msa=="San Francisco-Oakland-Hayward, CA" & data$city==j]<-"Salt Lake City, UT"
  
  j<-"San Antonio"
  data$msa[data$city==j]<-"San Antonio-New Braunfels, TX"
  
  j<-"Shreveport-Bossier City, LA"
  data$msa[data$city=="Shreveport-Bossier City"]<-j
  
  j<-"Sioux Falls"
  data$msa[data$city==j]<-NA
  
  j <- "Springfield"                             	
  data$msa[data$msa==j & data$state=="MA"]<-"Springfield, MA"
  data$msa[data$msa==j & data$state=="IL"]<-"Springfield, IL"
  data$msa[data$msa==j & data$state=="MO"]<-"Springfield, MO"
  data$msa[data$msa==j & data$state=="OH"]<-"Springfield, OH"
  data$msa[data$msa==j]<-NA # springfield not matched to an MSA
  
  j<-"South Bend-Mishawaka, IN-MI"
  data$msa[data$city=="South Bend-Mishawaka"]<-j
  
  j<-"Spartanburg, SC"
  data$msa[data$city=="Spartanburg"]<-j
  
  ###########---------------
  # merge with house prices
  # data<-merge(data,msa.p,by.x="msa",by.y="msa",all.x=TRUE,all.y=FALSE)
  
  
  number<-i+4
  assign(paste("wave", number, sep = ""),data)
  
}


# 
# test5=subset(wave5,select=c(msa,city,state))
# test6=subset(wave6,select=c(msa,city,state))
# test7=subset(wave7,select=c(msa,city,state))
# test8=subset(wave8,select=c(msa,city,state))
# test9=subset(wave9,select=c(msa,city,state))
# test10=subset(wave10,select=c(msa,city,state))
# test11=subset(wave11,select=c(msa,city,state))
# test12=subset(wave12,select=c(msa,city,state))
# test13=subset(wave13,select=c(msa,city,state))
# test14=subset(wave14,select=c(msa,city,state))
# test15=subset(wave15,select=c(msa,city,state))
# 
# test<-rbind(test5,test6,test7,test8,test9,test10,test11,test12,test13,test14,test15)
# test<-unique(test)
#aggregate(housing.price~msa,wave7,var)
