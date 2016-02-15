#First, ir reads the txt into a table
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)

#Cutting down only the two days asked for
power$Date <- as.Date(power$Date,"%d/%m/%Y")
library(dplyr)
power <- filter(power,Date=="2007-02-01" | Date=="2007-02-02")

#Categorizing the columns
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage  <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Timestamp <-paste(power$Date, power$Time)


#Note that my weekday names are going to be "qui","sex","sab" that are "Thu","Fri","Sat" in Portuguese
#I didn't want to change any system configs to make English language available
#Didn't think it would be a problem
with(power,plot(strptime(Timestamp, "%Y-%m-%d %H:%M:%S"),Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(power,lines(strptime(Timestamp, "%Y-%m-%d %H:%M:%S"),Sub_metering_2, type = "l", col="red"))
with(power,lines(strptime(Timestamp, "%Y-%m-%d %H:%M:%S"),Sub_metering_3, type = "l", col="blue"))
legend("top",lty=1,col=c("Black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
dev.copy(png,filename="plot3.png",width=480,height=480)
dev.off()