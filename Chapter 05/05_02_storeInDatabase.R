# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: store and access data in a database

# for demonstration, using SQLite

# SQLite support
# install.packages("RSQLite")
library(DBI)
# SQLite: max db size = 140 Tbytes

SQLiteIsHere <- "05_02_associatedFiles/ucs_satellite.db" # could also be ":memory:"
mySQLiteDB <- dbConnect(RSQLite::SQLite(),SQLiteIsHere)

# add extended math functions
RSQLite::initExtension(mySQLiteDB)


# Compare RAM access vs file access vs sql access -------------------------

# access from data.frame
randomMedianDF <- function() {
  median(sample(UCS_Satellite_Database$Launch.Mass..kg.., size = 100), na.rm = TRUE)
}

# access from file on disk
library(readr)

randomMedianFile <- function() {
  SatDat <- read_tsv("../UCS_Satellite_Database", )
  median(sample(SatDat$`Launch Mass (kg.)`, size = 100), na.rm = TRUE)
}

# access from database
randomMedianSQL <- function() {
  do_this_sqlite <- "
    SELECT `Launch Mass (kg.)`
    FROM satellites
    WHERE `Launch Mass (kg.)` != ''
    ORDER BY RANDOM()
    LIMIT 100
  "
  
  returnDF <- dbGetQuery(mySQLiteDB,do_this_sqlite)
  return(median(returnDF$`Launch Mass (kg.)`))
}

# Profiling ---------------------------------------------------------------

# profvis shows memory use. 16x for file over SQL
# reason - all SQL processing done outside of R.
# results saved as profvis-DFvsFilevsSQL.Rprofvis
library(profvis)
profvis({
  randomMedianDF()
  randomMedianFile()
  randomMedianSQL()
})

# microbenchmark shows cpu use. file > SQL
library(microbenchmark)

benchmarkresults <- microbenchmark(
  DataFrame = randomMedianDF(),
  File = randomMedianFile(),
  SQL = randomMedianSQL()
)

boxplot(benchmarkresults)
