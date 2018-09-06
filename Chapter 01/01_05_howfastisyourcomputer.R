# Copyright Mark Niemann-Ross, 2018
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: how fast is your computer?

install.packages("benchmarkme")
library(benchmarkme)

benchmark_io() # read/write to disk
get_cpu() # details about this processor

# this creates your benchmark and rank
bm_results <- benchmark_std() #generates a benchmark to compare
plot(bm_results)
upload_results(bm_results)
create_bundle(bm_results, filename = "results.rds")

# benchmarks for various machines
# https://jumpingrivers.shinyapps.io/benchmarkme/ 


