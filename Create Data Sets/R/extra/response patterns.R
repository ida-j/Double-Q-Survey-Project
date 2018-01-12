d<-subset(data,select = c("prim_key","period"))


periods<-unique(d$period)
periods<-c("Y12M04", "Y12M05", "Y12M06" ,"Y12M07" ,"Y12M08", "Y12M09", "Y12M10" ,"Y12M11" ,"Y12M12", "Y13M01" ,"Y13M02")
f <- function(x) c( obs<-periods %in% x)

x<-as.data.frame(1*do.call( "rbind", tapply( d$period, d$prim_key, f ) ))
library(plyr)
counts<-count(x,vars = colnames(x))

#counts<-rename(counts, c("V1"="Y12M04", "V2"="Y12M05", "V3"="Y12M06" ,"V4"="Y12M07" ,"V5"="Y12M08", "V6"="Y12M09", "V7"="Y12M10" ,"V8"="Y12M11" ,
                # "V9"="Y12M12", "V10"="Y13M01" ,"V11"="Y13M02"))
counts<-counts[order(-counts$freq),]
counts$s<-c(1:1:(nrow(counts)))

rownames(counts)=NULL
#setwd("/Users/manguito/Dropbox/Double Survey Q Project (2)/econometric analysis ida 2016/tex/summary_statistics/")
#write.csv(counts,file = "participation.csv")


x$prim_key<-rownames(x)

resp.data<-merge(x, counts, by=c("V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11"))
rownames(resp.data)=NULL

resp<-subset(resp.data,select=c("prim_key","s","freq"))
