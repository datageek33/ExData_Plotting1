#Plot3
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
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#make the plot

opts = c("l")
plot(hpcs$DateTime, hpcs$Sub_metering_1, main="", 
     xlab="", ylab="Energy sub metering",
     type="n", 
)


lines (hpcs$DateTime, hpcs$Sub_metering_1, type=opts, col="black")
lines (hpcs$DateTime, hpcs$Sub_metering_2, type=opts, col="red")
lines (hpcs$DateTime, hpcs$Sub_metering_3, type=opts, col="blue")

legend("topright",  col=c("black", "red","blue"), 
       lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#switch back to display
dev.off()