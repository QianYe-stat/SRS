
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SRS

<!-- badges: start -->

<!-- badges: end -->

The goal of SRS is to to take one or multiple simple random samples
(SRS) of the specified size from an assumed population which are
elements of a vector with length\>1, and return the summary statistics
including sample mean, sample standard deviation and etc.

The functions in SRS can additionally be used to illustrate the
asymptotic properties of estimates based on SRS, which is also known as
the central limit theorem.

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
#> [1] -2.277722
#> 
#> $sample.se
#> [1] 11.27697
#> 
#> $SRS
#>          [,1]     [,2]      [,3]     [,4]     [,5]     [,6]      [,7]     [,8]
#> [1,] 4.608637 -25.4964 -16.08403 4.805699 6.467874 4.429189 -3.997765 6.275218
#>           [,9]    [,10]
#> [1,] -9.617325 5.831679

# take 20 SRS from x of size=10, show.SRS=FALSE
SRSampling(x=pop.1, size=10, rep=20)
#> 20 runs of simple random sample of size 10 are drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> $sample.mean$values
#>  [1]  2.8693288 -5.6778496 -0.2209874 -3.5763417  0.1746583  1.5371569
#>  [7] -3.3641300  2.6447542 -4.4955537 -2.1030709 -1.4253396 -1.9256550
#> [13]  2.3372455 -5.3681150  0.5255376 -1.4940819 -3.7248119 -1.3989187
#> [19] -3.3979898  8.2052213
#> 
#> $sample.mean$mean
#> [1] -0.9939471
#> 
#> $sample.mean$se
#> [1] 3.37265
#> 
#> 
#> $sample.se
#> $sample.se$values
#>  [1]  5.484779 11.334022  9.328010 11.748013  9.367737  5.735899 11.741103
#>  [8] 11.382173 10.472959  6.942815  7.290888  8.488570  9.276400  7.489116
#> [15]  9.825964 10.489480  7.518920 13.828792  6.792248  8.387864
#> 
#> $sample.se$mean
#> [1] 9.146288
#> 
#> $sample.se$se
#> [1] 2.231561
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
#> [1] 4.247781
#> 
#> $sample.se
#> [1] 10.723

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
