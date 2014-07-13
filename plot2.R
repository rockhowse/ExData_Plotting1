# plot2.R - this will plot the Global Active Power (Killowats vs Weekeday)
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

#line chart
# no title
# use line chart
# format Y with Day
# set Y lable

# save it to a 480x480 pixel png file
small_data_png_file_name = "plot2.png"
png(height=480, width=480, file=small_data_png_file_name)

with(small_data, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab=""))

# close png file
dev.off() 