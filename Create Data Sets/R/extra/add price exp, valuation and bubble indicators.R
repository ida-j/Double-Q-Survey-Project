# equity prices
data.x$pi.e.1m.e<-(log(data.x$e2_1month)-log(1000))*300
data.x$pi.e.3m.e<-(log(data.x$e2_3month)-log(1000))*100
data.x$pi.e.1y.e<-(log(data.x$e2_1year)-log(1000))*25

data.x$pi.e.1m.e.new<-100*(data.x$e2_1month-1000)/(1000)
data.x$pi.e.3m.e.new<-100*(data.x$e2_3month-1000)/(3*1000)
data.x$pi.e.1y.e.new<-100*(data.x$e2_1year-1000)/(12*1000)

data.x$overvalued.e<-0
# data.x$overvalued.e[data.x$e1==2]<-1
data.x$overvalued.e[data.x$e1==1]<-1

data.x$undervalued.e<-0
# data.x$undervalued.e[data.x$e1==3]<-1
data.x$undervalued.e[data.x$e1==3]<-1

#valuation
data.x$v.e<-0
data.x$v.e[data.x$overvalued.e==1]<- 1
data.x$v.e[data.x$undervalued.e==1]<- -1

data.x$overvalued.e[is.na(data.x$e1)]<-NA
data.x$undervalued.e[is.na(data.x$e1)]<-NA
data.x$v.e[is.na(data.x$e1)]<-NA


# bubble and crash indicators
data.x$b.1m.e<-0
data.x$b.1m.e[data.x$v.e>0 & data.x$pi.e.1m.e>=0]<-1
data.x$b.1m.e[data.x$v.e==0 & data.x$pi.e.1m.e>0]<-1
data.x$c.1m.e<-0
data.x$c.1m.e[data.x$v.e<0 & data.x$pi.e.1m.e<=0]<-1
data.x$c.1m.e[data.x$v.e==0 & data.x$pi.e.1m.e<0]<-1

data.x$b.3m.e<-0
data.x$b.3m.e[data.x$v.e>0 & data.x$pi.e.3m.e>=0]<-1
data.x$b.3m.e[data.x$v.e==0 & data.x$pi.e.3m.e>0]<-1

data.x$c.3m.e<-0
data.x$c.3m.e[data.x$v.e<0 & data.x$pi.e.3m.e<=0]<-1
data.x$c.3m.e[data.x$v.e==0 & data.x$pi.e.3m.e<0]<-1


data.x$b.1y.e<-0
data.x$b.1y.e[data.x$v.e>0 & data.x$pi.e.1y.e>=0]<-1
data.x$b.1y.e[data.x$v.e==0 & data.x$pi.e.1y.e>0]<-1

data.x$c.1y.e<-0
data.x$c.1y.e[data.x$v.e<0 & data.x$pi.e.1y.e<=0]<-1
data.x$c.1y.e[data.x$v.e==0 & data.x$pi.e.1y.e<0]<-1

for (col in c("b.1m.e","c.1m.e","b.3m.e","c.3m.e","b.1y.e","c.1y.e")){
  data.x[[col]][is.na(data.x$v.e)]<-NA
}
for (col in c("b.1m.e","c.1m.e")){
  data.x[[col]][is.na(data.x$pi.e.1m.e)]<-NA
}
for (col in c("b.3m.e","c.3m.e")){
  data.x[[col]][is.na(data.x$pi.e.3m.e)]<-NA
}
for (col in c("b.1y.e","c.1y.e")){
  data.x[[col]][is.na(data.x$pi.e.1y.e)]<-NA
}

# gold prices
# expected house price changes in percent per quarter
data.x$pi.e.1m.g<-(log(data.x$g2_1month)-log(1000))*300
data.x$pi.e.3m.g<-(log(data.x$g2_3month)-log(1000))*100
data.x$pi.e.1y.g<-(log(data.x$g2_1year)-log(1000))*25

data.x$pi.e.1m.g.new<-100*(data.x$g2_1month-1000)/(1000)
data.x$pi.e.3m.g.new<-100*(data.x$g2_3month-1000)/(3*1000)
data.x$pi.e.1y.g.new<-100*(data.x$g2_1year-1000)/(12*1000)

data.x$overvalued.g<-0
data.x$overvalued.g[data.x$g1==1]<-1
data.x$undervalued.g<-0
data.x$undervalued.g[data.x$g1==3]<-1
#valuation
data.x$v.g<-0
data.x$v.g[data.x$overvalued.g==1]<- 1
data.x$v.g[data.x$undervalued.g==1]<- -1

data.x$overvalued.g[is.na(data.x$g1)]<-NA
data.x$undervalued.g[is.na(data.x$g1)]<-NA
data.x$v.g[is.na(data.x$g1)]<-NA


# bubble and crash indicators
data.x$b.1m.g<-0
data.x$b.1m.g[data.x$v.g>0 & data.x$pi.e.1m.g>=0]<-1
data.x$b.1m.g[data.x$v.g==0 & data.x$pi.e.1m.g>0]<-1

data.x$c.1m.g<-0
data.x$c.1m.g[data.x$v.g<0 & data.x$pi.e.1m.g<=0]<-1
data.x$c.1m.g[data.x$v.g==0 & data.x$pi.e.1m.g<0]<-1


