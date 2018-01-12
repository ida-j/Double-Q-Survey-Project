data<-panel.u
length(which(is.na(data$e2_1month)))

# equity prices
data$keep.e<-"TRUE"
data$keep.e[data$e2_1month>4000|data$e2_3month>4000|data$e2_1year>4000]<-"FALSE"
data$keep.e[data$e2_1month>2000 & data$e2_3month>2000 & data$e2_1year>2000]<-"FALSE"
data$keep.e[data$e2_1month<100 & data$e2_3month<100 & data$e2_1year<100]<-"FALSE"

for(col in c("e2_1month","e2_3month","e2_1year","pi.e.1m.e","pi.e.3m.e","pi.e.1y.e","b.1m.e","c.1m.e","b.3m.e","c.3m.e","b.1y.e","c.1y.e")){
  data[[col]][data$keep.e=="FALSE"]<-"TR"
}
# test<-subset(data,select=c("keep.e","e2_1month","e2_3month","e2_1year","b.1m.e","c.1m.e","b.3m.e","c.3m.e","b.1y.e","c.1y.e"))
# View(test)
# length(which(data$e2_1month=="TR"))
# table(data$keep.e)

# gold prices
data$keep.g<-"TRUE"
data$keep.g[data$g2_1month>4000|data$g2_3month>4000|data$g2_1year>4000]<-"FALSE"
data$keep.g[data$g2_1month>2000 & data$g2_3month>2000 & data$g2_1year>2000]<-"FALSE"
data$keep.g[data$g2_1month<100 & data$g2_3month<100 & data$g2_1year<100]<-"FALSE"

for(col in c("g2_1month","g2_3month","g2_1year","pi.e.1m.g","pi.e.3m.g","pi.e.1y.g","b.1m.g","c.1m.g","b.3m.g","c.3m.g","b.1y.g","c.1y.g")){
  data[[col]][data$keep.g=="FALSE"]<-"TR"
}


# house prices
data$keep.h<-"TRUE"
data$keep2.h<-"TRUE" # less restrictive
data$keep.h[data$h2_1month>2*data$housing.price|data$h2_1month<0.5*data$housing.price|
              data$h2_3month>2*data$housing.price|data$h2_3month<0.5*data$housing.price|
              data$h2_1year>2*data$housing.price|data$h2_1year<0.5*data$housing.price]<-"FALSE"
data$keep2.h[data$h2_1month>2*data$housing.price & data$h2_3month>2*data$housing.price & data$h2_1year>2*data$housing.price]<-"FALSE"
data$keep2.h[data$h2_1month<0.5*data$housing.price & data$h2_3month<0.5*data$housing.price & data$h2_1year<0.5*data$housing.price]<-"FALSE"


for(col in c("h2_1month","h2_3month","h2_1year","pi.e.1m.h","pi.e.3m.h","pi.e.1y.h","b.1m.h","c.1m.h","b.3m.h","c.3m.h","b.1y.h","c.1y.h")){
  data[[col]][data$keep.h=="FALSE"]<-"TR"
  
}


### truncation statistics -----------

# house prices
n<-length(which(!is.na(data$h2_1month)))
na<-length(which(is.na(data$h2_1month)))
na2<-length(which(is.na(data$h2_1month)))
n.tr1<-length(which(data$h2_1month=="TR"))-(na-na2)
c1<-c(n,n.tr1,n.tr1/n*100)

n<-length(which(!is.na(data$h2_3month)))
na<-length(which(is.na(data$h2_3month)))
na2<-length(which(is.na(data$h2_3month)))
n.tr3<-length(which(data$h2_3month=="TR"))-(na-na2)
c2<-c(n,n.tr1,n.tr1/n*100)

n<-length(which(!is.na(data$h2_1year)))
na<-length(which(is.na(data$h2_1year)))
na2<-length(which(is.na(data$h2_1year)))
n.tr12<-length(which(data$h2_1year=="TR"))-(na-na2)
c3<-c(n,n.tr1,n.tr1/n*100)

house.tr<-rbind(c1,c2,c3)

# equity prices
n<-length(which(!is.na(data$e2_1month)))
na<-length(which(is.na(data$e2_1month)))
na2<-length(which(is.na(data$e2_1month)))
n.tr1<-length(which(data$e2_1month=="TR"))-(na-na2)
c1<-c(n,n.tr1,n.tr1/n*100)

