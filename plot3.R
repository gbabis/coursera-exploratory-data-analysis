## Read the full dataset and replace NAs with "?"
data <- read.csv("./data/household_power_consumption.txt", sep=';', na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data according to the specified time frame
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)

## Converting to datetime using POSIXct
datetime <- with(data_sub, paste(Date, Time))
data_sub$DateTime <- as.POSIXct(datetime)

## Plot 3
png("plot3.png", width=480, height=480)
        plot(data_sub$Sub_metering_1 ~ data_sub$DateTime,type="l",xlab="",
                ylab="Energy sub metering")
        lines(data_sub$Sub_metering_2 ~ data_sub$DateTime,  type="l", col="red")
        lines(data_sub$Sub_metering_3 ~ data_sub$DateTime, type="l", col="blue")     
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
       lwd=2.5, col=c("black", "red", "blue"))
## Saving to file
dev.off()
