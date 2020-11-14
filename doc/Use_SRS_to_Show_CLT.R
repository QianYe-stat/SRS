## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
# generate target population: pop
set.seed(123)
pop <- runif(10000, 0, 12)

# the histogram should be close to the uniform density
hist(pop)

# population mean; should be close to E(X)=6
mean(pop)

# population variance; should be close to Var(X)=12
var(pop)

## ----setup--------------------------------------------------------------------
library(SRS)
set.seed(123)
sample.10 <- SRSampling(pop, size=10, rep=1000)

# extract the sample means for every SRS
sample.10.means <- sample.10$sample.mean$values

# the histogram
hist(sample.10.means)

# mean of sample mean
sample.10$sample.mean$mean

# var of sample mean
sample.10$sample.mean$se^2

## -----------------------------------------------------------------------------

set.seed(123)
sample.100 <- SRSampling(pop, size=100, rep=1000)

# extract the sample means for every SRS
sample.100.means <- sample.10$sample.mean$values

# the histogram
hist(sample.100.means)

# mean of sample mean
sample.100$sample.mean$mean

# var of sample mean
sample.100$sample.mean$se^2

