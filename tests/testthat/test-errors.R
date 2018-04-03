context("test-errors.R")

test_that("errors works", {
  expect_error(fixer_account_type(), 'Please use "free" or "paid".')

  expect_error(fixer_fluctuation())

  expect_error(fixer_fluctuation(
    start_date = "2018-01-01",
    end_date = "2018-02-02"
  ))
})
