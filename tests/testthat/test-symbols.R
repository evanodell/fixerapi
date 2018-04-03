context("test-symbols.R")

test_that("symbols work", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  syms <- fixer_symbols()
  expect_equal(length(syms), 2)
  expect_true("USD" %in% syms$name)
  expect_true(is.tibble(syms))

})
