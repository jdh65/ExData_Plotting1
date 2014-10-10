columnnames=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
projectdata=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2880,skip=66636,col.names=columnnames)

chron=strptime(paste(projectdata[,1],projectdata[,2]), "%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
plot(chron,projectdata$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(chron,projectdata$Sub_metering_2,type="l",col="red")
lines(chron,projectdata$Sub_metering_3,type="l",col="blue")
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()