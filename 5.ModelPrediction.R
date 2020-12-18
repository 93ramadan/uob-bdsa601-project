#************************************************************#
#*  Generating Predictions & Projections using Model
#************************************************************#

# Define Projection Time Frame based on Research Scope (Number of Days)
ProjectionTimeFrame.Start = StudyTimeFrame.End + 1 # R treats dates as exclusive - so we need to force push it to the next day
ProjectionTimeFrame.End = StudyTimeFrame.End + days(ResearchScope.NumberofDays) # R treats dates as exclusive - so we add from the end of study time frame (it will be excluded)
ProjectionTimeFrame.TotalDays = as.numeric((ProjectionTimeFrame.End - StudyTimeFrame.End), units="days") # R treats dates as exclusive so we subtract projection end from study end

print(paste("The projection time frame starts from", ProjectionTimeFrame.Start,
            "until", ProjectionTimeFrame.End,
            "covering", ProjectionTimeFrame.TotalDays ,"days."))

# Generate Projection Day Counter
ProjectedDayCounter = (StudyTimeFrame.TotalDays + 1) : ((StudyTimeFrame.TotalDays) + (ResearchScope.NumberofDays))

# Generate Projection for Total Cases
ProjectedTotalCases = predict(LogisticGrowthModel, data.frame(dayCounter = ProjectedDayCounter))
