# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: R Programming in Data Science: High VOlume Data 


# Not Optimized -----------------------------------------------------------

if (nrow(ChickWeight) < 20)
{
  median(ChickWeight$weight)
} else
{
  max(ChickWeight$weight)
}


# Optimized ---------------------------------------------------------------

with(ChickWeight, ifelse(nrow(ChickWeight) < 20, median(weight), max(weight)))
