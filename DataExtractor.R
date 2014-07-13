# This script will be included in all 4 of the plot R files and will download and extract the
# necisary data if it hasn't already been done

#setwd("F:/Dogbert/Coursera/DataScience/04_ExploritoryDataAnalysis/W1/ExData_Plotting1")
data_loc = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_name = "EDA.W1.P1.Data.zip"

# if the .zip doesn't exist, let's download the .zip
if(!file.exists(data_name)) {
  download.file(data_loc, data_name, method="curl")
  unzip(data_name)
# otherwise let the user know it already exists
} else {
  print(paste(data_name, "already exists."))
}

# original data
full_data_file_name = "household_power_consumption.txt"

# extracted small data limited to 2007-02-01 through 2007-02-02
small_data_file_name = "household_power_consumption-20070201-20070202.txt"

# if we haven't already extracted the small data set, let's do it here
if(!file.exists(small_data_file_name)) {
  
  # the file seperator is ";"!
  full_data <- read.csv(fn_full_data, sep=";")
  
  # get some info about the data, 
  dim(full_data)
  str(full_data)
  head(full_data)
  names(full_data)
  
  # limit data to 02/01/2007-02/02/2007
  
  # convert the date to date fields so we can limit
  full_data$Date <- as.Date(full_data$Date,format="%d/%m/%Y")
  
  # testing data
  # start_date <- as.Date("2007-02-01")
  # end_date <- as.Date("2007-02-02")
  # test_date <- as.Date("2006-12-16")
  # 
  # test_data <- head(full_data)
  # derp <- test_data[test_data$Date==test_date,]
  # derp
  
  small_data <- full_data[which(full_data$Date >= start_date & full_data$Date <= end_date),]
  #dim(small_data)
  
  # test some date/time formatting
  #paste(small_data$Date, small_data$Time)
  #test_date_time <- strptime("2007-02-02 20:00:00", format="%Y-%m-%d %H:%M:%S")
  
  # convert the time
  # noticed by default it was using TODAY as the date in the time... that could mess up some things
  # pull in the date for the time so it's correct
  small_data$Time <- strptime(paste(small_data$Date, small_data$Time),format="%Y-%m-%d %H:%M:%S")
  #head(small_data)
  
  # write out table
  write.table(small_data, small_data_file_name)
} else {
  print(paste(small_data_file_name, "already exists."))
}
