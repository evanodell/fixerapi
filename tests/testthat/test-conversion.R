context("test-conversion.R")

test_that("conversion works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- fixer_convert(from = "GBP", to = "JPY", amount = 25, date = "2018-04-15")
  expect_equal(class(x), "list")
  expect_equal(length(x), 5)
  expect_equal(x$result, 3838.919)
  expect_true(x$success)
  expect_equal(x$query$from, "GBP")
})
