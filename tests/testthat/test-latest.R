context("test-latest.R")

test_that("latest works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  cur <- fixer_latest(symbols = c("USD", "GBP", "JPY"))
  expect_equal(length(cur), 2)
  expect_true("USD" %in% cur$name)
  expect_true(is.tibble(cur))
  expect_equal(nrow(cur), 3)

})
