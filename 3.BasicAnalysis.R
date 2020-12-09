#************************************************************#
#*  Study Time-Frame
#************************************************************#

# Study Time-frame (Study Data)
StudyTimeFrame.Start = min(bahrain$date_asdate)
StudyTimeFrame.End = max(bahrain$date_asdate)
StudyTimeFrame.TotalDays = StudyTimeFrame$End - StudyTimeFrame$Start

# First Reportings (Case vs. Death)
dateof_first_case = min(bahrain[which(bahrain$total_cases!=0),]$date_asdate)
dateof_first_death = min(bahrain[which(bahrain$total_deaths!=0),]$date_asdate)
print(paste("The first case was reported on", dateof_first_case))
print(paste("The first death was reported on", dateof_first_death))