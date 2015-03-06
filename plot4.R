#Read data
hpc<-read.table("household_power_consumption.txt",
                header=TRUE,
                sep=";",
                na.strings="?",
                stringsAsFactors=FALSE)

#Create subset
hpc_sub<-hpc[(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007"),]

#Create DateTime column as a Date/Time variable
Date<-hpc_sub$Date
Time<-hpc_sub$Time
DateTime<-paste(Date,Time,sep=" ")
DateTime<-strptime(DateTime,format="%d/%m/%Y %H:%M:%S")

#Add DateTime column to hpc_sub
hpc_bind<-cbind(hpc_sub,DateTime)

#Create png file
png("plot4.png",
    width=480,
    height=480,
    units="px")

#Create plots
par(mfrow=c(2,2))

##Plot 1
plot(hpc_bind$DateTime,
     hpc_bind$Global_active_power,
     type="l",
     col="black",
     main="",
     xlab="",
     ylab="Global Active Power")

##Plot 2
plot(hpc_bind$DateTime,
     hpc_bind$Voltage,
     type="l",
     col="black",
     main="",
     xlab="datetime",
     ylab="Voltage")

##Plot 3
plot(hpc_bind$DateTime,
     hpc_bind$Sub_metering_1,
     type="l",
     col="black",
     main="",
     xlab="",
     ylab="Energy sub metering")

lines(hpc_bind$DateTime,
      hpc_bind$Sub_metering_2,
      type="l",
      col="red")

lines(hpc_bind$DateTime,
      hpc_bind$Sub_metering_3,
      type="l",
      col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue"))

##Plot 4
plot(hpc_bind$DateTime,
     hpc_bind$Global_reactive_power,
     type="l",
     col="black",
     main="",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()