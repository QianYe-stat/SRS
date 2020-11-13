test_that("Is it a integer", {
  expect_equal(is_wholenumber(2), TRUE)
  expect_equal(is_wholenumber(2.5), FALSE)
  expect_equal(is_wholenumber(c(1,2.5,3)), c(TRUE,FALSE,TRUE))
})
