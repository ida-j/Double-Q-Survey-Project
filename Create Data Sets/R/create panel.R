rm(list=ls())
library("tidyr")
library("reshape")

###### balanced function

balanced<-function(data, ID, TIME, VARS, required=c("all","shared")) {
  if(is.character(ID)) {
    ID <- match(ID, names(data))
  }
  if(is.character(TIME)) {
    TIME <- match(TIME, names(data))
  }
  if(missing(VARS)) { 
    VARS <- setdiff(1:ncol(data), c(ID,TIME))
  } else if (is.character(VARS)) {
    VARS <- match(VARS, names(data))
  }
  required <- match.arg(required)
  idf <- do.call(interaction, c(data[, ID, drop=FALSE], drop=TRUE))
  timef <- do.call(interaction, c(data[, TIME, drop=FALSE], drop=TRUE))
  complete <- complete.cases(data[, VARS])
  tbl <- table(idf[complete], timef[complete])
  if (required=="all") {
    keep <- which(rowSums(tbl==1)==ncol(tbl))
    idx <- as.numeric(idf) %in% keep
  } else if (required=="shared") {
    keep <- which(colSums(tbl==1)==nrow(tbl))
    idx <- as.numeric(timef) %in% keep
  }
  data[idx, ]
}

##########
#load msa house prices
msa.p<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/MSA prices 2007-2014.csv",head=TRUE,sep=",")
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/clean csv files.R")

# select variables
variables<-c("prim_key","period","date","region4","region8","state","city","msa","lat","long",
             "e1","e2_1month","e2_3month","e2_1year",
             "pi.e.1m.e","pi.e.3m.e","pi.e.1y.e","pi.e.1m.e.new","pi.e.3m.e.new","pi.e.1y.e.new",
             "overvalued.e","undervalued.e","v.e","b.1m.e","c.1m.e","b.3m.e","c.3m.e","b.1y.e","c.1y.e",
             "g1","g2_1month","g2_3month","g2_1year",
             "pi.e.1m.g","pi.e.3m.g","pi.e.1y.g","pi.e.1m.g.new","pi.e.3m.g.new","pi.e.1y.g.new",
             "overvalued.g","undervalued.g","v.g","b.1m.g","c.1m.g","b.3m.g","c.3m.g","b.1y.g","c.1y.g",
             "housing.price","h1","h1_alternate","h2_1month","h2_3month","h2_1year",
             "pi.e.1m.h","pi.e.3m.h","pi.e.1y.h","pi.e.1m.h.new","pi.e.3m.h.new","pi.e.1y.h.new",
             "overvalued.h","undervalued.h","v.h","b.1m.h","c.1m.h","b.3m.h","c.3m.h","b.1y.h","c.1y.h",
              "calcage","female",
             "degree","income","black","asian","hispaniclatino","white","native","highesteducation")

l1<-list(wave5,wave6,wave7,wave8,wave9,wave10,wave11,wave12,wave13,wave14,wave15)

for(i in 1:length(l1)){
  data.x<-l1[[i]]
  
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/add state and region.R")
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/add location.R")
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/add demographics.R")
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/add price exp, valuation and bubble indicators.R")
  
  number<-i+4
  assign(paste("wave", number, sep = ""),data.x)
}

# match cities to MSAs
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/match cities to MSAs.R")

l1<-list(wave5,wave6,wave7,wave8,wave9,wave10,wave11,wave12,wave13,wave14,wave15)

for(i in 1:length(l1)){
  data.x<-l1[[i]]
  data.x$lat<-data.x$latitude
  data.x$long<-data.x$longitude
  data.x<-subset(data.x,select=variables)
  number<-i+4
  assign(paste("wave", number, sep = ""),data.x)
}

panel.u<-rbind(wave5,wave6,wave7,wave8,wave9,wave10,wave11,wave12,wave13,wave14,wave15)
panel.b<-balanced(panel.u,"prim_key","period",c("date","h1"))
##### added 10 Jan 2017 ######
# merge with financial crisis survey
load("~/Dropbox/Double Q Survey Replication/Data/R/panel_financial_double_q_period.RData")
panel.uh<-merge(panel.u,panel.h,by=c("prim_key","period"),all.x = TRUE,all.y = FALSE) # only double Q

############################################################################
panel.u<-do.call(data.frame,lapply(panel.uh, function(x) replace(x, is.infinite(x),NA)))

setwd("~/Dropbox/Double Q Survey Replication/Data/R/")
save(panel.u,file = "panel_double_q_u.RData")
