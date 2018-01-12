# assigns latitude and longitude to state/city locations using data from the zipcode package
# data the doesn't match the zipcode package is assigned a location "manually"
# The data is referred to as "data.x"

library(stargazer)
library(zipcode)
library(doBy)


data(zipcode)
zip.average<-summaryBy(latitude + longitude ~ city+state,data=zipcode)
zip.average$latitude<-zip.average$latitude.mean
zip.average$longitude<-zip.average$longitude.mean
zip.average<-subset(zip.average,select=c("city","state","latitude","longitude"))

data.x$city<-data.x$fl_city

data.x<- merge(data.x, zip.average,by=c("city","state"),all.x=TRUE,all.y=FALSE)


data.x$latitude[data.x$city=="Albany-Schenectady-Troy"]<- 42.791803
data.x$longitude[data.x$city=="Albany-Schenectady-Troy"]<- -73.873271

data.x$latitude[data.x$city=="Allentown-Bethlehem-Easton"]<- 40.651814
data.x$longitude[data.x$city=="Allentown-Bethlehem-Easton"]<- -75.434407

data.x$latitude[data.x$city=="Anaheim-Santa Ana-Irvine"]<-33.717471
data.x$longitude[data.x$city=="Anaheim-Santa Ana-Irvine"]<- -117.831143

data.x$latitude[data.x$city=="Atlanta-Sandy Springs-Mariett" & 
                  data.x$state=="GA"]<- 33.896786
data.x$longitude[data.x$city=="Atlanta-Sandy Springs-Mariett" & 
                   data.x$state=="GA"]<- -84.450667

data.x$latitude[data.x$city=="Austin-Round Rock" & 
                  data.x$state=="TX"]<- 30.483571
data.x$longitude[data.x$city=="Austin-Round Rock" & 
                   data.x$state=="TX"]<- -97.736778

data.x$latitude[data.x$city=="Baltimore-Towson"]<- 39.401496
data.x$longitude[data.x$city=="Baltimore-Towson"]<- -76.601913



data.x$latitude[data.x$city=="Beaumont-Port Arthur" & 
                  data.x$state=="TX"]<- 29.950833
data.x$longitude[data.x$city=="Beaumont-Port Arthur" & 
                   data.x$state=="TX"]<- -94.020694

data.x$latitude[data.x$city=="Birmingham-Hoover" & 
                  data.x$state=="AL"]<- 33.33896
data.x$longitude[data.x$city=="Birmingham-Hoover" & 
                   data.x$state=="AL"]<- -86.851694

data.x$latitude[data.x$city=="Boise City-Nampa" & 
                  data.x$state=="ID"]<- 43.582409
data.x$longitude[data.x$city=="Boise City-Nampa" & 
                   data.x$state=="ID"]<- -116.595528


data.x$latitude[data.x$city=="Boise City-Nampa" & 
                  data.x$state=="OR"]<- 43.582409
data.x$longitude[data.x$city=="Boise City-Nampa" & 
                   data.x$state=="OR"]<- -116.595528


data.x$latitude[data.x$city=="Boston-Cambridge-Quincy"]<- 42.328448
data.x$longitude[data.x$city=="Boston-Cambridge-Quincy"]<- -71.085433

data.x$latitude[data.x$city=="Bridgeport-Stamford-Norwalk" & 
                  data.x$state=="CT"]<- 41.117744
data.x$longitude[data.x$city=="Bridgeport-Stamford-Norwalk" & 
                   data.x$state=="CT"]<- -73.408158

data.x$latitude[data.x$city=="Buffalo-Niagara Falls" & 
                  data.x$state=="NY"]<- 42.92748
data.x$longitude[data.x$city=="Buffalo-Niagara Falls" & 
                   data.x$state=="NY"]<--78.86771


data.x$latitude[data.x$city=="Burlington-South Burlington" & 
                  data.x$state=="VT"]<- 40.480314
data.x$longitude[data.x$city=="Burlington-South Burlington" & 
                   data.x$state=="VT"]<--86.394719


