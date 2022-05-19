library(lubridate)
library(dplyr)
library(M3)

#Read data from text file
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
#convert date to Date object
data$Date <- dmy(data$Date)
#Select the subset of data we are looking at
df <- filter(data, Date >= "2007-02-01", Date < "2007-02-03")
#Convert time to time object with the date
df$Time <- combine.date.and.time(df$Date, df$Time)

#Opens png device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(df$Time, df$Sub_metering_1, type="l", col="black", xlab = "",ylab = "Energy sub metering")
lines(df$Time, df$Sub_metering_2 , col="red")
lines(df$Time, df$Sub_metering_3 , col="blue")
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=c(2,2,2),
       col=c("black","red", "blue"))

#closes png device
dev.off()