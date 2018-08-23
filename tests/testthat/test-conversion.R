context("test-conversion.R")

test_that("conversion works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()


  x <- fixer_convert(from = "GBP", to = "JPY", amount = 25)
  expect_equal(class(x), "list")
  expect_equal(length(x), 5)
  expect_true(x$success)
  expect_equal(x$query$from, "GBP")
  expect_equal(as.Date(x$date), Sys.Date())


  y <- fixer_convert(from = "GBP", to = "JPY", amount = 25, date = "2018-04-15")
  expect_equal(class(y), "list")
  expect_equal(length(y), 6)
  expect_true(y$historical)
  expect_equal(y$result, 3828.94535)
  expect_true(y$success)
  expect_equal(y$query$from, "GBP")
  expect_equal(y$date, "2018-04-15")
})
