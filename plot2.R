## Read the full dataset and replace NAs with "?"
data <- read.csv("./data/household_power_consumption.txt", sep=';', na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data according to the specified time frame
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)

## Converting to datetime using POSIXct
datetime <- with(data_sub, paste(Date, Time))
data_sub$DateTime <- as.POSIXct(datetime)

## Plot 2
with(data_sub, plot(Global_active_power ~ DateTime, type = "l", xlab = "",
                    ylab ="Global Active Power (kilowatts"))

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
