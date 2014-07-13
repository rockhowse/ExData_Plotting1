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
small_data <- read.csv(small_data_file_name)
names(small_data)

# adjust the margins
par(mar = c(4,4,2,0))

#histogram
# set title
# set X lable
# set color
hist(small_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)", col="red")

# save it to a 480x480 pixel png file
small_data_png_file_name = "plot1.png"
png(height=480, width=480, file=small_data_png_file_name)

hist(small_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)", col="red")

# close png file
dev.off() 