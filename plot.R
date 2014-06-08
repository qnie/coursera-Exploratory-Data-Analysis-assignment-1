coursera-Exploratory-Data-Analysis-assignment-1
===============================================
data1<-read.table(file="D:/household_power_consumption.txt", header=TRUE, sep=";")


data1$Time = strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data1$Date = as.Date(data1$Date, "%d/%m/%Y")

data2 = subset(data1,  data1$Date == as.Date("01/02/2007", "%d/%m/%Y") | data1$Date == as.Date("02/02/2007", "%d/%m/%Y"))


## making plot 3 ##
data2$Sub_metering_1 =  as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 =  as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 =  as.numeric(data2$Sub_metering_3)

#open png device
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA,  type = "cairo")
plot(data2$Time, data2$Sub_metering_1, type="l", col="black",ylab="Energy sub metering", xlab="")
lines(data2$Time, data2$Sub_metering_2, col="red")
lines(data2$Time, data2$Sub_metering_3, col="blue")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Close device
dev.off()
