# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Trellis graphs

# clean up data
ucsWithNA <-
  UCS_Satellite_Database[, c(
    "Launch.Mass..kg..",
    "Expected.Lifetime..yrs..",
    "Country.Org.of.UN.Registry",
    "Power..watts."
  )]
ucsWONR <- ucsWithNA[!startsWith(ucsWithNA$Country.Org.of.UN.Registry, c("NR")),]
ucsNoNA <- ucsWONR[complete.cases(ucsWONR),]

smoothScatter(
  x = ucsNoNA$Expected.Lifetime..yrs..,
  y = ucsNoNA$Launch.Mass..kg..,
  main = "Expected Lifetime",
  xlab = "years",
  ylab = "launch mass"
)

library(lattice)
trellis.device()

xyplot(
  Launch.Mass..kg.. ~ Expected.Lifetime..yrs.. ,
  data = ucsNoNA,
  main = "Expected Lifetime",
  xlab = "years",
  ylab = "launch mass"
)

xyplot(
  Launch.Mass..kg.. ~ Expected.Lifetime..yrs.. |
    Country.Org.of.UN.Registry,
  data = ucsNoNA,
  main = "Launch Mass vs Lifetime vs Country",
  xlab = "years",
  ylab = "launch mass"
)

cloud(
  Launch.Mass..kg.. ~ Expected.Lifetime..yrs.. * Power..watts. |
    Country.Org.of.UN.Registry,
  data = ucsNoNA,
  main = "Launch Mass vs Lifetime vs Power vs Country",
  xlab = "years",
  ylab = "kg",
  zlab = "watts"
)
