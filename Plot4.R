# Plot4.R
#

# load file
file <- "household_power_consumption.txt"
data <- read.table( file, 
                    header = TRUE,
                    sep = ";",
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ),
                    na = "?")

# subset data to specified date range
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

dateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# plot the graphs
par(mfrow=c(2,2))

plot( data$DateTime, data$Global_active_power, type='l', xlab="", ylab="Global Active Power")

plot( data$DateTime, data$Voltage, type='l', xlab="datetime", ylab="voltage")

plot(data$DateTime, data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty="n")

plot( data$DateTime, data$Global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power", col="black")

# save plot
dev.copy(png, file="plot4.png", height=480, width=480 )

# make sure to do this or next plots will not work
dev.off()