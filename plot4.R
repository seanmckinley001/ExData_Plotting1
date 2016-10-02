plot4 <- function(){
        
        data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, dec = ".", stringsAsFactors = FALSE)
        main <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
        
        fixDates <- strptime(paste(main$Date, main$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        Act <- as.numeric(main$Global_active_power)
        React <- as.numeric(main$Global_reactive_power)
        Volt <- as.numeric(main$Voltage)
        subMet1 <- as.numeric(main$Sub_metering_1)
        subMet2 <- as.numeric(main$Sub_metering_2)
        subMet3 <- as.numeric(main$Sub_metering_3)
        
        png("plot4.png", width = 480, height = 480)
        par(mfrow = c(2, 2))
        
        plot(fixDates, Act, xlab = "", ylab = "Global Active Power", type = "l")
        
        plot(fixDates, Volt, ylab = "Voltage", xlab = "datetime", type = "l")
        
        plot(fixDates, subMet1, type="l",ylab="Energy Submetering",xlab="")
        lines(fixDates, subMet2, type="l",col="red")
        lines(fixDates, subMet3, type="l",col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2.5, bty = "n")
        
        plot(fixDates, React, ylab= "Global_reactive_power", xlab = "datetime", type = "l")
        
        dev.off()
}