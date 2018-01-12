df.m<-df[df$female==0,]
df.f<-df[df$female==1,]

n=nrow(df)
n.f=nrow(df.f)
n.m=nrow(df.m)

varlist<-list(list('b.1m.e','c.1m.e'),list('b.3m.e','c.3m.e'),list('b.1y.e','c.1y.e'),
             list('b.1m.g','c.1m.g'),list('b.3m.g','c.3m.g'),list('b.1y.g','c.1y.g'),
             list('b.1m.h','c.1m.h'),list('b.3m.h','c.3m.h'),list('b.1y.h','c.1y.h'))
for (item in 1:length(varlist)){
  b=varlist[item][[1]][[1]][1]
  c=varlist[item][[1]][[2]][1]
  
  nb=length(which(df[[b]]==1))
  nc=length(which(df[[c]]==1))
  nb.f=length(which(df.f[[b]]==1))
  nc.f=length(which(df.f[[c]]==1))
  nb.m=length(which(df.m[[b]]==1))
  nc.m=length(which(df.m[[c]]==1))
  
  m<-matrix(nrow=6,ncol=3,data=NA)
  m[1,1]=nb
  m[1,2]=nb.f
  m[1,3]=nb.m
  
  m[2,1]=nb*100/n
  m[2,2]=nb.f*100/n.f
  m[2,3]=nb.m*100/n.m
  
  m[3,1]=nc
  m[3,2]=nc.f
  m[3,3]=nc.m
  
  m[4,1]=nc*100/n
  m[4,2]=nc.f*100/n.f
  m[4,3]=nc.m*100/n.m
  
  m[5,1]=n-nc-nb
  m[5,2]=n.f -nc.f -nb.f
  m[5,3]=n.m-nc.m-nb.m
  
  m[6,1]=(n-nc-nb)*100/n
  m[6,2]=(n.f -nc.f -nb.f)*100/n.f
  m[6,3]=(n.m-nc.m-nb.m)*100/n.m
  
  assign(paste("m",item,sep=""),m)
}


mat<-rbind(cbind(m1,m2,m3),cbind(m4,m5,m6),cbind(m7,m8,m9))
library(xtable)
x=xtable(mat,digits=2)
print(x,include.rownames=FALSE)
