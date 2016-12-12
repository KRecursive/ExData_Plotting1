#Reading the data with variables and missing values
pwr<-read.table("D:/TEMP/power.txt", header=TRUE,sep = ";", na.strings="?")
#Define the Date variable as class=Date
pwr$Date=as.Date(pwr$Date, format = "%d/%m/%Y")
#Subsetting the dates we actually care about
use<-pwr[which(pwr$Date=="2007-2-1" | pwr$Date=="2007-2-2"),]
#Create a date-time variable
use$DateTime<-strptime(paste(use$Date,use$Time,sep=" "), "%Y-%m-%d %H:%M:%S")

#Open the png device, set the filename, format size
dev.copy(png,file="plot4.png", width=480, height=480)
#Format a 2 by 2 panel for printing to
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
#Plot the line for the top left panel
plot(use$DateTime,use$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#Plot the line for the top right panel
plot(use$DateTime,use$Voltage,type="l",ylab="Voltage",xlab="datetime")
#Plot the first submeter line for the bottom left panel
plot(use$DateTime,use$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
#Plot the second submeter line for the bottom left panel
lines(use$DateTime,use$Sub_metering_2,type="l", col="red")
#Plot the third submeter line for the bottom left panel
lines(use$DateTime,use$Sub_metering_3,type="l", col="blue")
#Create and format the legend for the bottom left panel
legend("topright",bty="n",lty=c(1,1,1),pch=c(NA,NA,NA),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot the line for the bottom right panel
plot(use$DateTime,use$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
#Close the png device
dev.off()



