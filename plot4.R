dataset <- read.table("/Users/yingkaisun/R/Data Science_Exercise/household_power_consumption.txt",sep = ";",header = TRUE)
head(dataset)
library(lubridate)
library(dplyr)
dataset <- tbl_df(dataset)
dataset$Date <- dmy(dataset$Date)
dataset_analysis <- filter(dataset,Date==ymd(20070201)|Date==ymd(20070202))
dataset_analysis$Data_Time <- paste(dataset_analysis$Date,dataset_analysis$Time)
dataset_analysis$Data_Time <- ymd_hms(dataset_analysis$Data_Time)
head(dataset_analysis)

# Plot4
png(filename = "plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(as.numeric(dataset_analysis$Global_active_power)~dataset_analysis$Data_Time,type="l",
     ylab = "Global Active Power (kilowatts)",xlab="")
plot(as.numeric(dataset_analysis$Voltage)~dataset_analysis$Data_Time,type="l",
     ylab = "Voltage",xlab="datetime")
plot(as.numeric(dataset_analysis$Sub_metering_1)~dataset_analysis$Data_Time,type="n",ylab = "Energy sub metering",xlab=weekdays(dataset_analysis$Data_Time))
lines(as.numeric(dataset_analysis$Sub_metering_1)~dataset_analysis$Data_Time,type="l",col="black",lwd=0.5)
lines(as.numeric(dataset_analysis$Sub_metering_2)~dataset_analysis$Data_Time,type="l",col="red",lwd=0.5)
lines(as.numeric(dataset_analysis$Sub_metering_3)~dataset_analysis$Data_Time,type="l",col="blue",lwd=0.5)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = 1,xjust = 1,yjust = 1)
plot(as.numeric(dataset_analysis$Global_reactive_power)~dataset_analysis$Data_Time,type="l", ylab = "Global_Reactive_Power",xlab="datetime")
dev.off()