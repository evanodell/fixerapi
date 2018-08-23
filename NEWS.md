
# fixerapi 0.1.6

* Fixed #1, where `ifelse()` stripping attributes from variables caused errors
  in `fixer_historical()` (thanks @mhasanbulli).

* Added error messages to `fixer_convert()` for amounts >=100,000 and <=0.

* Added conversion from UNIX time to yyyy-mm-dd HH:mm:ss for `fixer_convert()`.

* Improved date handling in `fixer_fluctuation()` and `fixer_time_series()`.

* Increased test scenarios.


# fixerapi 0.1.5

* Fixed bug with `fixer_convert()` data parameter.

* Improved code coverage and documentation

* `fixer_account_type()` now sets account type as "free" unless "paid" 
is used as a parameter, rather than giving an error.

# fixerapi 0.1.4

* Fixed account type missing bug with HTTPS

# fixerapi 0.1.3

* Removed need to declare account type

* Fixed error that broke entire `fixer_convert()` function

# fixerapi 0.1.2

* Included proper citation information

* Fixed some spelling mistakes and improved clarity of vignette text

# fixerapi 0.1.1

* Fixed name and description to comply with CRAN policies.

# fixerapi 0.1.0

* First package release.

* Added a `NEWS.md` file to track changes to the package.
