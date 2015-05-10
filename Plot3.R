# Plot3.R
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
plot(data$DateTime, data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

# add legend
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# save plot
dev.copy(png, file="plot3.png", height=480, width=480 )

# make sure to do this or next plots will not work
dev.off()