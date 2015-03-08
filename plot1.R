#Plot1

#read table
hpc<-read.table("data/household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
#convert datetimes
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
#subset data
hpcs <- filter(hpc, hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02")
#set png device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
#make the plot
hist(hpcs$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
#switch back to display
dev.off()