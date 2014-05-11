data <- read.table("Projects/Coursera Johns Hopkins Data Science/Exploratory Data Analysis/household_power_consumption.txt", header=T, sep=";")
newDates=as.Date(data[,1],format='%d/%m/%Y')
data[,1]=newDates
tmp = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
newTmp=as.character(tmp[,3])
newTmp=as.numeric(newTmp)
tmp[,3] = newTmp

aVector <- as.vector(tmp[,3])
aTS <- ts(aVector)

png("Projects/Coursera Johns Hopkins Data Science/Exploratory Data Analysis/plot2.png",width=480,height=480,units="px")
plot(aTS, ylab="Global Active Power (kilowatts)")
dev.off()