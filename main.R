#************************************************************#
#*                BDSA 601 - Research Methods
#*                Assignment 3 - Project
#*                
#*  Team Members:
#*    1. Aisha Khalid
#*    2. Ahmed Khedr
#************************************************************#


#************************************************************#
#*  Reading & Visualize Data
#************************************************************#
bahrain = read.csv('bahrain.csv')

# Remove days which have no registered total cases
which_casesNotZero = bahrain$total_cases!=0
#* if a day comes in the middle with total cases as 0, will this cause a error in the analysis since this is time-based analysis?
bahrain = bahrain[which_casesNotZero,]

# Convert to Date data type
bahrain$date_asdate = as.Date(bahrain$date, "%m/%d/%Y")

# Study Time-frame (Study Data)
study_timeframe_start = min(bahrain$date_asdate)
study_timeframe_end = max(bahrain$date_asdate)
study_timeframe = study_timeframe_end - study_timeframe_start
study_timeframe

# KPIs
dateof_first_case = min(bahrain[which(bahrain$total_cases!=0),]$date_asdate)
dateof_first_death = min(bahrain[which(bahrain$total_deaths!=0),]$date_asdate)
