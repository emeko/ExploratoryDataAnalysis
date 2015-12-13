
#### R Code for plot4
###############################################################################

### Load the data into R

fileloc <- "./household_power_consumption.txt"
ConsumptionData <- read.table(fileloc, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

### Subset for the date range we are interested in

daterange <- c("1/2/2007","2/2/2007")
subsetdataset <- ConsumptionData[ConsumptionData$Date %in% daterange,]

### extract datetime

dt <- strptime(paste(subsetdataset$Date, subsetdataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

### prepare plotting variables

globalActivePower <- as.numeric(subsetdataset$Global_active_power)
globalReactivePower <- as.numeric(subsetdataset$Global_reactive_power)
voltage <- as.numeric(subsetdataset$Voltage)
subMetering1 <- as.numeric(subsetdataset$Sub_metering_1)
subMetering2 <- as.numeric(subsetdataset$Sub_metering_2)
subMetering3 <- as.numeric(subsetdataset$Sub_metering_3)

### Plotting and exporting
### 4 plots using mfrow = c(2,2)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dt, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dt, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()