n<-length(which(!is.na(data$e2_3month)))
na<-length(which(is.na(data$e2_3month)))
na2<-length(which(is.na(data$e2_3month)))
n.tr3<-length(which(data$e2_3month=="TR"))-(na-na2)
c2<-c(n,n.tr1,n.tr1/n*100)

n<-length(which(!is.na(data$e2_1year)))
na<-length(which(is.na(data$e2_1year)))
na2<-length(which(is.na(data$e2_1year)))
n.tr12<-length(which(data$e2_1year=="TR"))-(na-na2)
c3<-c(n,n.tr1,n.tr1/n*100)

equity.tr<-rbind(c1,c2,c3)


# gold prices
n<-length(which(!is.na(data$g2_1month)))
na<-length(which(is.na(data$g2_1month)))
na2<-length(which(is.na(data$g2_1month)))
n.tr1<-length(which(data$g2_1month=="TR"))-(na-na2)
c1<-c(n,n.tr1,n.tr1/n*100)

n<-length(which(!is.na(data$g2_3month)))
na<-length(which(is.na(data$g2_3month)))
na2<-length(which(is.na(data$g2_3month)))
n.tr3<-length(which(data$g2_3month=="TR"))-(na-na2)
c2<-c(n,n.tr1,n.tr1/n*100)

n<-length(which(!is.na(data$g2_1year)))
na<-length(which(is.na(data$g2_1year)))
na2<-length(which(is.na(data$g2_1year)))
n.tr12<-length(which(data$g2_1year=="TR"))-(na-na2)
c3<-c(n,n.tr1,n.tr1/n*100)

gold.tr<-rbind(c1,c2,c3)

tr<-rbind(equity.tr,gold.tr,house.tr)


######## -----------

for(col in c("e2_1month","e2_3month","e2_1year","pi.e.1m.e","pi.e.3m.e","pi.e.1y.e","b.1m.e","c.1m.e","b.3m.e","c.3m.e","b.1y.e","c.1y.e",
             "g2_1month","g2_3month","g2_1year","pi.e.1m.g","pi.e.3m.g","pi.e.1y.g","b.1m.g","c.1m.g","b.3m.g","c.3m.g","b.1y.g","c.1y.g",
             "h2_1month","h2_3month","h2_1year","pi.e.1m.h","pi.e.3m.h","pi.e.1y.h","b.1m.h","c.1m.h","b.3m.h","c.3m.h","b.1y.h","c.1y.h")){
  data[[col]][data[[col]]=="TR"]<-NA
  data[[col]]<-as.numeric(data[[col]])
}


for(col in c("msa","v.e","e2_1month","e2_3month","e2_1year","pi.e.1m.e","pi.e.3m.e","pi.e.1y.e","b.1m.e","c.1m.e","b.3m.e","c.3m.e","b.1y.e","c.1y.e",
             "v.g","g2_1month","g2_3month","g2_1year","pi.e.1m.g","pi.e.3m.g","pi.e.1y.g","b.1m.g","c.1m.g","b.3m.g","c.3m.g","b.1y.g","c.1y.g",
             "v.h","h2_1month","h2_3month","h2_1year","pi.e.1m.h","pi.e.3m.h","pi.e.1y.h","b.1m.h","c.1m.h","b.3m.h","c.3m.h","b.1y.h","c.1y.h")){
  data<-data[!is.na(data[[col]]),]
}


#use these lines to replicate 2015 results, comment out
#source("/Users/manguito/Dropbox/Double Survey Q Project (2)/econometric analysis ida 2016/R/extra/prepare time invariant variables.R")
# in prepare individual panel and MSA 
# and use
#source("~/Dropbox/Double Survey Q Project (2)/econometric analysis ida 2016/R/extra/delete obs with different house price same city.R")
# in prepare panel.R

# use the following lines instead of the for-loop above
# for(col in c("e2_1month","e2_3month","v.e",
#              "g2_1month","g2_3month","g2_1year","v.g",
#              "h2_1month","h2_3month","v.h")){
#   data<-data[!is.na(data[[col]]),]
# }