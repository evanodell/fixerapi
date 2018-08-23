context("test-errors.R")

test_that("errors works", {
  skip_on_cran()

  expect_error(fixer_fluctuation())
})
