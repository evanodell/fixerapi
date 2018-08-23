context("test-timeseries.R")

test_that("timeseriess works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- fixer_time_series(
    start_date = "2017-04-30", end_date = "2017-06-20",
    base = "GBP", symbols = c("USD", "EUR")
  )
  expect_equal(nrow(x), 52)
  expect_equal(x$USD[[1]], 1.293075)
  expect_true(tibble::is.tibble(x), TRUE)
})
