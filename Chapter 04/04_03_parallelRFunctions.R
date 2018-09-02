# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Using parallel processing with R

# standard version of apply -----------------------------------------------------------
# create a column for expected end of life of satellite based on orbit

ExpectedEOLSatellite <- function(ucsSatObs) {
  dangerRatio <- switch(
    as.character(ucsSatObs[8]),
    elliptical = .1,
    GEO = .25,
    LEO = .5,
    MEO = .75,
    ... = 1
  )
  expectedLife <- ifelse(is.na(ucsSatObs[20]), 15, as.integer(ucsSatObs[20]))
  adjustedLife <- as.integer(expectedLife * 365 * dangerRatio)
  EOLdate <- as.Date(ucsSatObs[[19]], "%m/%d/%Y") + adjustedLife
  return(EOLdate)
}

UCS_Satellite_Database$ExpectEOL <- apply(UCS_Satellite_Database, 1, ExpectedEOLSatellite)

# parallel version of apply ----------------------------------------------

library(parallel)

detectCores() # identifies number of available cores
myCluster <- makeCluster(detectCores())

parApply(cl = myCluster, UCS_Satellite_Database, 1, ExpectedEOLSatellite)

# benchmark results -------------------------------------------------------

# install.packages("microbenchmark)
library(microbenchmark)

benchmarkresults <- microbenchmark(
  original = apply(UCS_Satellite_Database, 1, ExpectedEOLSatellite),
  parallel = parApply(cl = myCluster, UCS_Satellite_Database, 1, ExpectedEOLSatellite)
)

boxplot(benchmarkresults) # it takes LONGER to parallel process

# bigger data

bigUCS <- UCS_Satellite_Database

for(index in 1:20) {
  bigUCS <- rbind(bigUCS, UCS_Satellite_Database)
}

benchmarkresults <- microbenchmark(
  original = apply(UCS_Satellite_Database, 1, ExpectedEOLSatellite),
  parallel = parApply(cl = myCluster, UCS_Satellite_Database, 1, ExpectedEOLSatellite),
  bigUCSsingle = apply(bigUCS, 1, ExpectedEOLSatellite),
  bigUCSPar =  parApply(cl = myCluster, bigUCS, 1, ExpectedEOLSatellite)  
  )

boxplot(benchmarkresults) # it takes LONGER to parallel process
