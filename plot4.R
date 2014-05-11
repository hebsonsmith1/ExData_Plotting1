# set working directory 
setwd("~/Data Science Coursera/Exploratory Data Analysis")
# unzip file
unzip("exdata_data_household_power_consumption.zip")
# read data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# create new variable with Date and Time pasted together
data$DateTime <- paste(data$Date, data$Time)
# convert Date variable class type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset data by dates needed
byDate <- data[(data$Date > "2007-01-31" & data$Date < "2007-02-03"),]
# convert DateTime variable
byDate$DateTime <- strptime(byData$DateTime, "%d/%m/%Y %H:%M:%S")
# convert Sub_metering_... variables
byDate$Sub_metering_1 <- as.numeric(as.character(byDate$Sub_metering_1))
byDate$Sub_metering_2 <- as.numeric(as.character(byDate$Sub_metering_2))
byDate$Sub_metering_3 <- as.numeric(as.character(byDate$Sub_metering_3))
# convert other variables
byDate$Voltage <- as.numeric(as.character(byDate$Voltage))
byDate$Global_reactive_power <- as.numeric(as.character
                                           (byDate$Global_reactive_power))
byDate$Global_active_power <- as.numeric(as.character
                                         (byDate$Global_active_power))
# create plot
png("plot4.png", 480, 480)
par(mfrow=c(2, 2))
plot(byDate$DateTime, byDate$Global_active_power, type="l", 
     ylab="Global Active Power(kilowatts)", xlab=" ")
plot(byDate$DateTime, byDate$Voltage, type="l", ylab="Voltage", 
     xlab="datetime")
plot(byDate$DateTime, byDate$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab = " ")
lines(byDate$DateTime, byDate$Sub_metering_2, col="red", 
      type="l")
lines(byDate$DateTime, byDate$Sub_metering_3, col="blue", 
      type="l")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       box.lwd = 0, cex = 0.8)
plot(byDate$DateTime, byDate$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime")
dev.off()
