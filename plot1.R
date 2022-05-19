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

#Converts character variable to Numeric for Frequency reading in Histogram
df$Global_active_power <- as.numeric(df$Global_active_power)

#Opens png device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

par(mfrow = c(1, 1))

hist(df$Global_active_power, 
     col = "Red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#closes png device
dev.off()
