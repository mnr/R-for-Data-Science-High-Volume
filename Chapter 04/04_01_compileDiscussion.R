# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: R Programming in Data Science: High VOlume Data 

install.packages("Rcpp")
install.packages("Rtools")
library(Rcpp)

# Rcpp example ------------------------------------------------------------

cppFunction('int add(int x, int y) {
            int sum = x + y;
            return sum;
            }')

add(1,2)
