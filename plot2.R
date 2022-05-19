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
png(filename = "plot2.png", width = 480, height = 480, units = "px")


plot(df$Time,
     df$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#closes png device
dev.off()