data.x$latitude[data.x$city=="Canton-Massillon" & 
                  data.x$state=="OH"]<- 40.818606
data.x$longitude[data.x$city=="Canton-Massillon" & 
                   data.x$state=="OH"]<--81.454875


data.x$latitude[data.x$city=="Cape Coral-Fort Myers" & 
                  data.x$state=="FL"]<- 26.558782
data.x$longitude[data.x$city=="Cape Coral-Fort Myers" & 
                   data.x$state=="FL"]<- -81.922892


data.x$latitude[data.x$city=="Champaign-Urbana" & 
                  data.x$state=="IL"]<- 40.110588
data.x$longitude[data.x$city=="Champaign-Urbana" & 
                   data.x$state=="IL"]<--88.20727


data.x$latitude[data.x$city=="Charleston" & 
                  data.x$state=="KY"]<- 37.224768
data.x$longitude[data.x$city=="Charleston" & 
                   data.x$state=="KY"]<--87.67195


data.x$latitude[data.x$city=="Charleston-North-Charleston" & 
                  data.x$state=="SC"]<- 32.85462
data.x$longitude[data.x$city=="Charleston-North-Charleston" & 
                   data.x$state=="SC"]<--79.97481


data.x$latitude[data.x$city=="Chicago-Naperville-Joliet" & 
                  data.x$state=="IL"]<- 41.525031
data.x$longitude[data.x$city=="Chicago-Naperville-Joliet" & 
                   data.x$state=="IL"]<--87.910675


data.x$latitude[data.x$city=="Chicago-Naperville-Joliet" & 
                  data.x$state=="IN"]<- 41.525031
data.x$longitude[data.x$city=="Chicago-Naperville-Joliet" & 
                   data.x$state=="IN"]<--87.910675

data.x$latitude[data.x$city=="Chattanooga" ]<- 35.04563
data.x$longitude[data.x$city=="Chattanooga" ]<--85.30968


data.x$latitude[data.x$city=="Cincinnati-Middletown" ]<- 39.449454
data.x$longitude[data.x$city=="Cincinnati-Middletown" ]<--84.372915

data.x$latitude[data.x$city=="Cleveland-Elyria-Mentor" & 
                  data.x$state=="OH"]<- 41.49932
data.x$longitude[data.x$city=="Cleveland-Elyria-Mentor" & 
                   data.x$state=="OH"]<- -81.694361

data.x$latitude[data.x$city=="Cleveland-Elyria-Mentor" & 
                  data.x$state=="NA"]<- 41.49932
data.x$longitude[data.x$city=="Cleveland-Elyria-Mentor" & 
                   data.x$state=="NA"]<- -81.694361


data.x$latitude[data.x$city=="Cleveland-Elyria-Mentor" & 
                  data.x$state=="PA"]<- 41.49932
data.x$longitude[data.x$city=="Cleveland-Elyria-Mentor" & 
                   data.x$state=="PA"]<- -81.694361


data.x$latitude[data.x$city=="Colorado Springs" & 
                  data.x$state=="NM"]<- 37.103599
data.x$longitude[data.x$city=="Colorado Springs" & 
                   data.x$state=="NM"]<- -105.493573


data.x$latitude[data.x$city=="Cumberland" & 
                  data.x$state=="WV"]<- 39.652865
data.x$longitude[data.x$city=="Cumberland" & 
                   data.x$state=="WV"]<--78.762518


data.x$latitude[data.x$city=="Dallas-Fort Worth-Arlington" & 
                  data.x$state=="TX"]<- 32.743344
data.x$longitude[data.x$city=="Dallas-Fort Worth-Arlington" & 
                   data.x$state=="TX"]<--97.026241



data.x$latitude[data.x$city=="Davenport-Moline-Rock Islan"]<- 41.519018
data.x$longitude[data.x$city=="Davenport-Moline-Rock Islan"]<--90.542196

