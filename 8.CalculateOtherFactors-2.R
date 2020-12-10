# Step 6
#******************************************************************#
#*  Calculate the hospitalization rate available as it is
#*  an important factor in assessing the hospitals capacity
#************************************************************# Using the reported number of active cases and those receiving 
#*  treatments, the hospitalization rate was estimated simply as 
#*  the ratio of the treated cased to active cases. Afterwards,
#*  the number of the predicted hospitalized cases was estimated.
#******************************************************************#


ActiveCases = 2832 # Ministry of Health 
Treatment = 81 # Ministry of Health

hospitalized = round(Treatment/ActiveCases,2) # hospitalized = 0.03
hospitalized_cases = hospitalized*Projected_total_cases

par(mfrow=c(1,2))

plot(Projected_DayCounter,Projected_total_cases,pch=20,col="blue", xlab="Projected Time (3 months)",ylab="Projected COVID-19 Cases")
grid( )

plot(Projected_DayCounter,hospitalized_cases,pch=20,col="red", xlab="Projected Time (3 months)",ylab="Projected Hospitalized COVID-19 Cases")
grid( )
text(180,1400,paste("Available Beds",total_available_beds),col="red")

#*suggestion:
#*combine them in one graph if possible


