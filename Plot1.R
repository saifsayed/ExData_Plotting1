setwd ('/Users/saif/Documents/Studies/Extra Curricular/Data Analysis/John Hopkins-Data Science/Exploratory Data Analysis')
Data <-read.table("./household_power_consumption.txt",head=TRUE,sep=";",
                  colClasses = c("character", "character", rep("numeric",7)),
                  na = "?")
## We only need data of 2 days.
date_range <- Data$Date == "1/2/2007" | Data$Date == "2/2/2007"
newData <- Data[date_range, ]
x <- paste(newData$Date, newData$Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
attach(newData)

png(filename = "plot2.png", 
    width = 480, height = 480)
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     pch=20)
dev.off()
#Global_active_power <- as.numeric(Global_active_power)/1000
dev.copy(png,'plot1.png')
hist(Global_active_power,col = "Red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()