data.x$latitude[data.x$city=="Deltona-Daytona Beach-Ormond Beach"]<- 29.285813
data.x$longitude[data.x$city=="Deltona-Daytona Beach-Ormond Beach"]<--81.055889



data.x$latitude[data.x$city=="Denver-Aurora" & 
                  data.x$state=="CO"]<- 39.729432
data.x$longitude[data.x$city=="Denver-Aurora" & 
                   data.x$state=="CO"]<--104.83192


data.x$latitude[data.x$city=="Detroit-Warren-Livonia" & 
                  data.x$state=="MI"]<- 42.341216
data.x$longitude[data.x$city=="Detroit-Warren-Livonia" & 
                   data.x$state=="MI"]<--83.282919


data.x$latitude[data.x$city=="Dover" & 
                  data.x$state=="MD"]<- 39.16586
data.x$longitude[data.x$city=="Dover" & 
                   data.x$state=="MD"]<--75.524982


data.x$latitude[data.x$city=="Elmira" & 
                  data.x$state=="IN"]<- 41.591994
data.x$longitude[data.x$city=="Elmira" & 
                   data.x$state=="IN"]<- -85.204417

data.x$latitude[data.x$city=="Elmira" & 
                  data.x$state=="PA"]<- 42.089796
data.x$longitude[data.x$city=="Elmira" & 
                   data.x$state=="PA"]<- -76.807734



data.x$latitude[data.x$city=="Erie" & 
                  data.x$state=="NY"]<- 42.129224
data.x$longitude[data.x$city=="Erie" & 
                   data.x$state=="NY"]<- -80.085059


data.x$latitude[data.x$city=="Fargo" & 
                  data.x$state=="MN"]<- 46.877186
data.x$longitude[data.x$city=="Fargo" & 
                   data.x$state=="MN"]<- -96.789803

data.x$latitude[data.x$city=="Fargo" & 
                  data.x$state=="WI"]<- 43.456463
data.x$longitude[data.x$city=="Fargo" & 
                   data.x$state=="WI"]<- -90.956169


data.x$latitude[data.x$city=="Florence" & 
                  data.x$state=="NC"]<- 34.196906
data.x$longitude[data.x$city=="Florence" & 
                   data.x$state=="NC"]<- -79.794838


data.x$latitude[data.x$city=="Ft. Wayne" & 
                  data.x$state=="IN"]<- 41.079273
data.x$longitude[data.x$city=="Ft. Wayne" & 
                   data.x$state=="IN"]<- -85.139351



data.x$latitude[data.x$city=="Gary-Hammond"]<- 41.619416
data.x$longitude[data.x$city=="Gary-Hammond"]<- -87.43782

data.x$latitude[data.x$city=="Greensboro-High Point" & 
                  data.x$state=="NC"]<- 36.027056
data.x$longitude[data.x$city=="Greensboro-High Point" & 
                   data.x$state=="NC"]<- -79.87256

data.x$latitude[data.x$city=="Greensboro-High Point" & 
                  data.x$state=="VA"]<- 36.027056
data.x$longitude[data.x$city=="Greensboro-High Point" & 
                   data.x$state=="VA"]<- -79.87256


data.x$latitude[data.x$city=="Gulfport-Biloxi"]<- 30.41338
data.x$longitude[data.x$city=="Gulfport-Biloxi"]<- -89.072958

data.x$latitude[data.x$city=="Hagerstown-Martinsburg"]<- 39.45621
data.x$longitude[data.x$city=="Hagerstown-Martinsburg"]<- -77.963887

data.x$latitude[data.x$city=="Hartford-West Hartford-East Hartford" & 
                  data.x$state=="CT"]<- 41.76154
data.x$longitude[data.x$city=="Hartford-West Hartford-East Hartford" & 
                   data.x$state=="CT"]<- -72.708783

data.x$latitude[data.x$city=="Houston-Baytown-Sugar Land" & 
                  data.x$state=="TX"]<- 29.619679
data.x$longitude[data.x$city=="Houston-Baytown-Sugar Land" & 
                   data.x$state=="TX"]<- -95.634946


