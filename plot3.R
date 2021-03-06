Sys.setlocale("LC_TIME", "English")
project1<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),fill=TRUE,na.strings="?")
project1<-subset(project1,Date=="1/2/2007"|Date=="2/2/2007")
project1$Date<-as.Date(project1$Date,format="%d/%m/%Y")
project1$DateTime<-paste(project1$Date,project1$Time)
project1$DateTime<-strptime(project1$DateTime,format=("%Y-%m-%d %H:%M:%S"))
plot(project1$DateTime,project1$Sub_metering_1,main="",type="l",xlab="",ylab="Energy sub metering")
lines(project1$DateTime,project1$Sub_metering_2,main="",type="l",col="red")
lines(project1$DateTime,project1$Sub_metering_3,main="",type="l",col="blue")
axis(1,at=1:3,lab=c("Thu","Fri","Sat"))
legend("topright",col=c("black","red","blue"),lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()