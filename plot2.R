## R script to read and plot the variation  of Global active power for two days
# from "household_power_consumption.txt" from your working direcoty. 
# R script will save the plot2.png in your working directory 

## Keep household_power_consumption.txt in your working directory

#read "household_power_consumption.txt" for the dates 2007-02-01 and 2007-02-02 as per project 1 
#submission requirement
data <- read.table("household_power_consumption.txt", sep = ";",
                   header= TRUE, skip = 66636, nrows = 2880, na.strings = "?")
#read the txt file once again the get the names and assign it to data
names(data) <- names(read.table("household_power_consumption.txt", sep = ";",
                                header= TRUE, nrows = 1 ))
# Create a new date time column
data$datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Plot variation of Global_active_power for two days and save it as plot2.png in your 
# working direcotory
png(filename = "plot2.png")
with(data, plot(datetime,Global_active_power, type = "l", 
                xlab = " " , ylab = "Global Active Power (kilowatts)"))
dev.off()