data.x$latitude[data.x$city=="Kankakee-Bradley"]<- 41.141977
data.x$longitude[data.x$city=="Kankakee-Bradley"]<- -87.861154


data.x$latitude[data.x$city=="Kennewick-Richland-Pasco"]<- 46.109315
data.x$longitude[data.x$city=="Kennewick-Richland-Pasco"]<- -119.199477

data.x$latitude[data.x$city=="Lansing-E.Lansing"]<- 42.732535
data.x$longitude[data.x$city=="Lansing-E.Lansing"]<- -84.555535


data.x$latitude[data.x$city=="Las Vegas-Paradise" & 
                  data.x$state=="NV"]<- 36.097195
data.x$longitude[data.x$city=="Las Vegas-Paradise" & 
                   data.x$state=="NV"]<- -115.146665


data.x$latitude[data.x$city=="Lexington-Fayette" & 
                  data.x$state=="KY"]<- 38.040584
data.x$longitude[data.x$city=="Lexington-Fayette" & 
                   data.x$state=="KY"]<- -84.503716

data.x$latitude[data.x$city=="Little Rock-N. Little Rock" & 
                  data.x$state=="AR"]<- 34.833332
data.x$longitude[data.x$city=="Little Rock-N. Little Rock" & 
                   data.x$state=="AR"]<- -92.253891

data.x$latitude[data.x$city=="Los Angeles-Long Beach-Santa Ana" & 
                  data.x$state=="CA"]<- 33.758846
data.x$longitude[data.x$city=="Los Angeles-Long Beach-Santa Ana" & 
                   data.x$state=="CA"]<- -118.13139

data.x$latitude[data.x$city=="Louisville" & 
                  data.x$state=="IN"]<- 38.252665
data.x$longitude[data.x$city=="Louisville" & 
                   data.x$state=="IN"]<- -85.758456

data.x$latitude[data.x$city=="Manchester-Nashua"]<- 42.77995
data.x$longitude[data.x$city=="Manchester-Nashua"]<- -71.477185

data.x$latitude[data.x$city=="Memphis" & 
                  data.x$state=="AR"]<- 35.149534
data.x$longitude[data.x$city=="Memphis" & 
                   data.x$state=="AR"]<- -90.04898

data.x$latitude[data.x$city=="Memphis" & 
                  data.x$state=="MS"]<- 35.149534
data.x$longitude[data.x$city=="Memphis" & 
                   data.x$state=="MS"]<- -90.04898


data.x$latitude[data.x$city=="Miami-Fort Lauderdale-Miami Beach"]<- 25.790654
data.x$longitude[data.x$city=="Miami-Fort Lauderdale-Miami Beach" ]<- -80.130045


data.x$latitude[data.x$city=="Milwaukee-Waukesha-West Allis"]<- 43.016681
data.x$longitude[data.x$city=="Milwaukee-Waukesha-West Allis" ]<- -88.007031

data.x$latitude[data.x$city=="Minneapolis-St. Paul-Bloomington"]<- 44.971669
data.x$longitude[data.x$city=="Minneapolis-St. Paul-Bloomington" ]<- -93.280613


data.x$latitude[data.x$city=="Montgomery" & 
                  data.x$state=="GA"]<- 31.940491
data.x$longitude[data.x$city=="Montgomery" & 
                   data.x$state=="GA"]<- -81.122054

data.x$latitude[data.x$city=="Nassau-Suffolk" & 
                  data.x$state=="NY"]<- 40.865596
data.x$longitude[data.x$city=="Nassau-Suffolk" & 
                   data.x$state=="NY"]<- -73.417589

data.x$latitude[data.x$city=="Newark-Union" & 
                  data.x$state=="NJ"]<- 40.735657
data.x$longitude[data.x$city=="Newark-Union" & 
                   data.x$state=="NJ"]<- -74.172367

data.x$latitude[data.x$city=="Newark-Union" & 
                  data.x$state=="NY"]<- 40.735657
