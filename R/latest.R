

#' Latest exchange rates
#'
#' Returns a tibble with the most recently available currency conversion data
#' available from the Fixer API
#'
#' @param base The base currency to index other currencies against.
#' Defaults to \code{"EUR"}. Can only be changed with paid plans.
#' @param symbols A character vector of the symbols of currencies to return
#' exchange rates for, or a string for a single currency. Defaults to
#' \code{NULL} and returns all available currencies. See
#' \code{\link{fixer_symbols}} for details on symbol options.
#' @return A tibble with the latest available currency exchange data.
#' @export
#'
#' @examples \dontrun{
#'
#' today <- fixer_latest()
#'
#' today_usd <- fixer_latest(base = "USD")
#'
#' }
#'

fixer_latest <- function(base = "EUR", symbols = NULL) {
  base_query <- base_util(base)

  symbols_query <- symbols_util(symbols)

  query <- paste0(
    fixer_url, "latest?access_key=", fixer_api_key(),
    base_query, symbols_query
  )

  df <- jsonlite::fromJSON(query)

  df <- success_check(df)

  rates <- tibble::enframe(df$rates)

  rates$value <- as.numeric(rates$value)

  rates
}