data.x$b.3m.g<-0
data.x$b.3m.g[data.x$v.g>0 & data.x$pi.e.3m.g>=0]<-1
data.x$b.3m.g[data.x$v.g==0 & data.x$pi.e.3m.g>0]<-1

data.x$c.3m.g<-0
data.x$c.3m.g[data.x$v.g<0 & data.x$pi.e.3m.g<=0]<-1
data.x$c.3m.g[data.x$v.g==0 & data.x$pi.e.3m.g<0]<-1


data.x$b.1y.g<-0
data.x$b.1y.g[data.x$v.g>0 & data.x$pi.e.1y.g>=0]<-1
data.x$b.1y.g[data.x$v.g==0 & data.x$pi.e.1y.g>0]<-1

data.x$c.1y.g<-0
data.x$c.1y.g[data.x$v.g<0 & data.x$pi.e.1y.g<=0]<-1
data.x$c.1y.g[data.x$v.g==0 & data.x$pi.e.1y.g<0]<-1


for (col in c("b.1m.g","c.1m.g","b.3m.g","c.3m.g","b.1y.g","c.1y.g")){
  data.x[[col]][is.na(data.x$v.g)]<-NA
}
for (col in c("b.1m.g","c.1m.g")){
  data.x[[col]][is.na(data.x$pi.e.1m.g)]<-NA
}
for (col in c("b.3m.g","c.3m.g")){
  data.x[[col]][is.na(data.x$pi.e.3m.g)]<-NA
}
for (col in c("b.1y.g","c.1y.g")){
  data.x[[col]][is.na(data.x$pi.e.1y.g)]<-NA
}

# house prices
# expected house price changes in percent per quarter
data.x$pi.e.1m.h<-(log(data.x$h2_1month)-log(data.x$housing.price))*300
data.x$pi.e.3m.h<-(log(data.x$h2_3month)-log(data.x$housing.price))*100
data.x$pi.e.1y.h<-(log(data.x$h2_1year)-log(data.x$housing.price))*25

data.x$pi.e.1m.h.new<-100*(data.x$h2_1month-data.x$housing.price)/(data.x$housing.price)
data.x$pi.e.3m.h.new<-100*(data.x$h2_3month-data.x$housing.price)/(3*data.x$housing.price)
data.x$pi.e.1y.h.new<-100*(data.x$h2_1year-data.x$housing.price)/(12*data.x$housing.price)

data.x$overvalued.h<-0
data.x$overvalued.h[data.x$h1==2 | data.x$h1_alternate==2]<-1
data.x$undervalued.h<-0
data.x$undervalued.h[data.x$h1==3 | data.x$h1_alternate==3]<-1
#valuation
data.x$v.h<-0
data.x$v.h[data.x$overvalued.h==1]<- 1
data.x$v.h[data.x$undervalued.h==1]<- -1

data.x$overvalued.h[is.na(data.x$h1) & is.na(data.x$h1_alternate)]<-NA
data.x$undervalued.h[is.na(data.x$h1) & is.na(data.x$h1_alternate)]<-NA
data.x$v.h[is.na(data.x$h1) & is.na(data.x$h1_alternate)]<-NA


# bubble and crash indicators
data.x$b.1m.h<-0
data.x$b.1m.h[data.x$v.h>0 & data.x$pi.e.1m.h>=0]<-1
data.x$b.1m.h[data.x$v.h==0 & data.x$pi.e.1m.h>0]<-1

data.x$c.1m.h<-0
data.x$c.1m.h[data.x$v.h<0 & data.x$pi.e.1m.h<=0]<-1
data.x$c.1m.h[data.x$v.h==0 & data.x$pi.e.1m.h<0]<-1


data.x$b.3m.h<-0
data.x$b.3m.h[data.x$v.h>0 & data.x$pi.e.3m.h>=0]<-1
data.x$b.3m.h[data.x$v.h==0 & data.x$pi.e.3m.h>0]<-1

data.x$c.3m.h<-0
data.x$c.3m.h[data.x$v.h<0 & data.x$pi.e.3m.h<=0]<-1
data.x$c.3m.h[data.x$v.h==0 & data.x$pi.e.3m.h<0]<-1


data.x$b.1y.h<-0
data.x$b.1y.h[data.x$v.h>0 & data.x$pi.e.1y.h>=0]<-1
data.x$b.1y.h[data.x$v.h==0 & data.x$pi.e.1y.h>0]<-1

data.x$c.1y.h<-0
data.x$c.1y.h[data.x$v.h<0 & data.x$pi.e.1y.h<=0]<-1
data.x$c.1y.h[data.x$v.h==0 & data.x$pi.e.1y.h<0]<-1

for (col in c("b.1m.h","c.1m.h","b.3m.h","c.3m.h","b.1y.h","c.1y.h")){
  data.x[[col]][is.na(data.x$v.h)]<-NA
}
for (col in c("b.1m.h","c.1m.h")){
  data.x[[col]][is.na(data.x$pi.e.1m.h)]<-NA
}
for (col in c("b.3m.h","c.3m.h")){
  data.x[[col]][is.na(data.x$pi.e.3m.h)]<-NA
}
for (col in c("b.1y.h","c.1y.h")){
  data.x[[col]][is.na(data.x$pi.e.1y.h)]<-NA
}