data.x$longitude[data.x$city=="Newark-Union" & 
                   data.x$state=="NY"]<- -74.172367

data.x$latitude[data.x$city=="Newark-Union" & 
                  data.x$state=="PA"]<- 40.735657
data.x$longitude[data.x$city=="Newark-Union" & 
                   data.x$state=="PA"]<- -74.172367


data.x$latitude[data.x$city=="New Haven-Milford" ]<- 41.230698
data.x$longitude[data.x$city=="New Haven-Milford" ]<- -73.064036

data.x$latitude[data.x$city=="New Orleans-Metairie-Kenner" & 
                  data.x$state=="LA"]<- 29.98453
data.x$longitude[data.x$city=="New Orleans-Metairie-Kenner" & 
                   data.x$state=="LA"]<- -90.204453

data.x$latitude[data.x$city=="New York-Northern New Jersey-Long Island" ]<- 40.753394
data.x$longitude[data.x$city=="New York-Northern New Jersey-Long Island"]<- -73.907383


data.x$latitude[data.x$city=="New York-Wayne-White Plains" ]<- 41.028405
data.x$longitude[data.x$city=="New York-Wayne-White Plains"]<- -73.785042

data.x$latitude[data.x$city=="Norwich-New London" ]<- 41.524265
data.x$longitude[data.x$city=="Norwich-New London"]<- -72.07591

data.x$latitude[data.x$city=="Omaha" & 
                  data.x$state=="IA"]<- 41.252363
data.x$longitude[data.x$city=="Omaha" & 
                   data.x$state=="IA"]<- -95.997988

data.x$latitude[data.x$city=="Palm Bay-Melbourne-Titusville" & 
                  data.x$state=="FL"]<- 28.612219
data.x$longitude[data.x$city=="Palm Bay-Melbourne-Titusville" & 
                   data.x$state=="FL"]<- -80.807554


data.x$latitude[data.x$city=="Pensacola-Ferry Pass-Brent" ]<- 30.471042
data.x$longitude[data.x$city=="Pensacola-Ferry Pass-Brent"]<- -87.231054

data.x$latitude[data.x$city=="Philadelphia-Camden-Wilmington" ]<- 39.8136
data.x$longitude[data.x$city=="Philadelphia-Camden-Wilmington"]<- -75.362366


data.x$latitude[data.x$city=="Phoenix-Mesa-Scottsdale" & 
                  data.x$state=="AZ"]<- 33.678899
data.x$longitude[data.x$city=="Phoenix-Mesa-Scottsdale" & 
                   data.x$state=="AZ"]<- -111.883544

data.x$latitude[data.x$city=="Pittsfield" & 
                  data.x$state=="NY"]<- 42.450085
data.x$longitude[data.x$city=="Pittsfield" & 
                   data.x$state=="NY"]<- -73.245382

data.x$latitude[data.x$city=="Portland-South Portland-Biddeford" & 
                  data.x$state=="ME"]<- 43.492584
data.x$longitude[data.x$city=="Portland-South Portland-Biddeford" & 
                   data.x$state=="ME"]<- -70.453384

data.x$latitude[data.x$city=="Portland-Vancouver-Beaverton" ]<- 45.487062
data.x$longitude[data.x$city=="Portland-Vancouver-Beaverton"]<- -122.80371

data.x$latitude[data.x$city=="Providence-New Bedford-Fall River" & 
                  data.x$state=="MA"]<- 41.701491
data.x$longitude[data.x$city=="Providence-New Bedford-Fall River" & 
                   data.x$state=="MA"]<- -71.155045

data.x$latitude[data.x$city=="Providence-New Bedford-Fall River" & 
                  data.x$state=="RI"]<- 41.701491
data.x$longitude[data.x$city=="Providence-New Bedford-Fall River" & 
                   data.x$state=="RI"]<- -71.155045

data.x$latitude[data.x$city=="Raleigh-Cary" & 
                  data.x$state=="NC"]<- 35.817867
