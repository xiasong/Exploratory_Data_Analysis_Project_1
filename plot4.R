# set up work directory
setwd('/Users/xiasong/Documents/Class_2016/Coursera/datasciencecoursera/Exploratory_Data_Analysis/')

#read txt data file, and extract the two days data from line 66636 
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, skip = 66636, nrows = 2880)

# name each columns of data
names(data) <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

#check the data file if correct
head(data)
tail(data)
str(data)

# combine date and time into one columns
data$Date_Time <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#plot 4
png('plot4.png',width = 480, height = 480)
par(mfrow = c(2,2))
with(data, plot(Date_Time, Global_active_power, ylab = 'Global Active Power', type = 'l'))
with(data, plot(Date_Time, Voltage, type = 'l'))
with(data, plot(Date_Time, Sub_metering_1, ylab = 'Energy Sub Metering', type = 'l'))
lines(data$Date_Time, data$Sub_metering_2, col = 'red')
lines(data$Date_Time, data$Sub_metering_3, col = 'blue')
legend('topright', lty = c(1,1,1), col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'))
with(data, plot(Date_Time, Global_reactive_power, ylab = 'Global Reactive Power', type = 'l'))
dev.off()