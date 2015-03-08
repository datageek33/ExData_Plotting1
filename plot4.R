#Plot4
library(dplyr)

#reset PAR
dev.new()
op <- par(no.readonly = TRUE)
dev.off()
op

#read table
hpc<-read.table("data/household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
#convert datetimes
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
#subset data
hpcs <- filter(hpc, hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02")

View(hpcs)
#set png device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#set the plots to 2 rows, 2 columns
par(mfrow = c(2,2))

#make the first plot for Global Active Power
opts = c("l")
par(col="black")
plot(hpcs$DateTime, hpcs$Global_active_power, main="", 
     xlab="", ylab="Global Active Power",
     type="n", 
)
lines (hpcs$DateTime, hpcs$Global_active_power, type=opts)
#make the second  plot for Voltage
plot(hpcs$DateTime, hpcs$Voltage, 
     col="black", 
     xlab="datetime", ylab="Voltage"
     ,type="n" )
lines (hpcs$DateTime, hpcs$Voltage, type=opts)


#make the third plot for energy sub metering
opts = c("l")
plot(hpcs$DateTime, hpcs$Sub_metering_1, main="", 
     xlab="", ylab="Energy sub metering",
     type="n", 
)

lines (hpcs$DateTime, hpcs$Sub_metering_1, type=opts, col="black")
lines (hpcs$DateTime, hpcs$Sub_metering_2, type=opts, col="red")
lines (hpcs$DateTime, hpcs$Sub_metering_3, type=opts, col="blue")

legend("topright",  col=c("black", "red","blue"),  bty = "n",
       lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#make the fourth plot for global reactive power
plot(hpcs$DateTime, hpcs$Global_reactive_power, 
     col="black", main="", 
     xlab="datetime", ylab="Global_reactive_power"
     ,type="n" )
lines (hpcs$DateTime, hpcs$Global_reactive_power, type=opts)

#switch back to display
dev.off()