data.x$longitude[data.x$city=="Raleigh-Cary" & 
                   data.x$state=="NC"]<- -78.792512

data.x$latitude[data.x$city=="Riverside-San Bernardino-Ontario" & 
                  data.x$state=="CA"]<- 34.063344
data.x$longitude[data.x$city=="Riverside-San Bernardino-Ontario" & 
                   data.x$state=="CA"]<- -117.650888

data.x$latitude[data.x$city=="Rockford" & 
                  data.x$state=="WI"]<- 42.271131
data.x$longitude[data.x$city=="Rockford" & 
                   data.x$state=="WI"]<- -89.093995

data.x$latitude[data.x$city=="Sacramento-Arden-Arcade--Roseville" & 
                  data.x$state=="CA"]<- 38.652612
data.x$longitude[data.x$city=="Sacramento-Arden-Arcade--Roseville" & 
                   data.x$state=="CA"]<- -121.389788

data.x$latitude[data.x$city=="Saint Louis" & 
                  data.x$state=="IL"]<- 38.627003
data.x$longitude[data.x$city=="Saint Louis" & 
                   data.x$state=="IL"]<- -90.199404

data.x$latitude[data.x$city=="San Diego-Carlsbad-San Marcos" & 
                  data.x$state=="CA"]<- 33.120028
data.x$longitude[data.x$city=="San Diego-Carlsbad-San Marcos" & 
                   data.x$state=="CA"]<- -117.207714

data.x$latitude[data.x$city=="San Francisco-Oakland-Fremont" & 
                  data.x$state=="CA"]<- 37.776978
data.x$longitude[data.x$city=="San Francisco-Oakland-Fremont" & 
                   data.x$state=="CA"]<- -122.231952


data.x$latitude[data.x$city=="San Jose-Sunnyvale-Santa Clara" & 
                  data.x$state=="CA"]<- 37.325315
data.x$longitude[data.x$city=="San Jose-Sunnyvale-Santa Clara" & 
                   data.x$state=="CA"]<- -122.05282

data.x$latitude[data.x$city=="Sarasota-Bradenton-Venice" & 
                  data.x$state=="FL"]<- 27.06152
data.x$longitude[data.x$city=="Sarasota-Bradenton-Venice" & 
                   data.x$state=="FL"]<- -82.406358


data.x$latitude[data.x$city=="Seattle-Tacoma-Bellevue" & 
                  data.x$state=="WA"]<- 47.610377
data.x$longitude[data.x$city=="Seattle-Tacoma-Bellevue" & 
                   data.x$state=="WA"]<- -122.200679

data.x$latitude[data.x$city=="Shreveport-Bossier City"]<- 32.525152
data.x$longitude[data.x$city=="Shreveport-Bossier City"]<- -93.750179

data.x$latitude[data.x$city=="Sioux Falls" & 
                  data.x$state=="IA"]<- 43.544596
data.x$longitude[data.x$city=="Sioux Falls" & 
                   data.x$state=="IA"]<- -96.731103

data.x$latitude[data.x$city=="South Bend-Mishawaka" ]<- 41.69152
data.x$longitude[data.x$city=="South Bend-Mishawaka" ]<- -86.228571

data.x$latitude[data.x$city=="Spartanburg" & 
                  data.x$state=="NC"]<- 34.949567
data.x$longitude[data.x$city=="Spartanburg" & 
                   data.x$state=="NC"]<- -81.932048

data.x$latitude[data.x$city=="Spokane"]<- 47.65878
data.x$longitude[data.x$city=="Spokane"]<- -117.426047

data.x$latitude[data.x$city=="Springfield" & 
                  data.x$state=="CT"]<- 42.101483
data.x$longitude[data.x$city=="Springfield" & 
                   data.x$state=="CT"]<- -72.589811

data.x$latitude[data.x$city=="Tallahassee" & 
                  data.x$state=="AL"]<- 30.438256
