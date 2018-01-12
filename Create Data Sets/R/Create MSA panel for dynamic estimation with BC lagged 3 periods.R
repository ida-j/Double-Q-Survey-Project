rm(list=ls())
load("~/Dropbox/Double Q Survey Replication/Data/R/panel_ind.RData")

###### create new B and C indicators
df <-data[,!(names(data) %in% c('b.1m.e','c.1m.e','b.3m.e','c.3m.e','b.1y.e','c.1y.e',
                                'b.1m.g','c.1m.g','b.3m.g','c.3m.g','b.1y.g','c.1y.g',
                                'b.1m.h','c.1m.h','b.3m.h','c.3m.h','b.1y.h','c.1y.h')), drop=FALSE]
# bubble and crash indicators

source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/add new B and C indicators.R")

#source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/summary stats for new B and C indicators.R")

# add region5
df$region5<-"Alaska or Hawaii"
df$region5[df$state %in% c("CT","ME","MA","NH","NJ","NY","PA","RI","VT")]<-"NorthEast"
df$region5[df$state %in% c("AL","AR","DE","WASHINGTON D.C.","FL","GA","KY","LA",'MD','MS','NC','SC','TN','VA','WV')]<-"SouthEast"
df$region5[df$state %in% c("IL",'IN','IA','KS','MI','MN','MO','NE','ND','OH',"SD",'WI')]<-"MidWest"
df$region5[df$state %in% c("AZ",'NM','OK','TX')]<-"SouthWest"
df$region5[df$state %in% c("CA",'CO','ID','MT','NV','OR','UT','WA','WY')]<-"West"


################################################################################
######                  create MSA panel                 #######################
################################################################################




t<-as.data.frame(table(data$msa))
t<-t[t$Freq>=220,] # choose minimum number of observations per MSA
t<-t[!t$Var1=="",]

msas.keep.20<-t$Var1

panel.msa<-df[df$msa %in% msas.keep.20,]
#panel.msa<-panel.msa[!(panel.msa$msa %in% c("Youngstown-Warren-Boardman, OH-PA","Salt Lake City, UT","Raleigh, NC")),]
panel.msa$av.obs<-0
t$Freq<-t$Freq/11
for (i in msas.keep.20){
  n<-t$Freq[t$Var1==i]
  panel.msa$av.obs[panel.msa$msa==i]<-n
}


panel.msa$bubble.1m<-0
panel.msa$crash.1m<-0
panel.msa$bubble.3m<-0
panel.msa$crash.3m<-0
panel.msa$bubble.1y<-0
panel.msa$crash.1y<-0
panel.msa$pi.exp.1m<-0
panel.msa$pi.exp.3m<-0
panel.msa$pi.exp.1y<-0
panel.msa$latitude<-0
panel.msa$longitude<-0

months<-levels(panel.msa$period)
for (m in msas.keep.20){ # m loop begin
  for (month in months) {
    d.msa<-panel.msa[panel.msa$msa==m & panel.msa$period==month,]
    panel.msa$bubble.1m[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$b.1m.h,na.rm=TRUE)
    panel.msa$bubble.3m[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$b.3m.h,na.rm=TRUE)
    panel.msa$bubble.1y[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$b.1y.h,na.rm=TRUE)
    
    panel.msa$crash.1m[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$c.1m.h,na.rm=TRUE)
    panel.msa$crash.3m[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$c.3m.h,na.rm=TRUE)
    panel.msa$crash.1y[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$c.1y.h,na.rm=TRUE)
    
    panel.msa$pi.exp.1m[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$pi.e.1m.h,na.rm=TRUE)
    panel.msa$pi.exp.3m[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$pi.e.3m.h,na.rm=TRUE)
    panel.msa$pi.exp.1y[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$pi.e.1y.h,na.rm=TRUE)
    
    panel.msa$latitude[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$lat,na.rm=TRUE)
    panel.msa$longitude[panel.msa$msa==m & panel.msa$period==month]<-mean(d.msa$long,na.rm=TRUE)
    
  }}

panel.msa$wave<-as.numeric(panel.msa$period)
panel.msa$wave<-panel.msa$wave+4
variables.panel<-c("period","wave","msa","av.obs","latitude","longitude" ,"pi.exp.1m","pi.exp.3m","pi.exp.1y",
                   "bubble.1m","crash.1m", "bubble.3m","crash.3m",
                   "bubble.1y","crash.1y")


p.msa<-subset(panel.msa,select = variables.panel)
p.msa<-p.msa[order(p.msa$wave,p.msa$msa),]
p.msa<-unique(p.msa)
nmsa<-nrow(p.msa)/11 # add id variable
x<-rep(1:nmsa,11)
p.msa$id<-x

