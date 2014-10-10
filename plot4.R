## Define the columnnames variable for use when reading the data
columnnames=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Read the data, skipping the first 66636 rows, and only reading 2880 (2 days) rows
projectdata=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2880,skip=66636,col.names=columnnames)

## Convert the date and time columns to a new variable, chron, with strptime()
chron=strptime(paste(projectdata[,1],projectdata[,2]), "%d/%m/%Y %H:%M:%S")

## Open the png device
png(file="plot4.png")

## Establish a 2x2 grid for the plot, columns first
par(mfcol=c(2,2))

with(projectdata, {
  ## Create first plot as per plot2.R
  plot(chron,projectdata$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  
  
  ## Create second plot as per plot3.R, except remove the border from the legend
  plot(chron,projectdata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
    lines(chron,projectdata$Sub_metering_2,type="l",col="red")
    lines(chron,projectdata$Sub_metering_3,type="l",col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
  
  ## Create the third plot, setting parameters for line graph, y-axis label, and x-axis label 
  plot(chron,projectdata$Voltage,type="l",ylab="Voltage",xlab="datetime")
  
  ## Create the fourth plot, setting parameters for line graph, y-axis label, and x-axis label   
  plot(chron,projectdata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})

## Close the png device to create the file
dev.off()