data.x$longitude[data.x$city=="Tallahassee" & 
                   data.x$state=="AL"]<- -84.280733

data.x$latitude[data.x$city=="Tallahassee" & 
                  data.x$state=="GA"]<- 30.438256
data.x$longitude[data.x$city=="Tallahassee" & 
                   data.x$state=="GA"]<- -84.280733

data.x$latitude[data.x$city=="Tampa-St. Petersburg-Clearwater" & 
                  data.x$state=="FL"]<- 28.036547
data.x$longitude[data.x$city=="Tampa-St. Petersburg-Clearwater" & 
                   data.x$state=="FL"]<- -82.681172

data.x$latitude[data.x$city=="Toledo" & 
                  data.x$state=="MI"]<- 41.663938
data.x$longitude[data.x$city=="Toledo" & 
                   data.x$state=="MI"]<- -83.555212

data.x$latitude[data.x$city=="Trenton-Ewing" & 
                  data.x$state=="NJ"]<- 40.257778
data.x$longitude[data.x$city=="Trenton-Ewing" & 
                   data.x$state=="NJ"]<- -74.815278


data.x$latitude[data.x$city=="Trenton-Ewing" & 
                  data.x$state=="PA"]<- 40.257778
data.x$longitude[data.x$city=="Trenton-Ewing" & 
                   data.x$state=="PA"]<- -74.815278


data.x$latitude[data.x$city=="Virginia Beach-Norfolk-Newport News"]<- 36.862134
data.x$longitude[data.x$city=="Virginia Beach-Norfolk-Newport News"]<- -76.302123

data.x$latitude[data.x$city=="Washington-Arlington-Alexandria" & 
                  data.x$state=="DE"]<- 38.866002
data.x$longitude[data.x$city=="Washington-Arlington-Alexandria" & 
                   data.x$state=="DE"]<- -77.073415

data.x$latitude[data.x$city=="Washington-Arlington-Alexandria" & 
                  data.x$state=="MD"]<- 38.866002
data.x$longitude[data.x$city=="Washington-Arlington-Alexandria" & 
                   data.x$state=="MD"]<- -77.073415

data.x$latitude[data.x$city=="Washington-Arlington-Alexandria" & 
                  data.x$state=="PA"]<- 38.866002
data.x$longitude[data.x$city=="Washington-Arlington-Alexandria" & 
                   data.x$state=="PA"]<- -77.073415

data.x$latitude[data.x$city=="Washington-Arlington-Alexandria" & 
                  data.x$state=="VA"]<- 38.866002
data.x$longitude[data.x$city=="Washington-Arlington-Alexandria" & 
                   data.x$state=="VA"]<- -77.073415

data.x$latitude[data.x$city=="Washington-Arlington-Alexandria" & 
                  data.x$state=="WASHINGTON D.C."]<- 38.866002
data.x$longitude[data.x$city=="Washington-Arlington-Alexandria" & 
                   data.x$state=="WASHINGTON D.C."]<- -77.073415


data.x$latitude[data.x$city=="Waterloo-Cedar Falls" & 
                  data.x$state=="IA"]<- 42.520394
data.x$longitude[data.x$city=="Waterloo-Cedar Falls" & 
                   data.x$state=="IA"]<- -92.435371

data.x$latitude[data.x$city=="York-Hanover" & 
                  data.x$state=="PA"]<- 39.800655
data.x$longitude[data.x$city=="York-Hanover" & 
                   data.x$state=="PA"]<- -76.983036

data.x$latitude[data.x$city=="Youngstown-Warren-Boardman" & 
                  data.x$state=="OH"]<- 41.079933
data.x$longitude[data.x$city=="Youngstown-Warren-Boardman" & 
                   data.x$state=="OH"]<- -80.66321

data.x$latitude[data.x$city=="Youngstown-Warren-Boardman" & 
                  data.x$state=="PA"]<- 41.079933
data.x$longitude[data.x$city=="Youngstown-Warren-Boardman" & 
                   data.x$state=="PA"]<- -80.66321

