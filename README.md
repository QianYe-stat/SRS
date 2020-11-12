
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
#> [1] -1.346722
#> 
#> $sample.se
#> [1] 10.89271
#> 
#> $SRS
#>          [,1]      [,2]      [,3]      [,4]     [,5]      [,6]       [,7]
#> [1,] 16.63996 -6.739872 -11.66441 -2.716868 9.321108 -15.80919 -0.3498162
#>          [,8]    [,9]     [,10]
#> [1,] -5.55034 12.8077 -9.405489

# take 20 SRS from x of size=10, show.SRS=FALSE
SRSampling(x=pop.1, size=10, rep=20)
#> 20 runs of simple random sample of size 10 are drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> $sample.mean$values
#>  [1] -1.07509575  2.80297001  0.51181942  2.52677251  3.32956330 -0.50495907
#>  [7] -4.33395497 -1.53840674  2.21213018 -5.35249795 -0.18188073  2.22242190
#> [13]  3.88172422 -1.73907884 -0.04385333  1.84835117 -5.62323469 -0.98114436
#> [19]  3.44911268  1.62600542
#> 
#> $sample.mean$mean
#> [1] 0.1518382
#> 
#> $sample.mean$se
#> [1] 2.854709
#> 
#> 
#> $sample.se
#> $sample.se$values
#>  [1] 11.002900  8.213820 11.799953  8.994506 10.479121  6.132662 11.122730
#>  [8]  7.993642  5.861777  8.273720  7.072097  9.783763 11.663366  8.429760
#> [15] 11.278754  8.784391  6.008607  7.873832  6.385284  9.256327
#> 
#> $sample.se$mean
#> [1] 8.820551
#> 
#> $sample.se$se
#> [1] 1.949867
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
#> [1] -6.706779
#> 
#> $sample.se
#> [1] 8.069346

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
