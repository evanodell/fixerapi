
#' Exchange rate time series
#'
#' @description Time series plans are only available on "professional" and
#' above plans. The maximum allowed length in a single request is 365 days.
#'
#' @description Each currency symbol is displayed in its own column, with a
#' value relative to the base currency on the given date.
#'
#' @description Time series data is only available for "Professional",
#' "Professional Plus" and "Enterprise" accounts.
#'
#' @param start_date The start date of requested time series, in "YYYY-MM-DD"
#' style, or any style convertable to  "YYYY-MM-DD" using `as.Date()`.
#' @param end_date The end date of requested time series, in "YYYY-MM-DD"
#' style, or any style convertable to  "YYYY-MM-DD" using `as.Date()`.
#' @inheritParams fixer_latest
#' @seealso [fixer_fluctuation()]
#'
#' @return A tibble with the exchange rate from the base currency to the given
#' currency symbols for each date in the requested range.
#'
#' @export
#' @examples \dontrun{
#'
#' x <- fixer_time_series(start_date = "2017-04-30", end_date = "2017-06-20",
#'                        base = "GBP", symbols = c("USD", "EUR"))
#'
#' }

fixer_time_series <- function(start_date, end_date,
                              base = "EUR", symbols = NULL) {
  date_query <- date_check(start_date, end_date)

  base_query <- paste0("&base=", base)

  symbols_query <- symbols_util(symbols)

  query <- paste0(
    "timeseries?access_key=", getOption("fixer.API.key"),
    "&start_date=", start_date, "&end_date=", end_date,
    base_query, symbols_query
  )

  df <- fixer_download(query)

  rates <- tibble::enframe(df$rates)

  rates$value <- lapply(rates$value, tibble::as.tibble)

  rates <- tidyr::unnest_(rates, "value")

  rates
}
