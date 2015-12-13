
#### R Code for plot1 
###############################################################################

### Load the data into R - NAs are ?, nrows is 2075259 and some other settings to make the read faster.

fileloc <- "./household_power_consumption.txt"
ConsumptionData <- read.table(fileloc, header=TRUE, sep=';', colClasses=c("character", "character", rep("numeric",7)), na="?", 
                              nrows=2075259, comment.char="", check.names=FALSE, stringsAsFactors=FALSE, quote='\"')

### Fix the date format to be consistent with the format used during subsetting.

ConsumptionData$Date <- as.Date(ConsumptionData$Date, format="%d/%m/%Y")

### Subset for the date range we are interested in

daterange <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subsetdataset <- subset(ConsumptionData, Date %in% daterange)

attach(subsetdataset)

### convert the Date and Time variables
dt <- paste(as.Date(Date), Time)
Datetime <- as.POSIXct(dt)

### Plotting and exporting

png("plot1.png", width=480, height=480)
hist(Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
