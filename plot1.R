#First, ir reads the txt into a table
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)

#Cutting down only the two days asked for
power$Date <- as.Date(power$Date,"%d/%m/%Y")
library(dplyr)
power <- filter(power,Date=="2007-02-01" | Date=="2007-02-02")



unique(unclass(as.POSIXlt(strptime(test$V2,"%H:%M:%S")))$hour)