#Reading the data with variables and missing values
pwr<-read.table("D:/TEMP/power.txt", header=TRUE,sep = ";", na.strings="?")
#Define the Date variable as class=Date
pwr$Date=as.Date(pwr$Date, format = "%d/%m/%Y")
#Subsetting the dates we actually care about
use<-pwr[which(pwr$Date=="2007-2-1" | pwr$Date=="2007-2-2"),]
#Create a date-time variable
use$DateTime<-strptime(paste(use$Date,use$Time,sep=" "), "%Y-%m-%d %H:%M:%S")

#Open the png device, set the filename, format size
dev.copy(png,file="plot2.png", width=480, height=480)
#Plot a line of Global Active Power
plot(use$DateTime,use$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#Close png device
dev.off()


