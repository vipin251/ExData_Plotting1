## R script to read and plot the variation  of Global active power, Voltage,
## sub metering and Global reactive power for two days from "household_power_consumption.txt" 
## R script will save the plot4.png in your working directory 

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

## Plot variation of Global active power, Volatge, submetering and Global reactive power
## for two days and save it as plot4.png (480 x 480 pixels) in your working direcotory
# Default values for png function output is (width = 480, height = 480, units = "px")
png(filename = "plot4.png")
par(mfcol = c(2,2))
with(data, plot(datetime,Global_active_power, type = "l", 
                xlab = " " , ylab = "Global Active Power"))
with(data, plot(y = Sub_metering_1, x= datetime, type= "l", ylab = "Energy Sub Metering", xlab = " "))
with(data, lines(y = Sub_metering_2, x= datetime, type= "l", col = "red"))
with(data, lines(y = Sub_metering_3, x= datetime, type= "l", col = "blue"))
legend("topright", lty = 1, bty = "n" ,col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(datetime,Voltage, type = "l", ylab = "Voltage"))

with(data, plot(datetime,Global_reactive_power, type = "l", ylab = "Global reactive power"))
dev.off()
