# Step 5
#************************************************************#
#*  Calculate the total beds and total available beds as they 
#*  are important factors in assessing the hospitals capacity
#************************************************************#

total_beds1 = round(bahrain$hospital_beds_per_thousand[1]*bahrain$population[1]/1000,0) 
occupancy1 = 0.80 # as assumption from Dr. Sawsan
available_beds1 = round(total_beds1*(1-occupancy1),0)

total_beds2 = 9746 # at isolation and quarantine centers 
occupancy2 = 0.38 # calculated upon the number of beds mentioned by M.MOH in AlArabia Article
available_beds2 = round(total_beds2*(1-occupancy2),0)

total_beds = total_beds1 + total_beds2 
total_available_beds = available_beds1 + available_beds2

total_beds
total_available_beds
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# total_beds # 13149
# available_beds # 6724
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#