data <- read.table("Projects/Coursera Johns Hopkins Data Science/Exploratory Data Analysis/household_power_consumption.txt", header=T, sep=";")
newDates=as.Date(data[,1],format='%d/%m/%Y')
data[,1]=newDates
tmp = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
newTmp=as.character(tmp[,3])
newTmp=as.numeric(newTmp)
tmp[,3] = newTmp

chart1 <- function() {
  aVector <- as.vector(tmp[,3])
  aTS <- ts(aVector)
  plot(aTS, xlab="", ylab="Global Active Power (kilowatts)")
}

chart2 <- function() {
  aVector <- as.vector(tmp[,5])
  aTS <- ts(aVector)
  plot(aTS, xlab="datetime", ylab="Voltage")
}

chart3 <- function() {
  vectorOne <- as.vector(tmp[,7])
  vectorTwo <- as.vector(tmp[,8])
  vectorThree <- as.vector(tmp[,9])
  
  tsOne <- ts(vectorOne)
  tsTwo <- ts(vectorTwo)
  tsThree <- ts(vectorThree)
  
  ts.plot(tsOne, tsTwo, tsThree, col=c(rep("blue",0),rep("black",1),rep("red",2)), gpars=list(xlab="day",ylab="Energy Sub Metering"))
  legend('topright', box.lwd=1, legend=names(tmp)[7:9], col = c('Black', 'Red', 'Blue'), lwd=rep(1, 3))
}

chart4 <- function() {
  aVector <- as.vector(tmp[,4])
  aTS <- ts(aVector)
  plot(aTS,  xlab="datetime", ylab="Global_reactive_power")
}

png("Projects/Coursera Johns Hopkins Data Science/Exploratory Data Analysis/plot4.png",width=480,height=480,units="px")

par(mfcol=c(2,2))
for (i in 1:4){
  if (i == 1) {
    chart1()
  } 
  else if (i == 2) {
    chart3()
  }
  else if (i == 3) {
    chart2()
  }
  else {
    chart4()
  }
}
dev.off()