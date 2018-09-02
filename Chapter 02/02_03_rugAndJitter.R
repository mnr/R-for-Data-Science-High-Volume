# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: demonstrate rug and jitter

# rug ---------------------------------------------------------------------

# rug indicates where values actually sit
hist(UCS_Satellite_Database$Expected.Lifetime..yrs..,
     main = "Expected Lifetime with rug",
     xlab = "Years")
rug(UCS_Satellite_Database$Expected.Lifetime..yrs..,
    col = "red")

hist(UCS_Satellite_Database$Expected.Lifetime..yrs..,
     main = "Expected Lifetime with rug",
     xlab = "Years")
rug(fivenum(UCS_Satellite_Database$Expected.Lifetime..yrs.., na.rm = TRUE),
    lwd = 3,
    col = "red")


# jitter ------------------------------------------------------------------

# jitter provides a way to indicate multiple values on the same point
head(UCS_Satellite_Database$Expected.Lifetime..yrs..)

head(jitter(UCS_Satellite_Database$Expected.Lifetime..yrs..))

hist(UCS_Satellite_Database$Expected.Lifetime..yrs..,
     main = "Expected Lifetime with jitter",
     xlab = "Years")
rug(jitter(UCS_Satellite_Database$Expected.Lifetime..yrs..),
    col = "red")


# combine rug and jitter --------------------------------------------------

smoothScatter(x = UCS_Satellite_Database$Expected.Lifetime..yrs..,
              y = UCS_Satellite_Database$Launch.Mass..kg..,
              main = "Expected Lifetime",
              xlab = "years",
              ylab = "launch mass")

rug(jitter(UCS_Satellite_Database$Expected.Lifetime..yrs..))

