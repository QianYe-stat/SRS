
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
      - As I choose not to `@export` `is_wholenumber` function. So I
        didn’t write tests for `is_wholenumber`.
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
#> [1] 2.614929
#> 
#> $sample.se
#> [1] 8.456156
#> 
#> $SRS
#>          [,1]    [,2]     [,3]     [,4]     [,5]      [,6]      [,7]       [,8]
#> [1,] 7.083374 10.0046 13.05903 5.975289 9.309337 -12.70941 -5.744253 -0.9567718
#>          [,9]     [,10]
#> [1,] 6.118643 -5.990549

# take 20 SRS from x of size=10, show.SRS=FALSE
SRSampling(x=pop.1, size=10, rep=20)
#> 20 runs of simple random sample of size 10 are drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> $sample.mean$values
#>  [1] -0.6300666  7.8807660 -4.9809262  0.4883154 -1.0430935 -0.7576430
#>  [7] -3.6520578  2.3210404  4.5040856  0.2584504 -1.2786821  1.1946975
#> [13]  0.6514749 -6.3002398 -5.4111171 -4.7242833  3.4336017 -0.2264993
#> [19] -5.3640397 -4.2494531
#> 
#> $sample.mean$mean
#> [1] -0.8942835
#> 
#> $sample.mean$se
#> [1] 3.739882
#> 
#> 
#> $sample.se
#> $sample.se$values
#>  [1] 10.131897  8.882303 10.588940 13.557500  9.444486  9.873183  4.969128
#>  [8] 10.773341  5.877621  9.156449  8.291748 13.386972  6.534550  8.053787
#> [15]  9.086836  7.138654  8.462285  9.284469  7.503173 11.174989
#> 
#> $sample.se$mean
#> [1] 9.108616
#> 
#> $sample.se$se
#> [1] 2.200661
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
#> [1] -4.058842
#> 
#> $sample.se
#> [1] 11.54616

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
