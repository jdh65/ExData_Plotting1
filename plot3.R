## Define the columnnames variable for use when reading the data
columnnames=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Read the data, skipping the first 66636 rows, and only reading 2880 (2 days) rows
projectdata=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2880,skip=66636,col.names=columnnames)

## Convert the date and time columns to a new variable, chron, with strptime()
chron=strptime(paste(projectdata[,1],projectdata[,2]), "%d/%m/%Y %H:%M:%S")

## Open the png device
png(file="plot3.png")

## Create the plot for the first line, setting parameters for line graph, y-axis label, and no x-axis label
plot(chron,projectdata$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")

## Add the second line, in red
lines(chron,projectdata$Sub_metering_2,type="l",col="red")

## Add the third line, in blue
lines(chron,projectdata$Sub_metering_3,type="l",col="blue")

##Add the legend with appropriate symbols and colors
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close the png device to create the file
dev.off()