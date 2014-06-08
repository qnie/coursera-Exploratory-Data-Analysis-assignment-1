coursera-Exploratory-Data-Analysis-assignment-1
===============================================
data1<-read.table(file="D:/household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
data1$Date<-as.Date(strptime(data1$Date, format = "%d/%m/%Y"))

datesub <- ((as.POSIXlt(data1$Date)$mday) == 1 | (as.POSIXlt(data1$Date)$mday) == 2) & (as.POSIXlt(data1$Date)$mon) == 1 & (as.POSIXlt(data1$Date)$year) == 107 

data2 <- data1[datesub, ]

data2$Global_active_power<-as.numeric(data2$Global_active_power)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
hist(data2$Global_active_power, main = "Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")

dev.off()
