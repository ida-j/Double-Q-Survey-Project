
for(col in c("female","black","asian","hispaniclatino","calcage","income","degree")){
  data<-data[!is.na(data[[col]]),]
}

f <- function(x) c( mu=mean(x), var=var(x) )

#female
x<-do.call( "rbind", tapply( data$female, data$prim_key, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
rm1<-unique(x$id[x$var>0 & x$mu>1/3 & x$mu<2/3])
ones<-unique(x$id[x$var>0 & x$mu>=2/3])
zeros<-unique(x$id[x$var>0 & x$mu<=1/3])

data$female_or<-data$female
data$female[data$prim_key %in% ones]<-1
data$female[data$prim_key %in% zeros]<-0

#black
x<-do.call( "rbind", tapply( data$black, data$prim_key, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
rm2<-unique(x$id[x$var>0 & x$mu>1/3 & x$mu<2/3])
ones<-unique(x$id[x$var>0 & x$mu>=2/3])
zeros<-unique(x$id[x$var>0 & x$mu<=1/3])
data$black_or<-data$black
data$black[data$prim_key %in% ones]<-1
data$black[data$prim_key %in% zeros]<-0

# asian
x<-do.call( "rbind", tapply(data$asian, data$prim_key, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
rm3<-unique(x$id[x$var>0 & x$mu>1/3 & x$mu<2/3])
ones<-unique(x$id[x$var>0 & x$mu>=2/3])
zeros<-unique(x$id[x$var>0 & x$mu<=1/3])
data$asian_or<-data$asian
data$asian[data$prim_key %in% ones]<-1
data$asian[data$prim_key %in% zeros]<-0

#hispaniclatino
x<-do.call( "rbind", tapply( data$hispaniclatino, data$prim_key, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
rm4<-unique(x$id[x$var>0 & x$mu>1/3 & x$mu<2/3])
ones<-unique(x$id[x$var>0 & x$mu>=2/3])
zeros<-unique(x$id[x$var>0 & x$mu<=1/3])
data$hispaniclatino_or<-data$hispaniclatino
data$hispaniclatino[data$prim_key %in% ones]<-1
data$hispaniclatino[data$prim_key %in% zeros]<-0

rm.id<-unique(c(rm1,rm2,rm3,rm4))
data<-data[!(data$prim_key %in% rm.id),]

data$calcage[data$calcage==112 & data$prim_key=="12024656:1"]<-55

#### replace age and income with their means, 
data$ln_age<-log(data$calcage)
data<-within(data, {av_age = ave(ln_age,prim_key)} )
data<-within(data, {av_inc = ave(income,prim_key)} )
data<-within(data, {av_ed = ave(degree,prim_key)} )


######## for summary stats, replace white and native
#white
x<-do.call( "rbind", tapply( data$white, data$prim_key, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
ones<-unique(x$id[x$var>0 & x$mu>=1/2])
zeros<-unique(x$id[x$var>0 & x$mu<1/2])
data$white[data$prim_key %in% ones]<-1
data$white[data$prim_key %in% zeros]<-0

#native
x<-do.call( "rbind", tapply( data$native, data$prim_key, f ) )
x<-as.data.frame(x)
x$id<-rownames(x)
ones<-unique(x$id[x$var>0 & x$mu>=1/2])
zeros<-unique(x$id[x$var>0 & x$mu<1/2])
data$native[data$prim_key %in% ones]<-1
data$native[data$prim_key %in% zeros]<-0

# library(dplyr)

# x<-do.call( "rbind", tapply( data$white, data$prim_key, f ) )
# x<-as.data.frame(x)
# x<-x[x$var>0,]
# x<-x[!is.na(x$var),]
# x<-add_rownames(x,"id")
# id1<-x$id
# 
# x<-do.call( "rbind", tapply( data$native, data$prim_key, f ) )
# x<-as.data.frame(x)
# x<-x[x$var>0,]
# x<-x[!is.na(x$var),]
# x<-add_rownames(x,"id")
# id2<-x$id
# 
# ids<-c(id1,id2)
# 
# test<-data[data$prim_key %in% ids,]
# test<-subset(test,select = c("prim_key","white","native","black","asian","hispaniclatino"))
