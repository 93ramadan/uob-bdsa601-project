#************************************************************#
#*  Plotting Predictions using Model
#************************************************************#

# Increase the X-axis and Y-axis to occupy real and predicted data
ProjectionCases_X_AxisLimit = c(TCTDperDay$day, ProjectedDayCounter)
ProjectionCases_Y_AxisLimit= c(TCTDperDay$total_cases, ProjectedTotalCases)

# Plot real and predicted data of Total Cases in one Graph
# Plot Real (Existing) Data
plot(total_cases ~ day, data = TCTDperDay,
     pch = 16, col = "darkgrey",
     xlim = range(ProjectionCases_X_AxisLimit), ylim = range(ProjectionCases_Y_AxisLimit),
     main = "Logistic Growth Model of COVID-19 in the Kingdom of Bahrain",
     xlab = "Days", ylab = "Total Cases")

# Add Model Prediction Data
lines(dayCounter,
      LogisticGrowthModel.CoEf[1] / (1+exp(-(dayCounter-LogisticGrowthModel.CoEf[2])/LogisticGrowthModel.CoEf[3])),
      col = "blue",
      lwd = 2)

# Add Model Projection Data
lines(ProjectedDayCounter, ProjectedTotalCases, col = "red", lwd = 2)

# Present actual data for projected period - extra - not required
# lines(ProjectedDayCounter, bahrain_forward[ProjectedDayCounter,]$total_cases, col = "purple", lwd = 2)
# plot(total_cases ~ day, data = bahrain_forward, pch = 16, col = "darkgrey", main = "Actual Data ", xlab = "Days", ylab = "Total Cases")

# Add Grid Lines to Plot
grid()

# Add Legend to Plot
legend("topleft",
       fill = c("darkgrey", "blue" ,"red"),
              c("Actual Cases","Predicted (Fitted) Cases","Projected Cases"))

