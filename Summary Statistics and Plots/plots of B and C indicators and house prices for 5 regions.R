rm(list=ls())
library(ggplot2)
library(reshape2)
setwd("/Users/manguito/Downloads/")

hp<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/monthly house prices by state.csv")

hp$NorthEast<-rowMeans(subset(hp,select = c("CT","ME","MA","NH","NJ","NY","PA","RI","VT")))
hp$SouthEast<-rowMeans(subset(hp,select = c("AL","AR","DE","DC","FL","GA","KY","LA",'MD','MS','NC','SC','TN','VA','WV')))
hp$MidWest<-rowMeans(subset(hp,select = c("IL",'IN','IA','KS','MI','MN','MO','NE','ND','OH',"SD",'WI')))
hp$SouthWest<-rowMeans(subset(hp,select = c("AZ",'NM','OK','TX')))
hp$West<-rowMeans(subset(hp,select = c("CA",'CO','ID','MT','NV','OR','UT','WA','WY')))

regions<-subset(hp,select = c("Month","NorthEast","SouthEast","MidWest","SouthWest","West"))

logp<-log(subset(regions,select=c("NorthEast","SouthEast","MidWest","SouthWest","West")))
diffp<-tail(logp,-1) - head(logp, -1)
diffp$Month<-tail(regions$Month,-1)
diffp$US<-rowMeans(subset(diffp,select=c("NorthEast","SouthEast","MidWest","SouthWest","West")))

diffp<-transform(diffp,t=match(Month,unique(Month))) 
diffp<-diffp[diffp$t>447,]
#diffp<-diffp[diffp$t>446 & diffp$t<458,]
diffp$t<-NULL
diffp<-diffp[c('Month',"NorthEast",'SouthEast','MidWest','SouthWest','West','US')]
rm(regions, logp)

# m<-melt(diffp, id='Month')
# 
# setwd("/Users/manguito/Downloads/")
# 
# png("price_change_by_region.png", width=10, height=6, units="in", res=300)
# 
# print(ggplot(m, aes(x=Month, y=value, group=variable,color=variable,linetype=variable)) +
#         geom_line(lwd=.7)+ylab('% change in house price index compared to previous month')+
#         scale_color_manual("",values=c("red","black","blue","green","magenta","pink"),
#                            labels=c("NorthEast","SouthEast","MidWest","SouthWest","West","US"))+
#         scale_linetype_manual("", values =c("dotted", "dashed", "longdash", "dotdash", "solid", "solid"),
#                               labels=c("NorthEast","SouthEast","MidWest","SouthWest","West","US"))) 
# dev.off()

###### B and C indicators
# note that this uses the new definition of B and C indicators
load("~/Dropbox/Double Q Survey Replication/Data/R/panel_ind.RData")

###### create new B and C indicators
df <-data[,!(names(data) %in% c('b.1m.e','c.1m.e','b.3m.e','c.3m.e','b.1y.e','c.1y.e',
                                'b.1m.g','c.1m.g','b.3m.g','c.3m.g','b.1y.g','c.1y.g',
                                'b.1m.h','c.1m.h','b.3m.h','c.3m.h','b.1y.h','c.1y.h')), drop=FALSE]
# bubble and crash indicators
source("~/Dropbox/Double Q Survey Replication/Create Data Sets/R/extra/add new B and C indicators.R")
# add region5
df$region5<-"Alaska or Hawaii"
df$region5[df$state %in% c("CT","ME","MA","NH","NJ","NY","PA","RI","VT")]<-"NorthEast"
df$region5[df$state %in% c("AL","AR","DE","WASHINGTON D.C.","FL","GA","KY","LA",'MD','MS','NC','SC','TN','VA','WV')]<-"SouthEast"
df$region5[df$state %in% c("IL",'IN','IA','KS','MI','MN','MO','NE','ND','OH',"SD",'WI')]<-"MidWest"
df$region5[df$state %in% c("AZ",'NM','OK','TX')]<-"SouthWest"
df$region5[df$state %in% c("CA",'CO','ID','MT','NV','OR','UT','WA','WY')]<-"West"

t0<-df[df$region5!="Alaska or Hawaii",]
t<-subset(t0, select=c('region5','period','b.1m.h','c.1m.h','b.3m.h','c.3m.h','b.1y.h','c.1y.h'))
# calculate average by region5 and period

t1<-aggregate(t,by = list(t$region5, t$period),FUN=mean)
rm(data,df,t0,t)
t1$region5<-t1$Group.1
t1$period<-t1$Group.2
t1$Group.1<-NULL
t1$Group.2<-NULL
# add average indicators
t1$b<-(t1$b.1m.h+t1$b.3m.h+t1$b.1y.h)/3
t1$c<-(t1$c.1m.h+t1$c.3m.h+t1$c.1y.h)/3
t1$bc<-t1$b-t1$c

