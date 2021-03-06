#************************************************************#
#*  Display Factor Figures & Plots
#************************************************************#

print(paste("The current hospitalization rate is =", round(Factors.Current.HospitalizationRate ,2)))
print(paste("The total beds in the Kingdom of Bahrain are =", Factors.Overall.TotalBeds))
print(paste("The available beds in the Kingdom of Bahrain are =", Factors.Overall.AvailableBeds))

#************************************************************#
#*  Display Separate Plots
#************************************************************#

# Prepare plot area for side-by-side view
par(mfrow=c(1,3))

# Plot Projected Total Cases
plot(ProjectedDayCounter,
     ProjectedTotalCases,
     pch = 19, col = "blue",
     xlab = "Projected Time (3 months)", ylab = "Projected COVID-19 Cases")
# Add Grid Lines to Plot
grid()

# Plot Projected Hospitalized Cases
plot(ProjectedDayCounter,
     Factors.Projected.HospitalizedCases,
     pch = 19, col = "red",
     xlab = "Projected Time (3 months)", ylab = "Projected Hospitalized COVID-19 Cases")
# Add Grid Lines to Plot
grid()

# Plot Available Beds
plot(ProjectedDayCounter,
     Factors.Projected.AvailableBeds,
     pch = 19, col = "purple",
     xlab = "Projected Time (3 months)", ylab = "Projected Available Beds")
# Add Grid Lines to Plot
grid()

#************************************************************#
#*  Display Separate Plots
#************************************************************#

# Prepare plot area for side-by-side view
par(mfrow=c(1,2))

# Plot Projected Total Cases
plot(ProjectedDayCounter,
     ProjectedTotalCases,
     pch = 20, col = "blue",
     xlab = "Projected Time (3 months)", ylab = "Projected COVID-19 Cases")
# Add Grid Lines to Plot
grid()

# Plot Projected Hospitalized Cases
plot(ProjectedDayCounter,
     Factors.Projected.HospitalizedCases,
     pch = 20, col = "red",
     xlab = "Projected Time (3 months)", ylab = "Projected Hospitalized COVID-19 Cases")
# Add Grid Lines to Plot
grid()

#************************************************************#
#*  Display Separate Plots
#************************************************************#

# Prepare plot area for side-by-side view
par(mfrow=c(1,2))

# Plot Projected Hospitalized Cases
plot(ProjectedDayCounter,
     Factors.Projected.HospitalizedCases,
     pch = 20, col = "red",
     xlab = "Projected Time (3 months)", ylab = "Projected Hospitalized COVID-19 Cases")
# Add Grid Lines to Plot
grid()

# Plot Available Beds
plot(ProjectedDayCounter,
     Factors.Projected.AvailableBeds,
     pch = 20, col = "purple",
     xlab = "Projected Time (3 months)", ylab = "Projected Available Beds")
# Add Grid Lines to Plot
grid()

#************************************************************#
#*  Display Combined Plots (Hospitalized Cases & Available Beds)
#************************************************************#

# Increase the Y-axis to occupy Hospitalized Cases vs. Available Beds
ProjectionCases_Y_AxisLimit= c(Factors.Projected.HospitalizedCases, Factors.Projected.AvailableBeds)

# Prepare plot area for one plot
par(mfrow=c(1,1))

# Plot Projected Hospitalized Cases
plot(ProjectedDayCounter,
     Factors.Projected.HospitalizedCases,
     pch = 20, col = "red",
     ylim = range(ProjectionCases_Y_AxisLimit),
     xlab = "Projected Time (3 months)", ylab = "COVID-19 Cases/Available Beds")

# Add Projected Available Beds (Available Beds - Hospitalized Cases)
points(ProjectedDayCounter,
       Factors.Projected.AvailableBeds,
       pch = 20, col = "purple")
# Add Grid Lines to Plot
grid()

# Add Legend to Plot
legend("center",
       fill = c("red" ,"purple"),
       c("Hospitalized Cases","Available Beds"))

#************************************************************#
#*  Display Combined Plots (Total Cases & Hospitalized Cases & Available Beds)
#************************************************************#

# Increase the Y-axis to occupy Projected Cases vs. Hospitalized Cases
ProjectionCases_Y_AxisLimit= c(Factors.Projected.HospitalizedCases, ProjectedTotalCases)

# Prepare plot area for one plot
par(mfrow=c(1,1))

# Plot Projected Total Cases
plot(ProjectedDayCounter,
     ProjectedTotalCases,
     pch = 20, col = "blue",
     ylim = range(ProjectionCases_Y_AxisLimit),
     xlab = "Projected Time (3 months)", ylab = "COVID-19 Cases")
# Add Grid Lines to Plot
grid()

# Add Projected Hospitalized Cases
points(ProjectedDayCounter,
      Factors.Projected.HospitalizedCases,
      pch = 20, col = "red")

# Add Projected Available Beds (Available Beds - Hospitalized Cases)
points(ProjectedDayCounter,
       Factors.Projected.AvailableBeds,
       pch = 20, col = "purple")

# Add Legend to Plot
legend("center",
       fill = c("blue", "red" ,"purple"),
       c("Projected Cases","Hospitalized Cases","Available Beds"))
