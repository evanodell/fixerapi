
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/fixerapi)](https://cran.r-project.org/package=fixerapi)
[![GitHub
tag](https://img.shields.io/github/tag/evanodell/fixerapi.svg)](https://github.com/evanodell/fixerapi)
[![](https://cranlogs.r-pkg.org/badges/grand-total/fixerapi)](https://dgrtwo.shinyapps.io/cranview/)
[![Travis-CI Build
Status](https://travis-ci.org/evanodell/fixerapi.svg?branch=master)](https://travis-ci.org/evanodell/fixerapi)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/evanodell/fixerapi?branch=master&svg=true)](https://ci.appveyor.com/project/evanodell/fixerapi)
[![Coverage
Status](https://img.shields.io/codecov/c/github/evanodell/fixerapi/master.svg)](https://codecov.io/github/evanodell/fixerapi?branch=master)
[![DOI](https://zenodo.org/badge/127822432.svg)](https://zenodo.org/badge/latestdoi/127822432)

# fixerapi

`fixerapi` is an R client for the [fixer.io](https://fixer.io) currency
conversion and exchange rate API. The API requires registration and some
features are only available on paid accounts. Full API documentation is
available [here](https://fixer.io/documentation), and additional details
are available in the
[vignette](https://docs.evanodell.com/fixerapi/articles/introduction.html)

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("evanodell/fixerapi")
```

## Using `fixerapi`

To access a `tibble` with the name and currency symbol (a three letter
code) for all currencies available through the API, use
`fixer_symbols()`.

There are five currency exchange query types, which
[fixer.io](https://fixer.io) calls endpoints. They are:

  - Current exchange rates, accessed using `fixer_latest()` (available
    with free account)
  - Historical exchange rates on a given date, using
    `fixer_historical()` (available on all paid accounts)
  - Conversion from one currency to another, either currently or on a
    specific date, using `fixer_convert()` (available on all paid
    accounts)
  - A time series of up to 365 days showing daily exchange rates over
    that time, using `fixer_time_series()` (available on “professional”
    and higher grade accounts)
  - Exchange rate fluctuations over a period of up to 365 days, using
    `fixer_fluctuation()` (available on “professional plus” and
    “enterprise” grade accounts)

With the exception of `fixer_convert()`, which is limited to two
currencies, all functions give an option for a base currency that is
indexed to 1 and other currencies are compared to – the default is the
Euro – and to limit the currencies it is compared with, using the
`symbols` parameter, which takes a character vector of currency symbols.
If no symbols are specified, all available currencies are returned.

``` r
library(fixer)
today_symbols <- fixer_latest(base = "EUR", 
                              symbols = c("JPY", "GBP", "USD", "CAD", "CHF"))

print(today_symbols)

#> A tibble: 5 x 2
#>   name    value
#>   <chr>   <dbl>
#> 1 JPY   131.   
#> 2 GBP     0.873
#> 3 USD     1.23 
#> 4 CAD     1.57 
#> 5 CHF     1.18 
```

The example above shows some exchange rates on 2018-04-03.

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
