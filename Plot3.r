#Reading the data with variables and missing values
pwr<-read.table("D:/TEMP/power.txt", header=TRUE,sep = ";", na.strings="?")
#Define the Date variable as class=Date
pwr$Date=as.Date(pwr$Date, format = "%d/%m/%Y")
#Subsetting the dates we actually care about
use<-pwr[which(pwr$Date=="2007-2-1" | pwr$Date=="2007-2-2"),]
#Create a date-time variable
use$DateTime<-strptime(paste(use$Date,use$Time,sep=" "), "%Y-%m-%d %H:%M:%S")

#Open the png device, set the filename, format size
dev.copy(png,file="plot3.png", width=480, height=480)
#Plot a line graph of the first submeter and set the y axis label
plot(use$DateTime,use$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
#Plot a second line for submeter 2
lines(use$DateTime,use$Sub_metering_2,type="l", col="red")
#Plot a third line for submeter 3
lines(use$DateTime,use$Sub_metering_3,type="l", col="blue")
#Create and format the legend
legend("topright",lwd=1,lty=c(1,1,1),pch=c(NA,NA,NA),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Close png device
dev.off()



