# set working directory 
setwd("~/Data Science Coursera/Exploratory Data Analysis")
# unzip file
unzip("exdata_data_household_power_consumption.zip")
# read data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# convert Date variable class type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset data by dates needed
byDate <- data[(data$Date > "2007-01-31" & data$Date < "2007-02-03"),]
# initialize image
png("plot1.png", 480, 480)
# create histogram
hist(byDate$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")