## read in raw data from text file 
rawdata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")


## subset data from first two days of February
subdata <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]

## define vector containing Global Active Power values
GAPdata <- as.numeric(as.vector.factor(subdata[,3]))

windows(480,480)

png(filename = 'plot1.png', bg = "transparent")

## histogram of Global active power with name, axes labels and color changed
GAPhist <- hist(GAPdata, main="Global Active Power", xlab="Global Active Power (kilowatts)",
                ylab="Frequency", xlim = c(0,7.5), col = "orangered3")

dev.off()