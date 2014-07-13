
# this R app will download/extract the data necissary for this plot
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
