
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

## Development of SRS

  - Initialize the package folder using
    `create_package("~/Mye.package/SRS")`
  - Initialize Git repo using `use_git()`.
  - Use `use_r("is_wholenumber")` and `use_r("SRSampling")` to create 2
    separate blank R script files. Copy and paste the codes for the 2
    functions from assignment-1b to the 2 R script files respectively.
  - Commit changes and run `check()`
  - Modify `DESCRIPTION`. Mostly manually but with
    `use_mit_license("Qian Ye")` to fill-in the license information.
  - Run `use_package("stats")` to add `stats` package to Import field in
    `DESCRIPTION` as `sd()` function from `stats` is used in my package.
  - Update my R codes with `sd` replaced by `stats::sd`.
  - Run `check()`, `install()` and then `library(SRS)`. It’s working\!
  - Create `tests` folder using `use_testthat()`
  - Create a test file using `use_test("SRSampling")` and write
    `test_that` functions to test `SRSampling` function.
  - Run `test()`. Passed\!
  - Update R codes with a specially formatted comment begin with `#'`.
    Run `document()` to generate corresponding `*.Rd` files. Try
    `?SRSampling`. It’s working\!
      - note that, I choose not to `@export` for the `is_wholenumber`
        function. Because it’s sourced from `examples` under
        `integer{base}` and out of the objective of `SRS` package which
        is to take SRS samples.
  - Manually configured a GitHub Personal Access Token (PAT) following
    the
    [instructions](https://happygitwithr.com/github-pat.html#github-pat).
  - Run `use_github()` to connect the local `SRS` package and Git
    repository to a companion repository on GitHub.
  - Create `README` file by using `use_readme_rmd()`.
  - Manually modify the `README.Rmd` file and run `build_readme()` to
    render it.
  - Create a vignette file by using
    `use_vignette("Use_SRS_to_Show_CLT")`.
  - Manually modify it and run `build_vignettes()`
  - Final `check()` and `install()`.

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
#> [1] 2.019298
#> 
#> $sample.se
#> [1] 7.578372
#> 
#> $SRS
#>            [,1]     [,2]     [,3]     [,4]      [,5]      [,6]     [,7]
#> [1,] -0.4799486 7.683048 10.87815 4.995747 -10.77189 -6.922257 5.732349
#>          [,8]      [,9]    [,10]
#> [1,] 1.504306 -4.193149 11.76663

# take 20 SRS from x of size=10, show.SRS=FALSE
SRSampling(x=pop.1, size=10, rep=20)
#> 20 runs of simple random sample of size 10 are drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> $sample.mean$values
#>  [1] -0.353479370  4.770633472  2.601778970  0.616512965  3.385604865
#>  [6]  4.002300730 -3.461685982 -4.984999048 -0.330823958 -1.756088840
#> [11] -0.001711956 -0.268992378  5.560151591  0.813033040 -5.204764621
#> [16] -2.938876339 -0.706691314 -0.988461307  2.551409208  3.839545387
#> 
#> $sample.mean$mean
#> [1] 0.3572198
#> 
#> $sample.mean$se
#> [1] 3.121168
#> 
#> 
#> $sample.se
#> $sample.se$values
#>  [1]  8.592939 13.640969  6.534187 13.085601  9.555351 10.375627  9.880716
#>  [8]  6.134050  9.872862  8.525310  9.453290  8.740263 10.140801 11.317862
#> [15]  8.445545  8.496775  8.562406  8.145960  8.141842 14.494780
#> 
#> $sample.se$mean
#> [1] 9.606857
#> 
#> $sample.se$se
#> [1] 2.159994
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
#> [1] 3.217797
#> 
#> $sample.se
#> [1] 7.961463

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
