# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Detecting and avoiding copying

# copying objects is the #1 issue related to memory and performance
# here's a way to avoid it.


# Demonstrate the problem: rbind copies data.frames -------------------------------------------

aDataFrame <- data.frame(apogee = as.numeric(UCS_Satellite_Database$Apogee..km.),
                         perigee = as.numeric(UCS_Satellite_Database$Perigee..km.),
                         orbit = UCS_Satellite_Database$Class.of.Orbit)

object.size(aDataFrame) # ~39352 bytes. Varies system by system

tracemem(aDataFrame)

anotherDataFrame <-
    data.frame(
      apogee = runif(1, min = 300, max = 900),
      perigee = runif(1, min = 187, max = 900),
      orbit = sample(c("LEO", "GEO", "MEO"), 1)
    )
aDataFrame <- rbind(aDataFrame, anotherDataFrame)

# this allows us to watch an object being copied

# (object numbers will change)
# tracemem[0x11cbb4878 -> 0x11bf87518]: rbind rbind 
# 0x...4878 copied to 0x...7518

# tracemem[0x11cbb4878 -> 0x11bf81a38]: rbind rbind 
# 0x...4878 copied, but discarded?

# tracemem[0x11bf87518 -> 0x11bf81cb8]: structure rbind rbind 
# 0x...4878 copied to 0x...7518 copied to 0x...1cb8

# tracemem[0x11bf81cb8 -> 0x11bf81d08]: structure rbind rbind 
# 0x...4878 copied to 0x...7518 copied to 0x...1cb8 copied to 0x...1d08

# tracemem[0x11bf81d08 -> 0x11bf77a88]: as.list.data.frame as.list vapply which .rs.frameCols .rs.toDataFrame <Anonymous>
# 0x...4878 copied to 0x...7518 copied to 0x...1cb8 copied to 0x...1d08 copied to 0x..7a88

# so we potentially have 5 copies * 79456 bytes = 397280 bytes

untracemem(aDataFrame)


# use data.table instead of data.frame -------------------------------------------------

install.packages("data.table")
library(data.table)

aDataTable <- data.table(apogee = as.numeric(UCS_Satellite_Database$Apogee..km.),
                         perigee = as.numeric(UCS_Satellite_Database$Perigee..km.),
                         orbit = UCS_Satellite_Database$Class.of.Orbit)

tracemem(aDataTable)
object.size(aDataTable) # ~39912 bytes or about

# add data to an existing row in aDataFrame
aDataTable[ 1, c("apogee", "perigee", "orbit")] <-
  data.table(apogee = runif(1, min = 300, max = 900),
    perigee = runif(1, min = 187, max = 900),
    orbit = sample(c("LEO", "GEO", "MEO"), 1)
  )
object.size(aDataTable) # 39352 bytes or about

untracemem(aDataFrame)

# this works for data.frames. 
# For other data structures, investigate pre-allocation of data structure
