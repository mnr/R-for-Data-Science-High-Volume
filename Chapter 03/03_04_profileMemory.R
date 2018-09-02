# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: profile tools to identify memory issues

# r documentation at https://developer.r-project.org/memory-profiling.html

# profmem -----------------------------------------------------------------

install.packages("profmem")
library(profmem)

memoryResults <- profmem(UCS_Satellite_Database <- read.delim("UCS_Satellite_Database", stringsAsFactors = FALSE))

head(memoryResults) # display operations and memory used

# This is memory allocated for operations - not memory finally used...
sum(memoryResults$bytes) # 12368375 bytes
# ...which is approx 3x the size of the final object...
object.size(UCS_Satellite_Database) # 3322752 bytes

# this is useful to tell you where/when memory is being used


# tracemem ----------------------------------------------------------------
# alert when objects are copied
# is this enabled?
capabilities()["profmem"]

# demonstrate that nothing happens
UCS_Satellite_Database$newColumn <- runif(nrow(UCS_Satellite_Database))

tracemem(UCS_Satellite_Database) # turn on tracing

# now an alert is issued
UCS_Satellite_Database$newColumn <- runif(nrow(UCS_Satellite_Database))

untracemem(UCS_Satellite_Database) # turn off alert

tracingState() # is tracing on?
