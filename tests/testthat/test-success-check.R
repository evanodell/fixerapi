context("test-success-check")

test_that("success check works works", {
  skip_on_cran()
  query <- "convert?access_key=badApiKey&from=GBP&to=JPY&amount=25"

  expect_error(test <- fixerapi:::fixer_download(query))
})
