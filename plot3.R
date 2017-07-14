inputdt <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
subdata <- inputdt[(inputdt$Date=="1/2/2007" | inputdt$Date=="2/2/2007" ), ]

#format date and time
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
dateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- as.POSIXct(dateTime)

#plot3
with(subdata, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()