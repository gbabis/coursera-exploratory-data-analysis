## Read the full dataset
data <- read.csv("./data/household_power_consumption.txt", sep=';', na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$DateTime <- as.POSIXct(datetime)

## Plot 4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_sub, {
        plot(Global_active_power~DateTime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~DateTime, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~DateTime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~DateTime,col='red')
        lines(Sub_metering_3~DateTime,col='blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type="l", 
             ylab="Global_reactive_power",xlab="datetime")
})  
## Saving to file
dev.off()