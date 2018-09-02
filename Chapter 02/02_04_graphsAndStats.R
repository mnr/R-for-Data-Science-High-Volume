# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Plots for use with high-volume data


# Linear Regression Model -------------------------------------------------

# linear regression models look for relationships between variables and outcome
MyResponse <- UCS_Satellite_Database$Expected.Lifetime..yrs..
MyTerms <- UCS_Satellite_Database$Launch.Mass..kg..
  
launchMasstoLifeLM <- lm(MyResponse ~ MyTerms)
launchMasstoLifeLM # hmm...not much correspondence

# Let's plot this to see what it looks like
smoothScatter(x = UCS_Satellite_Database$Expected.Lifetime..yrs..,
              y = UCS_Satellite_Database$Launch.Mass..kg..,
              main = "Expected Lifetime",
              xlab = "years",
              ylab = "launch mass")
abline(lm(MyResponse ~ MyTerms))


# k-means clustering --------------------------------------------------------------

ucsWithNA <- UCS_Satellite_Database[ , c("Launch.Mass..kg..","Expected.Lifetime..yrs..")]
ucsNoNA <- ucsWithNA[ complete.cases(ucsWithNA), ]

ucs_cluster <- kmeans(ucsNoNA, centers = 5)

ucs_cluster

install.packages("cluster")
library(cluster)

clusplot(ucsNoNA, ucs_cluster$cluster,
         main = "Lifetime to Mass Clusters",
         xlab = "Launch Mass",
         ylab = "Life Expectancy")


