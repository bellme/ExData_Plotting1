## read in raw data from text file 
rawdata = read.table("household_power_consumption.txt", header = TRUE, sep = ";")


## subset data from first two days of February
subdata <- rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]

# define vector containing Global Active Power values
GAPdata <- as.numeric(as.vector.factor(subdata[,3]))

## define a vector of integers the length of GAPdata
points <-c(1:length(GAPdata))

## create a vector of x axis labels
xlabs <-c("Thu","Fri","Sat")

## create a vector of locations for x axis labels
xticks <- c(0,length(points)/2,length(points))

windows(480,480)

png(filename = 'plot2.png', bg = "transparent")

## scatter plot of global active power in the form of a connected line graph
plot(points,GAPdata, type="l", pch="", bg=par("bg"), 
     ylab = "Global  Active Power (kilowatts)", xaxt = "n", xlab="")

## relabel x axis
axis(side=1, at=xticks, labels=xlabs)

dev.off()