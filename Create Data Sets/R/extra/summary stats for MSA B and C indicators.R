df<-merged
df<-df[df$wave!=16,]
library(stargazer)
stargazer(subset(df,select = c("pi","pi.exp.1m","pi.exp.3m","pi.exp.1y",
                               "bubble.1m","crash.1m","bstar.1m","cstar.1m",
                               "bubble.3m","crash.3m","bstar.3m","cstar.3m",
                               "bubble.1y","crash.1y","bstar.1y","cstar.1y")), nobs = FALSE, mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
df$msa<-as.character(paste(df$msa))
msas<-unique(df$msa)
mat<-matrix(data=NA,nrow = length(msas),ncol=8)
cities<-matrix(data=NA,nrow=length(msas),ncol=1)
for (i in 1:length(msas)){
  m<-msas[[i]]
  cities[i,1]<-m
  d<-df[df$msa==m,]
  
  mat[i,1]<-mean(d$av.obs)
  mat[i,2]<-mean(d$pi)
  mat[i,3]<-mean(d$bubble.1m)
  mat[i,4]<-mean(d$crash.1m)
  mat[i,5]<-mean(d$bubble.3m)
  mat[i,6]<-mean(d$crash.3m)
  mat[i,7]<-mean(d$bubble.1y)
  mat[i,8]<-mean(d$crash.1y)
}

as.numeric(mat)
