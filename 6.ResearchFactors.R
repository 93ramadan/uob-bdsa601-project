#************************************************************#
#*  Calculate Factors related to Study
#************************************************************#

# Population of Bahrain (Extracted from Data)
Factors.Population = mean(bahrain$population)

#************************************************************#
#*  Hospital
#************************************************************#

# Hospital - Beds Per 1,000 Inhabitant (Extracted from Data)
Factors.Hospital.BPTI = mean(bahrain$hospital_beds_per_thousand)

# Hospital - Total Beds
Factors.Hospital.TotalBeds = round((Factors.Hospital.BPTI * Factors.Population / 1000), 0)

# Hospital - Bed Occupancy Rate
Factors.Hospital.BOR = ResearchAssumes.Hospital.BedOccupancyRate

# Hospital - Available Beds
Factors.Hospital.AvailableBeds = round((1 - Factors.Hospital.BOR) * Factors.Hospital.TotalBeds, 0)

#************************************************************#
#*  Isolation & Quarantine Centers (IQC)
#************************************************************#

# IQC - Total Beds
Factors.IQC.TotalBeds = ResearchAssumes.IQC.TotalBeds

# IQC - Bed Occupancy Rate
Factors.IQC.BOR = ResearchAssumes.IQC.BedOccupancyRate

# IQC - Available Beds
Factors.IQC.AvailableBeds = round((1 - Factors.IQC.BOR) * Factors.IQC.TotalBeds, 0)


#************************************************************#
#*  Overall (Hospital + IQC)
#************************************************************#

# Overall - Total Beds
Factors.Overall.TotalBeds = Factors.Hospital.TotalBeds + Factors.IQC.TotalBeds

# Overall - Available Beds
Factors.Overall.AvailableBeds = Factors.Hospital.AvailableBeds + Factors.IQC.AvailableBeds

#************************************************************#
#*  Current vs Projected (Cases & Hospitalized Cases)
#************************************************************#

# Current Hospitalization Rate
Factors.Current.HospitalizationRate = ResearchAssumes.Current.CasesUnderTreatment / ResearchAssumes.Current.ActiveCases

# Projected Hospitalized Cases based on Current Hospitalization Rate
Factors.Projected.HospitalizedCases = Factors.Current.HospitalizationRate * ProjectedTotalCases

# Projected Available Beds - Hospitalized Cases (that will need them)
Factors.Projected.AvailableBeds = Factors.Overall.AvailableBeds - Factors.Projected.HospitalizedCases