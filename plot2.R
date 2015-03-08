#Plot2

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
#set png device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
#make the plot
opts = c("l")
par(col="black")
plot(hpcs$DateTime, hpcs$Global_active_power, main="", 
     xlab="", ylab="Global Active Power (kilowatts)",
     type="n", 
     )
lines (hpcs$DateTime, hpcs$Global_active_power, type=opts)
#switch back to display
dev.off()