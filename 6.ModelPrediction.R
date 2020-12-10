#Step 4
#************************************************************#
#*  Generating & Plotting Predictions using Model
#************************************************************#
#*
#* Predicting the number of total cases for the next three months (90 days)
#* Specifically from 30th July 2020 to 16th October 2020
#* using the fitted logistic growth model 

#Predict the number of cases for three  months (90 days)
ProjectionPeriod = 90 #in days
Projected_DayCounter = (StudyTimeFrame.TotalDays +1) : (StudyTimeFrame.TotalDays +  ProjectionPeriod)
Projected_total_cases = predict(model,data.frame(dayCounter=Projected_DayCounter))


# increase the X-axis and Y-axis to occupies both real and predicted data
dayCounterLimit = c(TCTDperDay$day,Projected_DayCounter)
totalCasesLimit= c(TCTDperDay$total_cases,Projected_total_cases)

#Plotting both real and predicted data of total cases in one graph

plot(total_cases~day,data=TCTDperDay,pch=16,col="darkgrey",xlim=range(dayCounterLimit),ylim=range(totalCasesLimit),
     main="Logistic Growth Model of COVID-19 in Kingdom of Bahrain",xlab="Days",ylab="Total Cases")
lines(dayCounter,phi[1]/(1+exp(-(dayCounter-phi[2])/phi[3])),col="blue",lwd=2)
lines(Projected_DayCounter,Projected_total_cases,col="red",lwd=2)

grid( )
legend("topleft",fill=c("darkgrey","blue","red"),c("data","fitted model","projected cases"))


