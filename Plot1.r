#Reading the data with variables and missing values
pwr<-read.table("D:/TEMP/power.txt", header=TRUE,sep = ";", na.strings="?")
#Define the Date variable as class=Date
pwr$Date=as.Date(pwr$Date, format = "%d/%m/%Y")
#Subsetting the dates we actually care about
use<-pwr[which(pwr$Date=="2007-2-1" | pwr$Date=="2007-2-2"),]

#Open the png device, set the filename, format size
dev.copy(png,file="plot1.png", width=480, height=480)
#Plot a histogram of Global Active Power
hist(use$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#Close png device
dev.off()