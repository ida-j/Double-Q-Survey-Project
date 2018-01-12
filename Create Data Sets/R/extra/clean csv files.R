# # wave1 -------------------
# wave1<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 1 02.08.11-.csv",head=TRUE,sep=",")
# wave1$wave<-1
# names(wave1)<- gsub("ms191_", "", names(wave1))
# wave1$date<-"20110802-"
# wave1$housing.price<- sapply(wave1$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
# #wave3$housing.price[!is.na(wave3$h1_alternate)]<-181180
# 
# 
# wave2 -------------------

wave2<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 2 19.12.2011-22.02.2012.csv",head=TRUE,sep=",")
wave2$wave<-2
names(wave2)<- gsub("ms227_", "", names(wave2))
wave2$date<-"20111219-20121601"
wave2$housing.price<- sapply(wave2$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))


# wave3 -------------------
wave3<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 3 16.01.2012-20.02.2012.csv",head=TRUE,sep=",")
wave3$wave<-3
names(wave3)<- gsub("ms238_", "", names(wave3))
wave3$date<-"20120116-20120212"
wave3$housing.price<- sapply(wave3$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
#wave3$housing.price[!is.na(wave3$h1_alternate)]<-181180


# wave4 -------------------

wave4<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 4 20.02.2012-19.03.2012.csv",head=TRUE,sep=",")
wave4$wave<-4
names(wave4)<- gsub("ms250_", "", names(wave4))
wave4$date<-"20120212-20120319"
wave4$housing.price<- sapply(wave4$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
#wave4$housing.price[!is.na(wave4$h1_alternate)]<-181180

# wave 5 ------------------------
wave5<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 5 19.03.2012-16.04.2012.csv",head=TRUE,sep=",")
wave5$wave<-5
names(wave5)<- gsub("ms254_", "", names(wave5))
wave5$date<-"20120319-20120416"
wave5$housing.price<- sapply(wave5$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave5$housing.price[!is.na(wave5$h1_alternate)]<-181180
# wave 6 --------------------------

wave6<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 6 16.04.2012-23.05.2012.csv",head=TRUE,sep=",")
wave6$wave<-6
names(wave6)<- gsub("ms261_", "", names(wave6))
wave6$date<-"20120416-20120523"
wave6$housing.price<- sapply(wave6$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave6$housing.price[!is.na(wave6$h1_alternate)]<-183900

# wave 7 ---------------------------

wave7<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 7 21.05.2012-18.06.2012.csv",head=TRUE,sep=",")
wave7$wave<-7
names(wave7)<- gsub("ms269_", "", names(wave7))
wave7$date<-"20120521-20120618"
wave7$housing.price<- sapply(wave7$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave7$housing.price[!is.na(wave7$h1_alternate)]<-186840

# wave 8 ---------
wave8<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 8 18.06.2012-16.07.2012.csv",head=TRUE,sep=",")
wave8$wave<-8
names(wave8)<- gsub("ms272_", "", names(wave8))
wave8$date<-"20120618-20120716"
wave8$housing.price<- sapply(wave8$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave8$housing.price[!is.na(wave8$h1_alternate)]<-189970

# wave 9 ------------

wave9<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 9 16.07.2012-20.08.2012.csv",head=TRUE,sep=",")
wave9$wave<-9
names(wave9)<- gsub("ms277_", "", names(wave9))
wave9$date<-"20120716-20120820"
wave9$housing.price<- sapply(wave9$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave9$housing.price[!is.na(wave9$h1_alternate)]<-191900

# wave 10 --------------
wave10<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 10 20.08.2012-17.09.2012.csv",head=TRUE,sep=",")
wave10$wave<-10
names(wave10)<- gsub("ms282_", "", names(wave10))
wave10$date<-"20120820-20120917"
wave10$housing.price<- sapply(wave10$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave10$housing.price[!is.na(wave10$h1_alternate)]<-192270


# wave 11 --------------------

wave11<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 11 17.09.2012-15.10.2012.csv",head=TRUE,sep=",")
wave11$wave<-11
names(wave11)<- gsub("ms287_", "", names(wave11))
wave11$date<-"20120917-20121015"
wave11$housing.price<- sapply(wave11$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave11$housing.price[!is.na(wave11$h1_alternate)]<-192140

# wave 12 -------------------

wave12<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 12 15.10.2012-19.11.2012.csv",head=TRUE,sep=",")
wave12$wave<-12
names(wave12)<- gsub("ms296_", "", names(wave12))
wave12$date<-"20121015-20121119"
wave12$housing.price<- sapply(wave12$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave12$housing.price[!is.na(wave12$h1_alternate)]<-192010

# wave 13 ---------------

wave13<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 13 19.11.2012-17.12.2012.csv",head=TRUE,sep=",")
wave13$wave<-13
names(wave13)<- gsub("ms318_", "", names(wave13))
wave13$date<-"20121119-20121217"
wave13$housing.price<- sapply(wave13$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave13$housing.price[!is.na(wave13$h1_alternate)]<-192650

# wave 14 --------------------

wave14<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 14 17.12.2012-21.01.2013.csv",head=TRUE,sep=",")
wave14$wave<-14
names(wave14)<- gsub("ms325_", "", names(wave14))
wave14$date<-"20121217-20130121"
wave14$housing.price<- sapply(wave14$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave14$housing.price[!is.na(wave14$h1_alternate)]<-192910

# wave 15 ----------

wave15<-read.csv("~/Dropbox/Double Q Survey Replication/Data/csv/original survey data/Wave 15 21.01.2013-18.02.2013.csv",head=TRUE,sep=",")
wave15$wave<-15
names(wave15)<- gsub("ms327_", "", names(wave15))
wave15$date<-"20130121-20130218"
wave15$housing.price<- sapply(wave15$fl_housing, function(x) as.numeric(gsub("[$,]", "", x)))
wave15$housing.price[!is.na(wave15$h1_alternate)]<-192340



#### add period

wave3$period<-"Y12M02"
wave4$period<-"Y12M03"
wave5$period<-"Y12M04"
wave6$period<-"Y12M05"
wave7$period<-"Y12M06"
wave8$period<-"Y12M07"
wave9$period<-"Y12M08"
wave10$period<-"Y12M09"
wave11$period<-"Y12M10"
wave12$period<-"Y12M11"
wave13$period<-"Y12M12"
wave14$period<-"Y13M01"
wave15$period<-"Y13M02"