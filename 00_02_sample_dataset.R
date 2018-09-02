# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Sample Dataset for R Programming in Data Science: High Volume Data 

# https://www.ucsusa.org/nuclear-weapons/space-weapons/satellite-database

# load the data set if it isn't already here.
if (!file.exists("UCS_Satellite_Database")) {
  if (askYesNo(paste("Do you want to download this into", getwd()))) {
    download.file(
      "https://s3.amazonaws.com/ucs-documents/nuclear-weapons/sat-database/8-10-18-update/UCS_Satellite_Database_5-1-2018.txt",
      destfile = "UCS_Satellite_Database"
    )
  } else {
    print("Okay - file was not downloaded")
  }
}

readUCSSampleData <- function() {
  # import
  UCS_Satellite_Database <-
    read.delim("../UCS_Satellite_Database", 
               stringsAsFactors = FALSE,
               fileEncoding = "latin1")
  
  # clean
  UCS_Satellite_Database$Launch.Mass..kg.. <-
    as.numeric(gsub(",", "", UCS_Satellite_Database$Launch.Mass..kg..))
  UCS_Satellite_Database$Power..watts. <-
    as.numeric(gsub(",", "", UCS_Satellite_Database$Power..watts.))
  UCS_Satellite_Database$Apogee..km. <-
    as.numeric(gsub(",", "", UCS_Satellite_Database$Apogee..km.))
  UCS_Satellite_Database$Perigee..km. <-
    as.numeric(gsub(",", "", UCS_Satellite_Database$Perigee..km.))
  UCS_Satellite_Database$Class.of.Orbit <-
    as.factor(trimws(UCS_Satellite_Database$Class.of.Orbit))
}
# look at the file
nrow(UCS_Satellite_Database)
head(UCS_Satellite_Database)
