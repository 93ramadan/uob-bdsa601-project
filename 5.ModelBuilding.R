# Step 3
#************************************************************#
#*  Build Logistic Growth Model using Existing Data
#************************************************************#

#The predicted number of cases over days is obtained using 
#the logistic growth model defined as
# 𝒚=𝝋𝟏𝟏+𝒆−(𝒕 − 𝝋𝟐𝝋𝟑) 

#This model is used based on the exponential growth of the existing data the best 
#model is the logistic growth model for its ability of limit the increase to a value
#(population) rather than increasing to infinite.

#y is the number of cases at day t
# phi1 is the upper limit (maximum) for y 
# 1/phi3 is a non-negative value represents the daily growth rate
#---------------------------------------------------------------#
# 
model = nls(total_cases~SSlogis(dayCounter,phi1,phi2,phi3),data=TCTDperDay)
summary(model)

# calculating the growth rate of the cases:

phi = coef(model)
DailyGrowthRate = round((1/phi[3] ), 3)
print(paste("The growth rate of the cases is ", DailyGrowthRate))
