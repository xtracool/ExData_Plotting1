# Plot2.R
#

# load file
file <- "household_power_consumption.txt"
data <- read.table( file, 
                    header = TRUE,
                    sep = ";",
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ),
                    na = "?")
attach(data)

# subset data to specified date range
data <- data[Date == "1/2/2007" | Date == "2/2/2007", ]

dateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

plot(data$DateTime, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480 )

# make sure to do this or next plots will not work
dev.off()