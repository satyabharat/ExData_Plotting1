#read data
inputdt <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
subdata <- inputdt[(inputdt$Date=="1/2/2007" | inputdt$Date=="2/2/2007" ), ]

#format date and time
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
dateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- as.POSIXct(dateTime)

#plot2
plot(subdata$Global_active_power~subdata$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()