to.matlab<-subset(p.msa,select=c("wave","id","latitude","longitude" ,"bubble.1m","crash.1m", 
                                 "bubble.3m","crash.3m","bubble.1y","crash.1y"))
setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(to.matlab,file="data_for_neighbor_indicators_ALT.csv",row.names=FALSE)
### RUN MATLAB #######
spatial<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/x_spatial_ALT.csv", header = FALSE)

p.msa$bstar.1m<-spatial$V7
p.msa$cstar.1m<-spatial$V8
p.msa$bstar.3m<-spatial$V9
p.msa$cstar.3m<-spatial$V10
p.msa$bstar.1y<-spatial$V11
p.msa$cstar.1y<-spatial$V12

### add MSA prices ##############
msa.p<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/MSA prices 2007-2014.csv")
library("tidyr")
library("reshape")
msa.p$msa<-msa.p$MSA
prices<-subset(msa.p,select=c("msa","X2012M03", "X2012M04","X2012M05","X2012M06",
                              "X2012M07","X2012M08","X2012M09","X2012M10",
                              "X2012M11","X2012M12","X2013M01","X2013M02","X2013M03",
                              "X2013M04","X2013M05"))

prices<-prices[prices$msa %in% msas.keep.20==TRUE ,]
#prices<-prices[!(prices$msa %in% c("Youngstown-Warren-Boardman, OH-PA","Salt Lake City, UT","Raleigh, NC")),]

# add log price changes
prices$Y12M04 <-log(prices$X2012M04)-log(prices$X2012M03)
prices$Y12M05 <-log(prices$X2012M05)-log(prices$X2012M04)
prices$Y12M06 <-log(prices$X2012M06)-log(prices$X2012M05)
prices$Y12M07 <-log(prices$X2012M07)-log(prices$X2012M06)
prices$Y12M08 <-log(prices$X2012M08)-log(prices$X2012M07)
prices$Y12M09 <-log(prices$X2012M09)-log(prices$X2012M08)
prices$Y12M10 <-log(prices$X2012M10)-log(prices$X2012M09)
prices$Y12M11 <-log(prices$X2012M11)-log(prices$X2012M10)
prices$Y12M12 <-log(prices$X2012M12)-log(prices$X2012M11)
prices$Y13M01 <-log(prices$X2013M01)-log(prices$X2012M12)
prices$Y13M02 <-log(prices$X2013M02)-log(prices$X2013M01)
prices$Y13M03 <-log(prices$X2013M03)-log(prices$X2013M02)
prices$Y13M04 <-log(prices$X2013M04)-log(prices$X2013M03)
prices$Y13M05 <-log(prices$X2013M05)-log(prices$X2013M04)


prices<-subset(prices,select=c("msa","Y12M04","Y12M05","Y12M06","Y12M07","Y12M08",
                               "Y12M09","Y12M10","Y12M11","Y12M12","Y13M01","Y13M02","Y13M03","Y13M04","Y13M05"))

reshaped<-gather(prices,period,pi,Y12M04:Y13M05)
reshaped$pi<-300*reshaped$pi # quarterly rate of change


reshaped<-reshaped[order(reshaped$period,reshaped$msa),]
nmsa<-nrow(reshaped)/14 # add id variable
x<-rep(1:nmsa,14)
reshaped$id2<-x

merged<-merge(p.msa,reshaped,by=c("period","msa"),all=TRUE)
merged$wave[merged$period=="Y13M03"]<-16
merged$wave[merged$period=="Y13M04"]<-17
merged$wave[merged$period=="Y13M05"]<-18

merged$id<-NULL
names(merged)[names(merged)=="id2"] <- "id"

merged$bubble<-(merged$bubble.1m+merged$bubble.3m+merged$bubble.1y)/3
merged$crash<-(merged$crash.1m+merged$crash.3m+merged$crash.1y)/3
merged$bstar<-(merged$bstar.1m+merged$bstar.3m+merged$bstar.1y)/3
merged$cstar<-(merged$cstar.1m+merged$cstar.3m+merged$cstar.1y)/3

merged$bc<-merged$bubble-merged$crash
merged$bcstar<-merged$bstar-merged$cstar
merged$piexp<-(merged$pi.exp.1m+merged$pi.exp.3m+merged$pi.exp.1y)/3

library(foreign)

stata.filename<-"~/Dropbox/Double Q Survey Replication/Data/Stata/panel MSA ALT BC 3 lags.dta"
write.dta(merged, file = stata.filename)

