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

png(filename = "plot3.png", 
    width = 480, height = 480)
plot(DateTime, Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     pch=20)
lines(DateTime, Sub_metering_2,col="red")
lines(DateTime, Sub_metering_3,col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),
       lwd=1,
       col=c("black","red","blue"))     
dev.off()