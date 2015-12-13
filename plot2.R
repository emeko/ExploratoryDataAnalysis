################# R Code for plot2 #############

### Load the data into R - NAs are ?, nrows is 2075259 and some other settings to make the read faster.

fileloc <- "./household_power_consumption.txt"
ConsumptionData <- read.table(fileloc, header=TRUE, sep=';', colClasses=c("character", "character", rep("numeric",7)), na="?", 
                              nrows=2075259, comment.char="", check.names=FALSE, stringsAsFactors=FALSE, quote='\"')

### Fix the date format to be consistent with the format used during subsetting.

ConsumptionData$Date <- as.Date(ConsumptionData$Date, format="%d/%m/%Y")

### Subset for the date range
daterange <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subsetdataset <- subset(ConsumptionData, Date %in% daterange)

attach(subsetdataset)

## convert the Date and Time variables
dt <- paste(as.Date(Date), Time)
Datetime <- as.POSIXct(dt)

## Plotting and exporting

png("plot2.png", width=480, height=480)
plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


