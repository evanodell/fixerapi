context("test-flux.R")

test_that("flux works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  f <- fixer_fluctuation("2018-01-01", "2018-05-03")
  expect_equal(nrow(f), 168)
  expect_true(tibble::is.tibble(f))
  expect_equal(max(f$change_pct), 688)
  expect_equal(min(f$change_pct), -7.0457)

  flux_error <- expect_error(
    fixer_fluctuation("2016-01-01", "2018-05-03"),
    "Only 365 days of data can be returned at one time"
  )
})
