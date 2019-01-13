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

# Plot2
png(filename = "plot2.png",width = 480,height = 480)
plot(as.numeric(dataset_analysis$Global_active_power)~dataset_analysis$Data_Time,type="l",
     xlab=weekdays(dataset_analysis$Date),ylab = "Global Active Power (kilowatts)")
dev.off()