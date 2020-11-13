test_that("is it an integer?", {
  expect_equal(is_wholenumber(2), TRUE)
  expect_equal(is_wholenumber(2.5), FALSE)
  expect_equal(is_wholenumber(c(1,1.5,2)), c(TRUE, FALSE, TRUE))
})
