coursera-Exploratory-Data-Analysis-assignment-1
===============================================
data1<-read.table(file="D:/household_power_consumption.txt", header=TRUE, sep=";")


data1$Time = strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data1$Date = as.Date(data1$Date, "%d/%m/%Y")
 

data2 = subset(data1, data1$Date == as.Date("01/02/2007", "%d/%m/%Y") | data1$Date == as.Date("02/02/2007", "%d/%m/%Y"))

data2$Global_active_power =  as.numeric(as.character(data2$Global_active_power))

 #open png device
 png(filename = "plot2.png", "px", pointsize = 12, bg = "white",  res = NA,  type = "cairo")
 plot(data2$Time, data2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

 #close png device
 dev.off()
