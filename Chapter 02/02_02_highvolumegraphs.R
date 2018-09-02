# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Plots for use with high-volume data

# main point - look for plot types that summarize & group

hist(UCS_Satellite_Database$Expected.Lifetime..yrs..,
     main = "Expected Lifetime")

smoothScatter(UCS_Satellite_Database$Expected.Lifetime..yrs..,
              main = "Expected Lifetime",
              ylab = "years")

boxplot(UCS_Satellite_Database$Expected.Lifetime..yrs.. ~ UCS_Satellite_Database$Country.Org.of.UN.Registry,
        main = "Expected Lifetime by Country",
        ylab = "years",
        las = 2)

dotchart(table(UCS_Satellite_Database$Country.Org.of.UN.Registry))

smoothScatter(x = UCS_Satellite_Database$Expected.Lifetime..yrs..,
              y = UCS_Satellite_Database$Launch.Mass..kg..,
              main = "Expected Lifetime",
              xlab = "years",
              ylab = "launch mass")

# different function, same plot but with a smoothed curve
scatter.smooth(x = UCS_Satellite_Database$Expected.Lifetime..yrs..,
               y = UCS_Satellite_Database$Launch.Mass..kg..,
               main = "Expected Lifetime",
               xlab = "years",
               ylab = "launch mass")

# subsetUCSSat <- UCS_Satellite_Database[ , c("Country.Org.of.UN.Registry", "Date.of.Launch")]
# tabUCSSat <- table(subsetUCSSat)
# 
# heatmap(table(subsetUCSSat))
# 
# with(UCS_Satellite_Database,
#      heatmap(matrix(Expected.Lifetime..yrs..)))
#      

