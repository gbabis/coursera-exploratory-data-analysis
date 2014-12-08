

## Read the full dataset
data <- read.csv("./data/household_power_consumption.txt", sep=';', na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$DateTime <- as.POSIXct(datetime)

## Plot 1
hist(data_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()