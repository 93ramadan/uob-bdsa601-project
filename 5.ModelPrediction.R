#************************************************************#
#*  Generating Predictions & Projections using Model
#************************************************************#

# Define Projection Time Frame based on Research Scope (Number of Days)
ProjectionTimeFrame.Start = StudyTimeFrame.End + 1
ProjectionTimeFrame.End = ProjectionTimeFrame.Start + ResearchScope.NumberofDays
ProjectionTimeFrame.TotalDays = as.numeric((ProjectionTimeFrame.End - ProjectionTimeFrame.Start), units="days")

# Generate Projection Day Counter
ProjectedDayCounter = (StudyTimeFrame.TotalDays + 1) : ((StudyTimeFrame.TotalDays) + (ResearchScope.NumberofDays))

# Generate Projection for Total Cases
ProjectedTotalCases = predict(LogisticGrowthModel, data.frame(dayCounter = ProjectedDayCounter))