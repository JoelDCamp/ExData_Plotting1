#Read data
hpc<-read.table("household_power_consumption.txt",
                header=TRUE,
                sep=";",
                na.strings="?",
                stringsAsFactors=FALSE)

#Create subset
hpc_sub<-hpc[(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007"),]

#Create png file
png("plot1.png",
    width=480,
    height=480,
    units="px")

#Create histogram of Global active power
plot1<-hist(hpc_sub$Global_active_power,
            breaks=15,col="red",
            main="Global Active Power",
            xlab="Global Active Power (kilowatts)",
            ylab="Frequency")

dev.off()