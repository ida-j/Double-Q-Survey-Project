rm(list=ls())
library(foreign)
load("~/Dropbox/Double Q Survey Replication/Data/R/panel_double_q_u.RData")

############ truncation filter #################
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/truncation filter.R")
#outputs file called "data"

############ time invariant variables #################
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/prepare time invariant variables.R")
# remove 1 respondent from Puerto Rico
data<-data[data$state!="PUERTO RICO",]

############ save individual level data #################
setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(data,file = "panel_ind.csv")
setwd("~/Dropbox/Double Q Survey Replication/Data/Stata/")
write.dta(data, file="panel_ind.dta") 
setwd("~/Dropbox/Double Q Survey Replication/Data/R/")
save(data,file = "panel_ind.RData")

############## HOMEOWNER PANEL ############################################
panel.h<-data[!is.na(data$homeowner),]
f <- function(x) c( mu=mean(x), var=var(x) )

#female
x<-do.call( "rbind", tapply( panel.h$homeowner, panel.h$prim_key, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
rm1<-unique(x$id[x$var>0 & x$mu>1/3 & x$mu<2/3])
ones<-unique(x$id[x$var>0 & x$mu>=2/3])
zeros<-unique(x$id[x$var>0 & x$mu<=1/3])

panel.h$homeowner[panel.h$prim_key %in% ones]<-1
panel.h$homeowner[panel.h$prim_key %in% zeros]<-0
panel.h<-panel.h[!panel.h$prim_key %in% rm1,]
setwd("~/Dropbox/Double Q Survey Replication/Data/Stata/")
write.dta(panel.h, file="panel_ind_h.dta") 

h.fete<-panel.h
h.fete<-transform(h.fete,id=match(prim_key,unique(prim_key))) # add id
h.fete<-transform(h.fete,t=match(period,unique(period))) # add t
h.fete.mlab<-subset(h.fete,select = c("id","t","v.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                 "v.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                 "v.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new","homeowner"))

rownames(h.fete.mlab)<-NULL
h.fete.mlab<-h.fete.mlab[order(h.fete.mlab$t,h.fete.mlab$id),]
setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(h.fete.mlab, file="panel_wk_h.csv")

######## fete homeowner panel
#########################################################################
######     PREPARE DATA FOR MATLAB ESTIMATION
#########################################################################
# add response patterns
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/response patterns.R")
data2<-merge(data,resp,by="prim_key")

# add id and t variables
data2<-transform(data2,id=match(prim_key,unique(prim_key))) # add id
data2<-transform(data2,t=match(period,unique(period))) # add t

# choose variables for Wansbeek-Kapteyn transformation
data.wk<-subset(data2,select = c("id","t","v.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                "v.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                "v.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new"))
# choose variables for Wansbeek-Kapteyn transofrmation with interacted dummies
data.wk.for.int<-subset(data2,select = c("id","t","v.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                         "v.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                         "v.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new","female","asian","hispaniclatino","black"))
data.wk.for.int$male<- 1-data.wk.for.int$female
data.wk.for.int$nonhispaniclatino<-1-data.wk.for.int$hispaniclatino
data.wk.for.int$nonblack<-1-data.wk.for.int$black
data.wk.for.int$nonasian<-1-data.wk.for.int$asian
# female vs male
data.wk.for.int$v.e.f<-data.wk.for.int$v.e*data.wk.for.int$female
data.wk.for.int$v.g.f<-data.wk.for.int$v.g*data.wk.for.int$female
data.wk.for.int$v.h.f<-data.wk.for.int$v.h*data.wk.for.int$female
data.wk.for.int$v.e.m<-data.wk.for.int$v.e*data.wk.for.int$male
data.wk.for.int$v.g.m<-data.wk.for.int$v.g*data.wk.for.int$male
data.wk.for.int$v.h.m<-data.wk.for.int$v.h*data.wk.for.int$male
# asian vs nonasian
data.wk.for.int$v.e.asian<-data.wk.for.int$v.e*data.wk.for.int$asian
data.wk.for.int$v.g.asian<-data.wk.for.int$v.g*data.wk.for.int$asian
data.wk.for.int$v.h.asian<-data.wk.for.int$v.h*data.wk.for.int$asian
data.wk.for.int$v.e.nasian<-data.wk.for.int$v.e*data.wk.for.int$nonasian
data.wk.for.int$v.g.nasian<-data.wk.for.int$v.g*data.wk.for.int$nonasian
data.wk.for.int$v.h.nasian<-data.wk.for.int$v.h*data.wk.for.int$nonasian
# hispaniclatino vs nonhispaniclatino
data.wk.for.int$v.e.hispaniclatino<-data.wk.for.int$v.e*data.wk.for.int$hispaniclatino
data.wk.for.int$v.g.hispaniclatino<-data.wk.for.int$v.g*data.wk.for.int$hispaniclatino
data.wk.for.int$v.h.hispaniclatino<-data.wk.for.int$v.h*data.wk.for.int$hispaniclatino
data.wk.for.int$v.e.nhispaniclatino<-data.wk.for.int$v.e*data.wk.for.int$nonhispaniclatino
data.wk.for.int$v.g.nhispaniclatino<-data.wk.for.int$v.g*data.wk.for.int$nonhispaniclatino
data.wk.for.int$v.h.nhispaniclatino<-data.wk.for.int$v.h*data.wk.for.int$nonhispaniclatino
# black vs nonblack
data.wk.for.int$v.e.black<-data.wk.for.int$v.e*data.wk.for.int$black
data.wk.for.int$v.g.black<-data.wk.for.int$v.g*data.wk.for.int$black
data.wk.for.int$v.h.black<-data.wk.for.int$v.h*data.wk.for.int$black
data.wk.for.int$v.e.nblack<-data.wk.for.int$v.e*data.wk.for.int$nonblack
data.wk.for.int$v.g.nblack<-data.wk.for.int$v.g*data.wk.for.int$nonblack
data.wk.for.int$v.h.nblack<-data.wk.for.int$v.h*data.wk.for.int$nonblack

data.wk.int<-subset(data.wk.for.int,select = c("id","t","v.e.f","v.e.m","v.e.asian","v.e.nasian","v.e.hispaniclatino",
                                               "v.e.nhispaniclatino","v.e.black","v.e.nblack",
                                               "pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                               "v.g.f","v.g.m","v.g.asian","v.g.nasian","v.g.hispaniclatino",
                                               "v.g.nhispaniclatino","v.g.black","v.g.nblack",
                                               "pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                               "v.h.f","v.h.m","v.h.asian","v.h.nasian","v.h.hispaniclatino",
                                               "v.h.nhispaniclatino","v.h.black","v.h.nblack",
                                               "pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new"))

# choose variables for estiamtion with Fixed Effects Filtered
data.fef<-subset(data2,select = c("id","t","v.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                    "v.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                    "v.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new",
                                    "av_age","av_inc","female","asian","black","hispaniclatino",
                                    "av_ed"))

# choose variables for estimation with MSA fixed effects
data.fef.loc<-subset(data2,select = c("id","t","v.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                        "v.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                        "v.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new",
                                        "av_age","av_inc","female","asian","black","hispaniclatino",
                                        "av_ed","msa"))

# choose variables for estimation with Fixed Effects - Time Effects
data.fetef<-subset(data2,select = c("id","t","v.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                      "v.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                      "v.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new",
                                      "av_age","av_inc","female","asian","black","hispaniclatino",
                                                                          "av_ed","s"))


# add MSA dummies to FEF
for(level in unique(data.fef.loc$msa)){
  data.fef.loc[paste("dummy", level, sep = "_")] <- ifelse(data.fef.loc$msa == level, 1, 0)
}
data.fef.loc$dummy_<-NULL
data.fef.loc$msa[data.fef.loc$id==906]<-"New York-Newark-Jersey City, NY-NJ-PA"
data.fef.loc$msa[data.fef.loc$id==2377]<-"Greensboro-High Point, NC"

# add response pattern dummies to FETEF
data.fetef<-data.fetef[order(data.fetef$s),]
for(level in unique(data.fetef$s)){
  data.fetef[paste("dummy", level, sep = "_")] <- ifelse(data.fetef$s == level, 1, 0)
}
data.fetef$s<-NULL
data.fetef$dummy_943<-NULL

####################################################################################
############################ Wansbeek-Kapteyn Transformation
####################################################################################
rownames(data.wk)<-NULL
data.wk<-data.wk[order(data.wk$t,data.wk$id),]
setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(data.wk, file="panel_wk.csv")

rownames(data.wk.int)<-NULL
data.wk.int<-data.wk.int[order(data.wk.int$t,data.wk.int$id),]
setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(data.wk.int, file="panel_wk_int.csv")

# run the file ~/Dropbox/Double Q Survey Replication/Create Data Sets/MATLAB/WK_transformation.m
# which generates the output file 
# ~/Dropbox/Double Q Survey Replication/Data/csv/WK_transformed.csv
# manually add column names to the file, the column names are provided in the file
# ~/Dropbox/Double Q Survey Replication/Data/csv/WK_colnames.csv
# then run the lines below
# Note that the code below outputs a file called "panel_fetef_new.csv". 
# Given the time-consuming nature of the WK transformation, I have provided the original file
# "panel_fetef.csv", which is called by the program running the FE-TE Filtered estimation
# The code below is provided in order to show how to replicate the WK procedure.

# data.fetef<-data.fetef[order(data.fetef$t,data.fetef$id),]
# wk.data<-read.csv('~/Dropbox/Double Q Survey Replication/Data/csv/WK_transformed_with_colnames.csv')
# wk.data<-wk.data[order(wk.data$t,wk.data$id),]
# wk.data$id1<-wk.data$id
# wk.data$t1<-wk.data$t
# transformed<-subset(wk.data,select = c("id1","t1","vet" ,  "eq1mt", "eq3mt" ,"eq1yt" ,"vgt" ,  "gd1mt", "gd3mt" ,
#                                        "gd1yt" ,"vht" ,  "hs1mt", "hs3mt" ,"hs1yt",
#                                        "ve" ,  "eq1m", "eq3m" ,"eq1y" ,"vg" ,  "gd1m", "gd3m" ,
#                                        "gd1y" ,"vh" ,  "hs1m", "hs3m" ,"hs1y"))
# 
# id.vars<-subset(data.fetef,select = c("id","t"))
# z.vars<-data.fetef[,15:ncol(data.fetef)]
# data.fetef<-cbind(id.vars,transformed,z.vars)
# data.fetef$id1<-NULL
# data.fetef$t1<-NULL
# data.fetef<-data.fetef[order(data.fetef$id,data.fetef$t),]
# setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
# write.csv(data.fetef, file="panel_fetef_new.csv")
# setwd("~/Dropbox/Double Q Survey Replication/Data/Stata/")
# write.dta(data.fetef,file = "panel_fetef_new.dta")

##### prepare WK data with interaction dummies
wk.data.int<-read.csv('~/Dropbox/Double Q Survey Replication/Data/csv/WK_transformed_int_w_colnames.csv')

setwd("~/Dropbox/Double Q Survey Replication/Data/Stata/")
write.dta(wk.data.int,file = "panel_wk_int_no_z.dta")

#### add MSA dummies to FE-TE filtered data
data.fetef.for.msa<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/panel_fetef.csv")
data.fetef.for.msa$X<-NULL
msa.loc<-subset(data2,select = c("id","t","msa"))
data.fetef.msa<-merge(data.fetef.for.msa,msa.loc,by=c("id","t"))
# add MSA dummies
for(level in unique(data.fetef.msa$msa)){
  data.fetef.msa[paste("dummy", level, sep = "_")] <- ifelse(data.fetef.msa$msa == level, 1, 0)
}
data.fetef.msa$dummy_<-NULL
data.fetef.msa$msa[data.fetef.msa$id==906]<-"New York-Newark-Jersey City, NY-NJ-PA"
data.fetef.msa$msa[data.fetef.msa$id==2377]<-"Greensboro-High Point, NC"
data.fetef.msa$msa<-NULL
rownames(data.fetef.msa)<-NULL
data.fetef.msa<-data.fetef.msa[order(data.fetef.msa$id,data.fetef.msa$t),]

setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(data.fetef.msa, file="panel_fetef_w_msa.csv")
####################################################################################
############################ FE Filtered
####################################################################################

data.fef<-data.fef[order(data.fef$id,data.fef$t),]
setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(data.fef, file="panel_fef.csv")


# FEF with location (MSA dummies)
rownames(data.fef.loc)<-NULL
data.fef.loc<-data.fef.loc[order(data.fef.loc$id,data.fef.loc$t),]
data.fef<-data.fef[order(data.fef$id,data.fef$t),]


setwd("~/Dropbox/Double Q Survey Replication/Data/Stata/")

write.dta(data.fef.loc, file="panel_fef_loc.dta")

setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
data.fef.loc$msa<-NULL
write.csv(data.fef.loc, file="panel_fef_loc.csv")


# FEF with homeowner and MSA dummies
data.fef.loc.h<-subset(data2,select = c("id","t","v.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
                                      "v.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
                                      "v.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new",
                                      "av_age","av_inc","female","asian","black","hispaniclatino",
                                      "av_ed","homeowner","msa"))
data.fef.loc.h<-data.fef.loc.h[!is.na(data.fef.loc.h$homeowner),]

f <- function(x) c( mu=mean(x), var=var(x) )

#make homeowner time invariant
x<-do.call( "rbind", tapply( data.fef.loc.h$homeowner, data.fef.loc.h$id, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
rm1<-unique(x$id[x$var>0 & x$mu>1/3 & x$mu<2/3])
ones<-unique(x$id[x$var>0 & x$mu>=2/3])
zeros<-unique(x$id[x$var>0 & x$mu<=1/3])

data.fef.loc.h$homeowner[data.fef.loc.h$id %in% ones]<-1
data.fef.loc.h$homeowner[data.fef.loc.h$id %in% zeros]<-0
data.fef.loc.h<-data.fef.loc.h[!data.fef.loc.h$id %in% rm1,]


# add MSA dummies
for(level in unique(data.fef.loc.h$msa)){
  data.fef.loc.h[paste("dummy", level, sep = "_")] <- ifelse(data.fef.loc.h$msa == level, 1, 0)
}
data.fef.loc.h$dummy_<-NULL
data.fef.loc.h$msa[data.fef.loc$id==906]<-"New York-Newark-Jersey City, NY-NJ-PA"
data.fef.loc.h$msa[data.fef.loc$id==2377]<-"Greensboro-High Point, NC"
data.fef.loc.h$msa<-NULL
rownames(data.fef.loc.h)<-NULL
setwd("~/Dropbox/Double Q Survey Replication/Data/csv/")
write.csv(data.fef.loc.h, file="panel_fef_loc_h.csv")
