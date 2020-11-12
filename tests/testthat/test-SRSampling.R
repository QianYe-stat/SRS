test_that("exceeded size test", expect_error(SRSampling(x=rnorm(10), size=11), "size must be no greater than the length of x"))

test_that("length of (x)= 1 test",expect_error(SRSampling(x=rnorm(1), size=1), "x must be a numeric vector with length >1"))

rep <- 20
test_that("length of sample means", expect_length(SRSampling(x=rnorm(100), size=10, rep=20)$sample.mean$value, rep))


test_that("names of the output list with show.SRS=T", expect_named(SRSampling(x=rnorm(100), size=10, rep=20, show.SRS=TRUE),c("sample.mean","sample.se", "SRS")))

test_that("names of the output list", expect_named(SRSampling(x=rnorm(100), size=10, rep=20),c("sample.mean","sample.se")))


