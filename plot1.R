
## Read data file
inputdt <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

#subset date based on dates 2007-02-01 and 2007-02-02
subdata <- inputdt[(inputdt$Date=="1/2/2007" | inputdt$Date=="2/2/2007" ), ]

rm(inputdt)



# Draw Plot
hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## copying into PNG

dev.copy(png, file="plot1.png", height = 480, width = 480)

dev.off()