df<-subset(t1,select = c("region5","period","bc"))
df$period<-gsub("Y","20",df$period)
d<-reshape(df, idvar = "period", timevar = "region5", direction = "wide")
d$bc.US<-(d$bc.MidWest+d$bc.NorthEast+d$bc.SouthEast+d$bc.SouthWest+d$bc.West)/5
# for (reg in unique(t1$region5)){
#   m0<-t1[t1$region5==reg,]
#   m0$region5<-NULL
#   m1<-melt(m0,id="period")
#   
#   png(paste(reg, "indicator_plots.png",sep = "_"), width=8, height=6, units="in", res=300)
#   
#   print(ggplot(data=m1, aes(x=period, y=value, group=variable,color=variable,linetype=variable)) +
#           geom_line(lwd=.7)+xlab('April 2012 - February 2013')+ 
#           theme(axis.ticks = element_blank(), axis.text.x = element_blank())+
#           labs(title = paste("Bubble and crash indicators for region ",reg,sep = "")) +
#           scale_color_manual("",labels = c("B 1 month","C 1 month","B 3 months","C 3 months",
#                                            "B 1 year","C 1 year"),values = c("red","blue","red","blue","red","blue"))+
#           scale_linetype_manual("",labels = c("B 1 month","C 1 month","B 3 months","C 3 months",
#                                               "B 1 year","C 1 year"),
#                                 values=c("solid", "solid","dashed","dashed", "dotted","dotted"))) 
#   dev.off()
#   
#   
# }

df<-subset(t1,select=c("region5","period","b","c"))
df.us<-aggregate(cbind(b,c) ~ period, data=df, mean)
df.us$region5<-"US"
df.us<-df.us[c("region5","period","b","c")]
df<-rbind(df,df.us)

rm(df.us)
# 
# for (reg in unique(df$region5)){
#   m0<-df[df$region5==reg,]
#   m0$region5<-NULL
#   m1<-melt(m0,id="period")
#   
#   png(paste(reg, "indicator_plots_averages.png",sep = "_"), width=8, height=6, units="in", res=300)
#   
#   print(ggplot(data=m1, aes(x=period, y=value, group=variable,color=variable,linetype=variable)) +
#           geom_line(lwd=.7)+xlab('April 2012 - February 2013')+ 
#           theme(axis.ticks = element_blank(), axis.text.x = element_blank())+
#           labs(title = paste(reg,": Average bubble and crash indicators",sep = "")) +
#           scale_color_manual("",labels = c("B","C"),values = c("red","blue"))+
#           scale_linetype_manual("",labels = c("B","C"),
#                                 values=c("solid", "dashed"))) 
#   dev.off()
#   
#   
# }

df$bc<-df$b-df$c

# for (reg in unique(df$region5)){
#   m1<-df[df$region5==reg,]
#   png(paste(reg, "indicator_plots_bc.png",sep = "_"), width=8, height=6, units="in", res=300)
#   
#   print(ggplot(m1, aes(x=period,y=bc,group=1)) +
#           geom_line(lwd=.7)+xlab('April 2012 - February 2013')+ 
#           theme(axis.ticks = element_blank(), axis.text.x = element_blank())+
#           labs(title = paste(reg,": Difference of average B and C indicators",sep = ""))+
#           ylab("B-C")) 
#   dev.off()
#   
#   
# }
m<-melt(diffp,id="Month")
names(m)[names(m)=='value']<-'logp'
names(m)[names(m)=='variable']<-'region5'
names(m)[names(m)=='Month']<-'period'
m$period<- gsub('20','Y', m$Month)


df$region5<-as.factor(paste(df$region5))
merged<-merge(m,df,by=c('period','region5'))
merged<-transform(merged,t=match(Month,unique(Month)))

sub<-merged[merged$region5=="West",]

minbc<-min(sub$bc)
maxbc<-max(sub$bc)

with(sub, plot(t, bc, type="l", col="red3",cex=2, 
             ylab=expression(B-C),
             ylim=c(minbc,maxbc),xaxt='n',xlab='April 2012-February 2013'))
par(new = T)
with(sub, plot(t, logp, type='l', axes=F, xlab=NA, ylab=NA, cex=1.2))
axis(side = 4)
mtext(side = 4, line = 3, '% change in house prices compared to previous month')
#par(xpd=TRUE)
legend("bottomleft", 
       legend=c('BC', 'delta'),
       lty=c(1,1), col=c("red3", "black"),cex=0.3)

