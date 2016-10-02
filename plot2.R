plot2 <- function(){
        
        data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, dec = ".", stringsAsFactors = FALSE)
        main <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
        
        fixDates <- strptime(paste(main$Date, main$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        plotPoint <- as.numeric(main$Global_active_power)
        png("plot2.png", width = 480, height = 480)
        
        plot(fixDates, plotPoint, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
        
        dev.off()
}