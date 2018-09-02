# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: How much memory is available?


# How much memory is available? -------------------------------------------

whatPlatform <- Sys.info()['sysname']
if (whatPlatform == "windows") {
  memory.limit()
} else if (whatPlatform == "Darwin") {
  ncells <- gc()[1,2]
  vcells <- gc()[2,2]
  print(paste("available memory is", ncells + vcells, "megabytes"))
}
  
  
# memory commands ---------------------------------------------------------

memoryResults <- memory.profile()

object.size(UCS_Satellite_Database) # = 3176968 bytes or 3.1 MB
newobject <- UCS_Satellite_Database[ , 1:10]
object.size(newobject) # = 334400 bytes. Sized INCREASED?!?

# garbage collection & memory report
# generates a memory report - otherwise no need to run this
gc()


# Windows memory commands -------------------------------------------------
memory.size(UCS_Satellite_Database)

memory.limit()
# My windows machine returns...
# [1] 3551
# value is in megabytes. So the memory limit is 3551 megabytes 
