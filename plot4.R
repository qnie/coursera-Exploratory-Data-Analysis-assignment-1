data1<-read.table(file="D:/household_power_consumption.txt", header=TRUE, sep=";")

#bind date and time and make it to timestamp and change time form string to timestamp and tring date to date
data1$Time = strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data1$Date = as.Date(data1$Date, "%d/%m/%Y")

data2 = subset(data1,  data1$Date == as.Date("01/02/2007", "%d/%m/%Y") | data1$Date == as.Date("02/02/2007", "%d/%m/%Y"))


## making plot 3 ##
data2$Sub_metering_1 =  as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 =  as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 =  as.numeric(data2$Sub_metering_3)
data2$Voltage =  as.numeric(as.character(data2$Voltage))
data2$Global_reactive_power =  as.numeric(as.character(data2$Global_reactive_power))

#open png device
png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white",  res = NA,  type = "cairo")
par(mfrow = c(2, 2), cex=0.65)

#plot code for plot 1
plot(data2$Time, data2$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

#plot2()
plot(data2$Time, data2$Voltage, type="l",ylab="Voltage", xlab="datetime")

#plot3
plot(data2$Time, data2$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(data2$Time, data2$Sub_metering_2, col="red")
lines(data2$Time, data2$Sub_metering_3, col="blue")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(data2$Time, data2$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")

#close png device
dev.off()