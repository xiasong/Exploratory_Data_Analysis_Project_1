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

#plot 1
png('plot1.png', width = 480, height = 480)
with(data, hist(Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power'))
dev.off()