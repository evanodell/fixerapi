

#' Currency fluctuation
#'
#' @description Returns fluctuation in currency exchange rates for one or more
#' currencies compared to the base currency over a given period of time. The
#' maximum time frame is 365 days.
#'
#' @description Currency fluctuation data is only available for
#' "Professional Plus" and "Enterprise" accounts.
#'
#' @param start_date The start date of requested time period.
#' @param end_date The end date of requested time period.
#' @inheritParams fixer_latest
#' @seealso fixer_time_series
#'
#' @return A tibble with the currency symbol, start rate, end rate, change and
#' change percentage over the requested time period. Each currency is given its
#' own row, with start rate, end rate, change and change percentage each in
#' their own columns.
#' @export
#'
#' @examples \dontrun{
#'
#' x <- fixer_fluctuation(start_date = "2018-02-25", end_date = "2018-02-26",
#' symbols = c("USD", "JPY"))
#'
#' }


fixer_fluctuation <- function(start_date, end_date,
                              base = "EUR", symbols = NULL) {
  date_check(start_date, end_date)

  base_query <- paste0("&base=", base)

  symbols_query <- symbols_util(symbols)

  query <- paste0(
    fixer_url, "fluctuation?access_key=", fixer_api_key(),
    "&start_date=", start_date, "&end_date=", end_date,
    base_query, symbols_query
  )

  df <- jsonlite::fromJSON(query)

  df <- success_check(df)

  rates <- enframe(df$rates)

  rates$value <- lapply(rates$value, tibble::as.tibble)

  rates <- tidyr::unnest_(rates, "value")

  rates
}
