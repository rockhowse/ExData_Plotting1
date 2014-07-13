# plot3.R - this will plot the Energy sub metering (3 separate plots, same graph)
setwd("F:/Dogbert/Coursera/DataScience/04_ExploritoryDataAnalysis/W1/ExData_Plotting1")

# The included R script below will download/extract the data necissary for this plot
# after it's complete there should be the following file written out using write.csv():
#
#    household_power_consumption-20070201-20070202.csv
#
# it also includes the file name that was written out in the variable: 
#
#    small_data_file_name
#
# If a previous plot script has downloaded/extracted the data you should see this in console
#
#    > source("DataExtractor.R")
#    [1] "EDA.W1.P1.Data.zip already exists."
#    [1] "household_power_consumption-20070201-20070202.csv already exists."
#    >
#
source("DataExtractor.R")

# read in the extracted data set
small_data <- read.csv(small_data_file_name, stringsAsFactors=F)
names(small_data)
str(small_data)

# have to re-convert time to date/time
small_data$Time <- strptime(small_data$Time,format="%Y-%m-%d %H:%M:%S")

# adjust the margins (remove bottom so X is trimmed off)
par(mar = c(2,4,2,2))
#windows(width=480, height=480)

#3 line charts
# no title
# set Y lable
# no X label
# use line chart sm1
# add points for sm2
# add poitns for sm3
# add legend

# now save it to a 480x480 png
small_data_png_file_name = "plot3.png"
png(height=480, width=480, file=small_data_png_file_name)

with(small_data, plot(Time, Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab=""))
with(small_data, points(Time, Sub_metering_2, col="red", type="l"))
with(small_data, points(Time, Sub_metering_3, col="blue", type="l"))

# don't know how to make the symbol "longer" going to use the "-"character for now
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1, ","Sub_metering_2","Sub_metering_3"))

# close png file
dev.off() 