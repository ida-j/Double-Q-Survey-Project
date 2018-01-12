# adds female black asian degree income, modifies hispaniclatino to take values 0, 1

data.x$female<-0
data.x$female[data.x$gender==2]<-1
data.x$female[is.na(data.x$gender)]<- NA

data.x$female<-as.numeric(data.x$female)

data.x$income<- NA
data.x$income[data.x$familyincome==1]<-log(5000)
data.x$income[data.x$familyincome==2]<-log((5000+7500)/2)
data.x$income[data.x$familyincome==3]<-log((7500+10000)/2)
data.x$income[data.x$familyincome==4]<-log((10000+12500)/2)
data.x$income[data.x$familyincome==5]<-log((12500+15000)/2)
data.x$income[data.x$familyincome==6]<-log((15000+20000)/2)
data.x$income[data.x$familyincome==7]<-log((20000+25000)/2)
data.x$income[data.x$familyincome==8]<-log((25000+30000)/2)
data.x$income[data.x$familyincome==9]<-log((30000+35000)/2)
data.x$income[data.x$familyincome==10]<-log((35000+40000)/2)
data.x$income[data.x$familyincome==11]<-log((40000+50000)/2)
data.x$income[data.x$familyincome==12]<-log((50000+60000)/2)
data.x$income[data.x$familyincome==13]<-log((60000+75000)/2)
data.x$income[data.x$familyincome==14 & data.x$familyincome_part2==1]<-log((75000+100000)/2)
data.x$income[data.x$familyincome==14 & data.x$familyincome_part2==2]<-log((100000+125000)/2)
data.x$income[data.x$familyincome==14 & data.x$familyincome_part2==3]<-log((125000+20000)/2)
data.x$income[data.x$familyincome==14 & data.x$familyincome_part2==4]<-log(200000)
data.x$income<-as.numeric(data.x$income)

data.x$white<-0
data.x$white[data.x$ethnicity==1]<-1
data.x$white[is.na(data.x$ethnicity)]<-NA

data.x$black<-0
data.x$black[data.x$ethnicity==2]<-1
data.x$black[is.na(data.x$ethnicity)]<- NA

data.x$native<-0
data.x$native[data.x$ethnicity==3]<-1
data.x$native[is.na(data.x$ethnicity)]<-NA

data.x$asian<-0
data.x$asian[data.x$ethnicity==4]<-1
data.x$asian[is.na(data.x$ethnicity)]<-NA

data.x$hispaniclatino[data.x$hispaniclatino==1]<-1
data.x$hispaniclatino[data.x$hispaniclatino==2]<-0
data.x$hispaniclatino[is.na(data.x$hispaniclatino)]<-NA


data.x$degree<-0
data.x$degree[data.x$highesteducation>=9 & data.x$highesteducation<13]<-1
data.x$degree[data.x$highesteducation>=13]<-2
data.x$degree[is.na(data.x$degree)]<-NA

