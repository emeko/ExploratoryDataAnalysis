
#### R Code for plot3 
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
subMetering1 <- as.numeric(subsetdataset$Sub_metering_1)
subMetering2 <- as.numeric(subsetdataset$Sub_metering_2)
subMetering3 <- as.numeric(subsetdataset$Sub_metering_3)

### Plotting and exporting

png("plot3.png", width=480, height=480)
plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
