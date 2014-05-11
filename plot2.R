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
# convert Global_active_power variable to numeric
byDate$Global_active_power <- as.numeric(as.character
                                         (byDate$Global_active_power))
# initialize image
png("plot2.png", 480, 480)
# create plot
plot(byDate$DateTime, byDate$Global_active_power, type="l", 
     ylab="Global Active Power(kilowatts)", xlab=" ")
dev.off()
