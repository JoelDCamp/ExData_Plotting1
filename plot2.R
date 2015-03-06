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
png("plot2.png",
    width=480,
    height=480,
    units="px")

#Create plot of Global Active Power over DateTime
plot2<-plot(hpc_bind$DateTime,
            hpc_bind$Global_active_power,
            type="l",
            col="black",
            main="",
            xlab="",
            ylab="Global Active Power (kilowatts)")
  
dev.off()