## read in raw data from text file
rawdata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## subset data from first two days of February
subdata <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]

## define vector containing energy submetering from meter 1
meter1data <- as.numeric(as.vector.factor(subdata[,7]))

## define vector containing energy submetering from meter 2
meter2data <- as.numeric(as.vector.factor(subdata[,8]))

## define vector containing energy submetering from meter 3 (was not initially factor)
meter3data <- subdata[,9]

## define a vector of integers the length of GAPdata
points <-c(1:length(GAPdata))

yrange = range(c(meter1data, meter2data, meter3data))

windows(480,480)

png(filename = 'plot3.png', bg = "transparent")

## scatter plot of subdata 1 in the form of a connected line graph
plot(points, meter1data, type="o", pch="", bg=par("bg"), xlab = "", ylim = yrange, 
     ylab = "Energy sub metering", col = "black", xaxt = "n")

## add scatter plot of subdata 1 in the form of a connected line graph
lines(meter2data,col = "red")

## add scatter plot of subdata 1 in the form of a connected line graph
lines(meter3data,col = "blue")

## create a vector of x axis labels
xlabs <-c("Thu","Fri","Sat")

## create a vector of locations for x axis labels
xticks <- c(0,length(points)/2,length(points))

## relabel x axis
axis(side=1, at=xticks, labels=xlabs)

## create a vector of metering names for legend
legend <- colnames(subdata[,7:9])

## create a vector of colors for legend
col <- c("black","red","blue")

## create legend in top right of graph - adjust size with cex to match example plot
legend("topright", col = col, lwd = c(1,1,1), legend = legend, cex = 0.95)

dev.off()