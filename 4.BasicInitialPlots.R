#************************************************************#
#*  Basic Initial Plots of Data Figures (Cases & Deaths)
#************************************************************#

dayCounter = 1 : StudyTimeFrame.TotalDays
TCTDperDay = data.frame(cbind("day" = dayCounter, "total_cases" = bahrain$total_cases, "total_deaths" = bahrain$total_deaths))

InitialPlots.TotalCases = ggplot(TCTDperDay, aes(x = dayCounter)) + ggtitle("Kingdom of Bahrain") +
  geom_area(aes(y = total_cases), fill = "blue", alpha = 0.2) +
  geom_line(aes(x = time, y = total_cases), color = "blue") +
  xlab(paste("Time Period:", format(StudyTimeFrame.Start, "%d %B %Y"), "–" , format(StudyTimeFrame.End, "%d %B %Y"))) +
  ylab("Total Cases")


InitialPlots.TotalDeaths = ggplot(TCTDperDay, aes(x = dayCounter)) + ggtitle("Kingdom of Bahrain") +
  geom_area(aes(y = total_deaths), fill = "black", alpha = 0.2) +
  geom_line(aes(x = time, y = total_deaths), color = "black") +
  xlab(paste("Time Period:", format(StudyTimeFrame.Start, "%d %B %Y"), "–" , format(StudyTimeFrame.End, "%d %B %Y")))+
  ylab("Total Deaths")

grid.arrange(InitialPlots.TotalCases, InitialPlots.TotalDeaths, nrow=1, ncol=2)