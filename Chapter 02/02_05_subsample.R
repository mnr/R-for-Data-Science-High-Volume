# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: subsampling data


# sample() ------------------------------------------------------------------

useTheseRows <- sample(1:nrow(UCS_Satellite_Database), 100)
smallUCS <- UCS_Satellite_Database[useTheseRows , ]
# note: can't just sample(UCS_Satellite_Database). 
# Sample returns a vector, not dataframe

smoothScatter(
  x = smallUCS$Expected.Lifetime..yrs..,
  y = smallUCS$Launch.Mass..kg..,
  main = paste(nrow(smallUCS), "Points: Expected Lifetime"),
  xlab = "years",
  ylab = "launch mass"
)

# approx() ------------------------------------------------------------------
approxPoints <- approx(UCS_Satellite_Database$Expected.Lifetime..yrs..,
                       UCS_Satellite_Database$Launch.Mass..kg..)

# scatterplot with approximated points

smoothScatter(
  x = approxPoints[["x"]],
  y = approxPoints[["y"]],
  main = paste(length(approxPoints[["x"]]), "Points: Expected Lifetime"),
  xlab = "years",
  ylab = "launch mass"
)

# original scatterplot + approxPoints as line
smoothScatter(
  x = UCS_Satellite_Database$Expected.Lifetime..yrs..,
  y = UCS_Satellite_Database$Launch.Mass..kg..,
  main = paste(length(approxPoints[["x"]]), "Points: Expected Lifetime"),
  xlab = "years",
  ylab = "launch mass"
)
lines(approxPoints)

# method can be linear or constant
approxPoints <- approx(UCS_Satellite_Database$Expected.Lifetime..yrs..,
                       UCS_Satellite_Database$Launch.Mass..kg..,
                       method = "constant")


# spline() ------------------------------------------------------------------
splinePoints <- spline(UCS_Satellite_Database$Expected.Lifetime..yrs..,
              UCS_Satellite_Database$Launch.Mass..kg..)

# just the spline points plotted
smoothScatter(
  x = splinePoints[["x"]],
  y = splinePoints[["y"]],
  main = paste(length(splinePoints[["x"]]), "Points: Expected Lifetime"),
  xlab = "years",
  ylab = "launch mass"
)

# original scatterplot combined with line plot for spline
smoothScatter(
  x = UCS_Satellite_Database$Expected.Lifetime..yrs..,
  y = as.numeric(UCS_Satellite_Database$Launch.Mass..kg..),
  main = paste(length(splinePoints[["x"]]), "Points: Expected Lifetime"),
  xlab = "years",
  ylab = "launch mass"
)
lines(splinePoints)




