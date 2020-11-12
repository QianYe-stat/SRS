
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SRS

<!-- badges: start -->

<!-- badges: end -->

The goal of SRS is to to take one or multiple simple random samples
(SRS) of the specified size from an assumed population which are
elements of a vector with length\>1, and return the summary statistics
including sample mean, sample standard deviation and etc.

The function can additionally be used to illustrate the asymptotic
properties of estimates based on SRS, which is also known as the central
limit theorem.

## Installation

You can install SRS from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("QianYe-stat/SRS")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SRS)
## basic example code
###### informal tests #######
pop.1 <- rnorm(1000,0,10)
# take a SRS from x of size=10, show.SRS=TRUE
SRSampling(x=pop.1, size=10, show.SRS=T)
#> A simple random sample of size 10 is drawn from x
#> 
#> The SRS for each run of samplings are shown in the result
#> $sample.mean
#> [1] -1.180003
#> 
#> $sample.se
#> [1] 9.832794
#> 
#> $SRS
#>           [,1]      [,2]     [,3]     [,4]      [,5]     [,6]      [,7]
#> [1,] -12.63353 -6.893421 17.41241 4.802125 -17.63878 2.908383 0.7124298
#>           [,8]    [,9]     [,10]
#> [1,] 0.4984901 3.38188 -4.350019

# take 20 SRS from x of size=10, show.SRS=FALSE
SRSampling(x=pop.1, size=10, rep=20)
#> 20 runs of simple random sample of size 10 are drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> $sample.mean$values
#>  [1] -0.24320818 -5.83790648 -3.06537507 -1.81380859  2.35441271 -0.32915915
#>  [7]  2.22608241  4.17203032 -0.93460438 -1.42480055  0.11912099 -4.66482143
#> [13]  0.04127313  2.73457816 -2.89105693 -5.86231874  0.76386743 -5.33386561
#> [19] -1.89443701 -1.75015401
#> 
#> $sample.mean$mean
#> [1] -1.181708
#> 
#> $sample.mean$se
#> [1] 2.878956
#> 
#> 
#> $sample.se
#> $sample.se$values
#>  [1] 13.305966 12.973658  9.483352 10.858266  9.017044 10.754747  7.769652
#>  [8]  4.799055 13.479220  8.911850 11.430629  7.349442 11.912927 10.126348
#> [15]  9.410375  5.344596 12.104868  7.764034  9.534719  8.786752
#> 
#> $sample.se$mean
#> [1] 9.755875
#> 
#> $sample.se$se
#> [1] 2.431365
```

Some expected errors and warnings

``` r
## size>length(pop.2)
pop.2 <- rnorm(10,0,10)#
SRSampling(x=pop.2, size=15, rep=20) # error; not run
#> Error in SRSampling(x = pop.2, size = 15, rep = 20): size must be no greater than the length of x

## non-integer size
SRSampling(x=pop.2, size=5.8) # warning
#> Warning in SRSampling(x = pop.2, size = 5.8): size=5.8 is not an integer, and ceiling() function was applied.
#>  size=6 was used
#> A simple random sample of size 6 is drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> [1] 1.493088
#> 
#> $sample.se
#> [1] 9.292515

## x=numeric(0)
SRSampling(x=numeric(0), size=1) # error; not run
#> Error in SRSampling(x = numeric(0), size = 1): x must be a numeric vector with length >1
```

input with NA

``` r
## x with NA
pop.3 <- c(1,2,3,4,NA)
SRSampling(x=pop.3, size=5, na.rm=T)
#> Warning in SRSampling(x = pop.3, size = 5, na.rm = T): 
#> size is equal to the length of x
#> A simple random sample of size 5 is drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> [1] 2.5
#> 
#> $sample.se
#> [1] 1.290994
SRSampling(x=pop.3, size=5)
#> Warning in SRSampling(x = pop.3, size = 5): 
#> size is equal to the length of x
#> A simple random sample of size 5 is drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> [1] NA
#> 
#> $sample.se
#> [1] NA
```
