
#' Exchange rate time series
#'
#' @description Time series plans are only available on "professional" and
#' above plans. The maximum allowed length in a single request is 365 days.
#'
#' @description Each currency symbol is displayed in its own column, with a
#' value relative to the base currency on the given date.
#'
#' @param start_date The start date of requested time series.
#' @param end_date The end date of requested time series.
#' @inheritParams fixer_latest
#'
#' @return A tibble with the exchange rate from the base currency to the given
#' currency symbols for each date in the requested range.
#'
#' @export
#' @examples \dontrun{
#'
#' x <- fixer_time_series(start_date = "2017-04-30", end_date = "2017-06-20")
#'
#' }

fixer_time_series <- function(start_date, end_date,
                              base = "EUR", symbols = NULL) {
  time_check()

  date_check(start_date, end_date)

  base_query <- base_util(base)

  symbols_query <- symbols_util(symbols)

  query <- paste0(
    fixer_url, "timeseries?access_key=", fixer_api_key(),
    "&start_date=", start_date, "&end_date=", end_date,
    base_query, symbols_query
  )

  df <- jsonlite::fromJSON(query)

  df <- success_check(df)

  rates <- tibble::enframe(df$rates)

  rates$value <- lapply(rates$value, tibble::as.tibble)

  rates <- tidyr::unnest_(rates, "value")

  rates
}
