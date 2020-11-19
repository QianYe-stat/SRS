
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SRS

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![](https://img.shields.io/github/last-commit/QianYe-stat/SRS.svg)](https://github.com/QianYe-stat/SRS/commits/master)
[![GitHub
issues](https://img.shields.io/github/issues/QianYe-stat/SRS)](https://github.com/QianYe-stat/SRS/issues)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://cran.r-project.org/web/licenses/MIT)

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

## Code of Conduct

Please note that the SRS project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

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
    `test_that` functions to test `SRSampling` function. Likewise create
    tests for `is_wholenumber`.
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
  - Add a code of conduct by using `use_code_of_conduct()`, and describe
    the code of conduct in README.
  - Make a package website:
      - first install `pkgdown` package, and then run `use_pkgdown()`
        and `pkgdown::build_site()`;
      - create Github Pages based on `/docs`;
      - Please see the package website
        [here](https://qianye-stat.github.io/SRS/)
  - Create the `NEWS.md` file using `use_news_md()` and modify it.
  - Use `badger` to add badges.
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
#> [1] -3.039676
#> 
#> $sample.se
#> [1] 4.912975
#> 
#> $SRS
#>           [,1]      [,2]      [,3]      [,4]       [,5]     [,6]      [,7]
#> [1,] -5.006548 -10.07339 -10.35358 0.3601517 -0.7644633 3.230316 -5.820861
#>          [,8]      [,9]     [,10]
#> [1,] 3.436945 -1.212003 -4.193337

# take 20 SRS from x of size=10, show.SRS=FALSE
SRSampling(x=pop.1, size=10, rep=20)
#> 20 runs of simple random sample of size 10 are drawn from x
#> 
#> The SRS for each run of samplings are NOT included in the result
#> $sample.mean
#> $sample.mean$values
#>  [1] -2.8360801 -1.1082398 -8.3983181 -5.0031040  0.4403522 -3.4828091
#>  [7] -1.1641312  1.1262584 -2.4292281  3.8162037 -7.8090442  0.3320144
#> [13]  0.4622417 -1.7011468 -1.8747509 -1.7828728  2.2672701 -4.4405368
#> [19]  2.0089850  3.2198488
#> 
#> $sample.mean$mean
#> [1] -1.417854
#> 
#> $sample.mean$se
#> [1] 3.326092
#> 
#> 
#> $sample.se
#> $sample.se$values
#>  [1] 10.373473  8.030585  7.442725  7.024444  4.814206  7.540554 13.348165
#>  [8] 13.286942  8.528937 10.332545  7.955165 11.456520 12.740946 12.317868
#> [15]  8.362982  8.832477 12.362353  7.001484 12.401753  8.182695
#> 
#> $sample.se$mean
#> [1] 9.616841
#> 
#> $sample.se$se
#> [1] 2.519184
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
#> [1] -6.410778
#> 
#> $sample.se
#> [1] 12.14222

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
