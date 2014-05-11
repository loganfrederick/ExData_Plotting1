data <- read.table("Projects/Coursera Johns Hopkins Data Science/Exploratory Data Analysis/household_power_consumption.txt", header=T, sep=";")

newDates=as.Date(data[,1],format='%d/%m/%Y')

data[,1]=newDates
tmp = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
newTmp=as.character(tmp[,3])
newTmp=as.numeric(newTmp)
tmp[,3] = newTmp

#dateVector <- as.vector(tmp[,1])
vectorOne <- as.vector(tmp[,7])
vectorTwo <- as.vector(tmp[,8])
vectorThree <- as.vector(tmp[,9])

tsOne <- ts(vectorOne)
tsTwo <- ts(vectorTwo)
tsThree <- ts(vectorThree)

png("Projects/Coursera Johns Hopkins Data Science/Exploratory Data Analysis/plot3.png",width=480,height=480,units="px")
ts.plot(tsOne, tsTwo, tsThree, col=c(rep("blue",0),rep("black",1),rep("red",2)), gpars=list(xlab="day",ylab="Energy Sub Metering"))
legend('topright', box.lwd=1, legend=names(tmp)[7:9], col = c('Black', 'Red', 'Blue'), lwd=rep(1, 3))
dev.off()

#ts.plot(tsOne, tsTwo, tsThree, col=c(rep("blue",3),rep("black",3),rep("red",3)), gpars=list(xlab="day",ylab="Energy Sub Metering"))

#plot(vectorOne)
#plot(vectorTwo)
#plot(vectorThree, ylab="Energy Sub Metering")

