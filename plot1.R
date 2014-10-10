## Start by reading the data
projectdata=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Trim the data to dates of interest and remove the rest of the data from memory
subsetdata=subset(projectdata,Date=="1/2/2007"|Date=="2/2/2007")
rm(projectdata)

## Open the png device
png(file="plot1.png")

## Create the histogram, setting parameters for bar color, title, x-axis label, and y-axis limits
hist(subsetdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200))

## Close the png device to create the file
dev.off()