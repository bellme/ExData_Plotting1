## read in raw data from text file
rawdata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")


## subset data from first two days of February
subdata <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]

## define vector containing Global active power values
GAPdata <- as.numeric(as.vector.factor(subdata[,3]))

## define vector containing global reactive power values
GRPdata <- as.numeric(as.vector.factor(subdata[,4]))

## create a vector containing the voltage values
voltage <- as.numeric(as.vector.factor(subdata[,5]))

## define vector containing energy submetering from meter 1
meter1data <- as.numeric(as.vector.factor(subdata[,7]))

## define vector containing energy submetering from meter 2
meter2data <- as.numeric(as.vector.factor(subdata[,8]))

## define vector containing energy submetering from meter 3 (was not initially factor)
meter3data <- subdata[,9]

## define a vector of integers the length of GAPdata
points <-c(1:length(GAPdata))

yrange = range(c(meter1data, meter2data, meter3data))

## create a vector of x axis labels
xlabs <-c("Thu","Fri","Sat")

## create a vector of locations for x axis labels
xticks <- c(0,length(points)/2,length(points))

## calulate the range of all metering data
yrange<-range(c(meter1data,meter2data,meter3data))

windows(480,480)

png(filename = 'plot4.png', bg = "transparent")

## create four panel plot window - this sets the value of cex to 0.83 argh!
par(mfrow=c(2,2))

## scatter plot of global active power in the form of a connected line graph
plot(points,GAPdata, type="l", pch="", bg=par("bg"), 
     ylab = "Global  Active Power", xaxt = "n", xlab="")

## relabel x axis
axis(side=1, at=xticks, labels=xlabs)

## scatter plot of Voltage in the form of a connected line graph
plot(points, voltage, type="l", pch="", bg=par("bg"), 
     ylab = "Voltage", xaxt = "n", xlab="datetime")

## relabel x axis
axis(side=1, at=xticks, labels=xlabs)

## scatter plot of subdata 1 in the form of a connected line graph
plot(points, meter1data, type="l", pch="", bg=par("bg"), xlab = "", ylim = yrange, 
     ylab = "Energy sub metering", col = "black", xaxt = "n")

### adds subdata 2 in the form of a line
lines(meter2data,col = "red")

## adds subdata 3 in the form of a line
lines(meter3data,col = "blue")

## relabel x axis
axis(side=1, at=xticks, labels=xlabs)

## create a vector of metering names for legend
legend <- colnames(subdata[, 7:9])

## create a vector of colors for legend
col <- c("black","red","blue")

## create legend in top right of graph - adjust size with cex to match example plot
legend("topright", col = col, lwd = c(1,1,1), legend = legend, bty = "n", cex = 0.95)

#reset cex to value set by mfrow
par(cex = 0.83)

## scatter plot of global active power in the form of a connected line graph
plot(points,GRPdata, type="l", pch="", bg=par("bg"), 
     ylab = "Global_reactive_power", xaxt = "n", xlab="datetime")

## relabel x axis 
axis(side=1, at=xticks, labels=xlabs)

dev.off()